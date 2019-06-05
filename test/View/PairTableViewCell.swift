import UIKit

final class PairTableViewCell: UITableViewCell {
    
    @IBOutlet private weak var baseCurrencyCountLabel: UILabel!
    @IBOutlet private weak var baseCurrencyNameLabel: UILabel!
    @IBOutlet private weak var destCurrencyCountLabel: UILabel!
    @IBOutlet private weak var destCurrencyNameLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        baseCurrencyCountLabel.font = baseCurrencyCountLabel.font.withSize(24)
        baseCurrencyNameLabel.font = baseCurrencyNameLabel.font.withSize(16)
        baseCurrencyNameLabel.textColor = .gray
        destCurrencyCountLabel.font = destCurrencyCountLabel.font.withSize(24)
        destCurrencyNameLabel.font = destCurrencyNameLabel.font.withSize(16)
        destCurrencyNameLabel.textColor = .gray
    }

    func setContent() {
//        baseCurrencyCountLabel
//        baseCurrencyNameLabel
//        destCurrencyCountLabel
//        destCurrencyNameLabel
    }
    
}
