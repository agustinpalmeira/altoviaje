//
//  MyTripsCell.swift
//  AltoViaje
//
//  Created by Agustin Palmeira on 08/06/2019.
//  Copyright © 2019 AltoViaje. All rights reserved.
//

import Foundation
import UIKit

class MyTripsCell: UITableViewCell {

	//MARK: - Variables
	static let cellIdentifier = "MyTripsCell"

	@IBOutlet weak var cellContainerView: UIView!
	@IBOutlet weak var placeImageView: UIImageView!
	@IBOutlet weak var dateFromLabel: UILabel!
	@IBOutlet weak var dateToLabel: UILabel!
	@IBOutlet weak var destinyTitleLabel: UILabel!

	//MARK: - Initialization
	override func awakeFromNib() {
		super.awakeFromNib()
		cellContainerView.layer.borderColor = UIColor.black.cgColor
		cellContainerView.layer.cornerRadius = 10
		cellContainerView.layer.borderWidth = 1
	}

	//MARK: - 
	override func setSelected(_ selected: Bool, animated: Bool) {
		super.setSelected(selected, animated: animated)
	}
}
