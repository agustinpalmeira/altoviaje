//
//  InventoryHeaderView.swift
//  AltoViaje
//
//  Created by Nicolas Alvarez on 6/13/19.
//  Copyright © 2019 AltoViaje. All rights reserved.
//

import UIKit

class InventoryHeaderView: UITableViewHeaderFooterView {

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var headerTitle: UILabel!
    
    override func awakeFromNib() {
        containerView.layer.cornerRadius = 15
    }

}
