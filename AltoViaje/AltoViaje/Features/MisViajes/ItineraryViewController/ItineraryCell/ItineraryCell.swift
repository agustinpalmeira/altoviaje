//
//  ItineraryCell.swift
//  AltoViaje
//
//  Created by Agustin Palmeira on 27/06/2019.
//  Copyright © 2019 AltoViaje. All rights reserved.
//

import Foundation
import UIKit

class ItineraryCell: UITableViewCell {
	//MARK: - Variables
	static var identifier: String = "itineraryCellIdentifier"
	var activityLabel: UILabel!


	//MARK: - Initialization
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		backgroundColor = .clear

		setSubviews()
	}

	private func setSubviews() {
		let itemLabel = getActivityLabel()
		itemLabel.text = "»"
		addSubview(itemLabel)
		itemLabel.translatesAutoresizingMaskIntoConstraints = false
		itemLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
		itemLabel.widthAnchor.constraint(equalToConstant: 20.0).isActive = true
		itemLabel.topAnchor.constraint(equalTo: topAnchor, constant: 5).isActive = true
		itemLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5).isActive = true

		let arrowImageView = UIImageView(image: #imageLiteral(resourceName: "white-arrow"))
		addSubview(arrowImageView)
		arrowImageView.translatesAutoresizingMaskIntoConstraints = false
		arrowImageView.contentMode = .scaleAspectFit
		arrowImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5).isActive = true
		arrowImageView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.width * 0.04).isActive = true
		arrowImageView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width * 0.04).isActive = true
		arrowImageView.centerYAnchor.constraint(equalTo: itemLabel.centerYAnchor).isActive = true

		activityLabel = getActivityLabel()
		addSubview(activityLabel)
		activityLabel.translatesAutoresizingMaskIntoConstraints = false
		activityLabel.leadingAnchor.constraint(equalTo: itemLabel.trailingAnchor, constant: 5).isActive = true
		activityLabel.trailingAnchor.constraint(equalTo: arrowImageView.leadingAnchor, constant: -5).isActive = true
		activityLabel.topAnchor.constraint(equalTo: itemLabel.topAnchor).isActive = true
		activityLabel.bottomAnchor.constraint(equalTo: itemLabel.bottomAnchor).isActive = true
	}

	func setup(withActivity text: String) {
		activityLabel.text = text
	}

	private func getActivityLabel() -> UILabel {
		let activityLabel = UILabel()
		activityLabel.textAlignment = .left
		activityLabel.sizeToFit()
		activityLabel.font = UIFont.boldSystemFont(ofSize: 18)
		activityLabel.textColor = .white
		activityLabel.numberOfLines = 0
		activityLabel.lineBreakMode = .byWordWrapping
		activityLabel.layer.shadowColor = UIColor.black.cgColor
		activityLabel.layer.shadowRadius = 2.0
		activityLabel.layer.shadowOpacity = 1.0
		activityLabel.layer.shadowOffset = CGSize(width: 2, height: 2)
		activityLabel.layer.masksToBounds = false

		return activityLabel
	}
}
