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
		var previousView: UIView?
		var previousActivityLabel: UILabel?
		var dateLabel: UILabel
		var activityLabel: UILabel
		var containerView: UIView

		let color = UIColor(red: 72/255, green: 135/255, blue: 223/255, alpha: 1)

		for dateActivity in activities {
			containerView = UIView()
			addSubview(containerView)
			containerView.backgroundColor = color
			containerView.layer.borderColor = color.cgColor
			containerView.layer.cornerRadius = 5.0
			containerView.layer.borderWidth = 2.0
			containerView.translatesAutoresizingMaskIntoConstraints = false

			dateLabel = UILabel()
			dateLabel.font = UIFont.boldSystemFont(ofSize: 20)
			dateLabel.textColor = .white
			containerView.addSubview(dateLabel)
			dateLabel.translatesAutoresizingMaskIntoConstraints = false
			dateLabel.text = "Fecha: " + dateActivity.date
			dateLabel.textAlignment = .center
			dateLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 5).isActive = true
			dateLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -5).isActive = true
			dateLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 5).isActive = true
			containerView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
			containerView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true

			if let view = previousView {
				containerView.topAnchor.constraint(equalTo: view.bottomAnchor, constant: 25).isActive = true
			} else {
				containerView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
			}
			previousView = containerView

			for activity in dateActivity.activities {
				activityLabel = UILabel()
				activityLabel.text = "» " + activity
				activityLabel.font = UIFont.boldSystemFont(ofSize: 17)
				activityLabel.textColor = .white
				activityLabel.numberOfLines = 0
				activityLabel.lineBreakMode = .byWordWrapping
				containerView.addSubview(activityLabel)
				activityLabel.translatesAutoresizingMaskIntoConstraints = false
				activityLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 10).isActive = true
				activityLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20).isActive = true
				if let label = previousActivityLabel {
					activityLabel.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 5).isActive = true
				} else {
					activityLabel.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 15).isActive = true
				}
				previousActivityLabel = activityLabel
			}
			previousActivityLabel?.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -10).isActive = true
			previousActivityLabel = nil
		}
	}

	//MARK: - Actions

}
