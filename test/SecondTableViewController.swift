import Foundation
import UIKit

final class SecondTableViewController: BaseTableViewController {
    
    var firstCurrency: String!
    var secondCurrency: String!
    
}

extension SecondTableViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataManager.shared.currencyList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CurrencyTableViewCell", for: indexPath) as! CurrencyTableViewCell
        cell.setContent(DataManager.shared.currencyList[indexPath.row])
        return cell
    }
    
    override func unwind(for unwindSegue: UIStoryboardSegue, towards subsequentVC: UIViewController) {
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let cell = sender as? CurrencyTableViewCell else { return }
        guard let indexPath = tableView.indexPath(for: cell) else { return }
        secondCurrency = DataManager.shared.currencyList[indexPath.row].first
    }
    
}
