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

		for dateActivity in activities {
			containerView = UIView()
			addSubview(containerView)
			containerView.translatesAutoresizingMaskIntoConstraints = false

			dateLabel = UILabel()
			containerView.addSubview(dateLabel)
			dateLabel.translatesAutoresizingMaskIntoConstraints = false
			dateLabel.text = dateActivity.date
			dateLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor).isActive = true
			dateLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor).isActive = true
			dateLabel.topAnchor.constraint(equalTo: containerView.topAnchor).isActive = true
			containerView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
			containerView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true

			if let view = previousView {
				containerView.topAnchor.constraint(equalTo: view.bottomAnchor, constant: 5).isActive = true
			} else {
				containerView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 5).isActive = true
			}
			previousView = containerView

			for activity in dateActivity.activities {
				activityLabel = UILabel()
				activityLabel.text = activity
				containerView.addSubview(activityLabel)
				activityLabel.translatesAutoresizingMaskIntoConstraints = false
				activityLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 10).isActive = true
				activityLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor).isActive = true
				if let label = previousActivityLabel {
					activityLabel.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 5).isActive = true
				} else {
					activityLabel.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 5).isActive = true
				}
				previousActivityLabel = activityLabel
			}
			previousActivityLabel?.bottomAnchor.constraint(equalTo: containerView.bottomAnchor).isActive = true
			previousActivityLabel = nil
		}
	}

	//MARK: - Actions

}
