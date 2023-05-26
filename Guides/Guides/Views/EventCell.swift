//
//  EventCell.swift
//  Guides
//
//  Created by Dave Alton on 2023-05-26.
//

import UIKit

class EventCell: UITableViewCell {
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var locationLabel: UILabel!

    func reset() {
        nameLabel.text = nil
        dateLabel.text = nil
        locationLabel.text = nil
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        reset()
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        reset()
    }
}
