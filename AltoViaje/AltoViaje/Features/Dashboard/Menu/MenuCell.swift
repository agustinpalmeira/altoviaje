//
//  MenuCell.swift
//  AltoViaje
//
//  Created by Nicolas Alvarez on 6/2/19.
//  Copyright © 2019 AltoViaje. All rights reserved.
//

import UIKit

class MenuCell: UICollectionViewCell {
    static let itemIdentifier = "MenuCell"
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var menuIcon: UIImageView!
    @IBOutlet weak var menuTitle: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        containerView.layer.cornerRadius = 35
        containerView.layer.borderColor = UIColor.black.cgColor
        containerView.layer.borderWidth = 2
    }

    func configureCell(_ model: MenuItemModel) {
        menuIcon.image = model.image
        menuTitle.text = model.name
    }

}
