import Foundation
import UIKit

class BaseTableViewController: UITableViewController {
    
    lazy var refControl: UIRefreshControl = {
        let refresh = UIRefreshControl()
        refresh.addAction(.valueChanged) { [weak self] _ in
            self?.refresh()
        }
        return refresh
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        refreshControl = refControl
    }
    
    func refresh() {
        
    }
    
}
