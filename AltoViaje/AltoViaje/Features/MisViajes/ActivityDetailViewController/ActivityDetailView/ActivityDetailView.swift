//
//  ActivityCoolView.swift
//  AltoViaje
//
//  Created by Agustin Palmeira on 26/06/2019.
//  Copyright © 2019 AltoViaje. All rights reserved.
//

import Foundation
import UIKit

class ActivityDetailView: UIView {

	//MARK: - Variables
	var activity: TourActivity!

	//MARK: - Initializers

	init(withActivity activity: TourActivity) {
		super.init(frame: .zero)
		backgroundColor = .white
		self.activity = activity
		setSubViews()
	}

	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	//MARK: - Configure views
	private func setSubViews() {
		let titleLabel = UILabel()
		titleLabel.text = activity.title
		addSubview(titleLabel)
		titleLabel.translatesAutoresizingMaskIntoConstraints = false
		titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 5).isActive = true
		titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5).isActive = true
		titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5).isActive = true

		let dateLabel = UILabel()
		dateLabel.text = DateFormatter().string(from: activity.date, with: "dd/MM/YY")
		addSubview(dateLabel)
		dateLabel.translatesAutoresizingMaskIntoConstraints = true
		dateLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 5).isActive = true
		dateLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor).isActive = true
		dateLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor).isActive = true

		let descriptionTextView = UITextView()
		descriptionTextView.text = activity.description
		addSubview(descriptionTextView)
		descriptionTextView.translatesAutoresizingMaskIntoConstraints = true
		descriptionTextView.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 20).isActive = true
		descriptionTextView.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor).isActive = true
		descriptionTextView.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor).isActive = true
		descriptionTextView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5).isActive = true
	}
}
