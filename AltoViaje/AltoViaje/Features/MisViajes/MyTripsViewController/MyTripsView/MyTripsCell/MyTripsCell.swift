//
//  MyTripsCell.swift
//  AltoViaje
//
//  Created by Agustin Palmeira on 08/06/2019.
//  Copyright © 2019 AltoViaje. All rights reserved.
//

import Foundation
import UIKit

protocol MyTripsCellDelegate: class {
	func deletePackage(indexPath: IndexPath)
}

class MyTripsCell: UITableViewCell {

	//MARK: - Variables
	static let cellIdentifier = "MyTripsCell"
	weak var delegate: MyTripsCellDelegate?
	var indexPath: IndexPath?

	@IBOutlet weak var deleteButton: UIButton!
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

        dateFromLabel.layer.shadowColor = UIColor.black.cgColor
        dateFromLabel.layer.shadowRadius = 3.0
        dateFromLabel.layer.shadowOpacity = 1.0
        dateFromLabel.layer.shadowOffset = CGSize(width: 4, height: 4)
        dateFromLabel.layer.masksToBounds = false

        dateToLabel.layer.shadowColor = UIColor.black.cgColor
        dateToLabel.layer.shadowRadius = 3.0
        dateToLabel.layer.shadowOpacity = 1.0
        dateToLabel.layer.shadowOffset = CGSize(width: 4, height: 4)
        dateToLabel.layer.masksToBounds = false

        destinyTitleLabel.layer.shadowColor = UIColor.black.cgColor
        destinyTitleLabel.layer.shadowRadius = 3.0
        destinyTitleLabel.layer.shadowOpacity = 1.0
        destinyTitleLabel.layer.shadowOffset = CGSize(width: 4, height: 4)
        destinyTitleLabel.layer.masksToBounds = false
	}

	//MARK: - 
	override func setSelected(_ selected: Bool, animated: Bool) {
		super.setSelected(selected, animated: animated)
	}

	//MARK: - Actions
	@IBAction func deleteButtonTouched(_ sender: Any) {
		if let indexP = indexPath {
			delegate?.deletePackage(indexPath: indexP)
		}
	}
}
