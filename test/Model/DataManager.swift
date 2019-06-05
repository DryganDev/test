import Foundation

let listUrl = URL(string: "https://gist.github.com/kvld/db1d00dea957e41d5522c76136538ea9/raw/8d45683d1bcdbfa1f1b696c21e3da210c362a38a/Currencies")!
let exchangeApi = URL(string: "https://api.exchangeratesapi.io/latest")!

final class DataManager {
    
    static let shared = DataManager()
    private init() {
        if let listData = UserDefaults.standard.object(forKey: "currencyList") as? Data {
            currencyList = (try? JSONDecoder().decode([[String]].self, from: listData)) ?? []
        }
        if let pairsData = UserDefaults.standard.object(forKey: "pairs") as? Data {
            pairs = (try? JSONDecoder().decode([Pair].self, from: pairsData)) ?? []
        }
    }
    
    lazy var dispatchQueue = DispatchQueue(label: "listQueue")
    let networkManager = NetworkManager()
    //Cache
    var currencyList: [[String]] = []
    var pairs: [Pair] = []
    
}

extension DataManager {
    
    func getPair(firstCurrency: String, secondCurrency: String, completion: @escaping (Pair?, Error?) -> Void) {
        do {
            let finalUrl = try createUrl(firstCurrency: firstCurrency, secondCurrency: secondCurrency)
            let urlRequest = URLRequest(url: finalUrl)
            networkManager.executeRequest(urlRequest) { [weak self] pair, error in
                guard let `self` = self else { completion(nil, error); return }
                guard let pair = pair else { completion(nil, error); return }
                do {
                    self.pairs.append(pair)
                    let data = try JSONEncoder().encode(self.pairs)
                    UserDefaults.standard.set(data, forKey: "currencyList")
                } catch let e {
                    completion(e)
                }
            }
        } catch {
            completion(nil, error)
        }
    }
    
    private func createUrl(firstCurrency: String, secondCurrency: String) throws -> URL {
        let queryItems = [URLQueryItem(name: "base", value: firstCurrency), URLQueryItem(name: "symbols", value: secondCurrency)]
        guard var urlComponents = URLComponents(url: exchangeApi, resolvingAgainstBaseURL: false) else { throw TTError.invalidUrl }
        urlComponents.queryItems = queryItems
        guard let finalUrl = urlComponents.url else { throw TTError.invalidUrl }
        return finalUrl
    }
    
    func getCurrencyList(completion: @escaping (Error?) -> Void) {
        
        dispatchQueue.sync {
            do {
                let list = try String(contentsOf: listUrl).split(separator: "\n").map { $0.components(separatedBy: " - ") }

                let data = try JSONEncoder().encode(list)
                DispatchQueue.main.async {
                    UserDefaults.standard.set(data, forKey: "currencyList")
                    completion(nil)
                }
            } catch {
                DispatchQueue.main.async {
                    completion(error)
                }
            }
            
        }
        
        
    }
    
}
