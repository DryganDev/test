import UIKit
import Kingfisher

final class RatesTableViewController: BaseTableViewController {
    
    @IBOutlet private weak var addButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if DataManager.shared.currencyList.isEmpty {
            DataManager.shared.getCurrencyList { [weak self] error in
                self?.tableView.reloadData()
            }
        }
    }
    
    override func refresh() {
        
    }
    
    @IBAction func unwindToRates(_ unwindSegue: UIStoryboardSegue) {
        let sourceViewController = unwindSegue.source as! SecondTableViewController
        let firstCurrency: String = sourceViewController.firstCurrency
        let secondCurrency: String = sourceViewController.secondCurrency
        DataManager.shared.getPair(firstCurrency: firstCurrency, secondCurrency: secondCurrency) { [weak self] pair, error in
            self?.tableView.reloadData()
//            defer { self?.tableView.reloadData() }
//            guard let pair = pair else { return }
        }
        // Use data from the view controller which initiated the unwind segue
    }
    
}

extension RatesTableViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataManager.shared.pairs.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PairTableViewCell", for: indexPath) as! PairTableViewCell
        return cell
    }
    
}
