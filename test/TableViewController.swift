import UIKit
import Kingfisher

final class TableViewController: UITableViewController {
    
    let refControl: UIRefreshControl = {
        let refresh = UIRefreshControl(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        refresh.addTarget(self, action: #selector(TableViewController.refresh), for: UIControl.Event.valueChanged)
        return refresh
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.refreshControl = refControl
    }
    
    @objc private func refresh() {
        refreshControl?.endRefreshing()
    }
    
}

