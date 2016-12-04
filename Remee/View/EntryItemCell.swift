import UIKit
import Kingfisher

class EntryItemCell: UITableViewCell {

    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var countLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    func update(withItem entry: Entry) {
        titleLabel.text = entry.title
        countLabel.text = "count: \(entry.count)"
        if entry.image != nil {
            thumbnailImageView.kf.setImage(with: entry.image)
        } else if entry.imageL?.url != nil {
            thumbnailImageView.kf.setImage(with: entry.imageL?.url)
        }
    }
}

