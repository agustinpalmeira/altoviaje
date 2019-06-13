//
//  InventoryViewCell.swift
//  AltoViaje
//
//  Created by Nicolas Alvarez on 6/12/19.
//  Copyright © 2019 AltoViaje. All rights reserved.
//

import UIKit

class InventoryViewCell: UITableViewCell {
    static let identifier = "InventoryCell"

    @IBOutlet weak var itemImage: UIImageView!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var checkContainer: UIView!
    @IBOutlet weak var checkIcon: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        checkContainer.layer.borderColor = UIColor.black.cgColor
        checkContainer.layer.borderWidth = 1
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        UIView.animate(withDuration: 0.2) { [weak self] in
            self?.checkIcon.alpha = selected ? 1 : 0
        }
    }

    func setupCell(_ item: Buyable) {
        itemImage.image = item.image
        descriptionLabel.text = item.name

        if item is Housing {
            priceLabel.text = "$\(item.price)/N"
        } else {
            priceLabel.text = "$\(item.price)"
        }

    }
    
}
