//
//  DashboardCell.swift
//  AltoViaje
//
//  Created by Nicolas Alvarez on 6/2/19.
//  Copyright © 2019 AltoViaje. All rights reserved.
//

import UIKit

class DashboardCell: UITableViewCell {
    static let cellIdentifier = "DashboardCell"
    @IBOutlet weak var containerView: UIView!
    
    @IBOutlet weak var placeTitle: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        containerView.layer.borderColor = UIColor.black.cgColor
        containerView.layer.cornerRadius = 10
        containerView.layer.borderWidth = 1
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
