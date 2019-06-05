import UIKit

final class CurrencyTableViewCell: UITableViewCell {
    @IBOutlet private weak var shortNameLabel: UILabel!
    @IBOutlet private weak var lognNameLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setContent(_ content: [String]) {
        shortNameLabel.text = content.first
        lognNameLabel.text = content.last
    }

}
