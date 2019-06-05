import Foundation
import UIKit

final class FirstTableViewController: BaseTableViewController { }

extension FirstTableViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataManager.shared.currencyList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CurrencyTableViewCell", for: indexPath) as! CurrencyTableViewCell
        cell.setContent(DataManager.shared.currencyList[indexPath.row])
        return cell
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let vc = segue.destination as? SecondTableViewController else { return }
        guard let cell = sender as? CurrencyTableViewCell else { return }
        guard let indexPath = tableView.indexPath(for: cell) else { return }
        vc.firstCurrency = DataManager.shared.currencyList[indexPath.row].first
        
    }
    
}
