//
//  ItineraryView.swift
//  AltoViaje
//
//  Created by Agustin Palmeira on 09/06/2019.
//  Copyright © 2019 AltoViaje. All rights reserved.
//

import Foundation
import UIKit

class ItineraryView: UIView {

	//MARK: - Variables
	var activities: [DateActivity]!

//	let userNameTextFieldFloating: MDCTextField = {
//		let textField = MDCTextField()
//		textField.placeholder = ContactUsTexts.username
//
//		return textField
//	}()

	//MARK: - Initializers

	init(activities: [DateActivity]) {
		super.init(frame: .zero)
		backgroundColor = .white
		self.activities = activities
		setSubViews()
	}

	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	//MARK: - Configure views
	private func setSubViews() {
		//TODO: Implement the logic to load all the dates activities.
		var previousView: UIView?
		var dateLabel: UILabel
		var activityLabel: UILabel
		var containerView: UIView

		for dateActivity in activities {
			containerView = UIView()
			addSubview(containerView)
			dateLabel = UILabel()
			containerView.addSubview(dateLabel)
			dateLabel.text = dateActivity.date

			dateLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor).isActive = true
			dateLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor).isActive = true
			dateLabel.topAnchor.constraint(equalTo: containerView.topAnchor).isActive = true
			dateLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor).isActive = true

			containerView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
			containerView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true

			if let view = previousView {
				containerView.topAnchor.constraint(equalTo: view.bottomAnchor, constant: 5).isActive = true
			} else {
				containerView.topAnchor.constraint(equalTo: topAnchor, constant: 5).isActive = true
			}
			previousView = containerView

//			for activity in dateActivity.activities {
//				activityLabel = UILabel()
//				addSubview(activityLabel)
//				activityLabel.text = activity
//			}
		}
	}

	//MARK: - Actions

}
