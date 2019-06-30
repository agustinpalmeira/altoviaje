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
		titleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 15).isActive = true
		titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5).isActive = true
		titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5).isActive = true

		titleLabel.textAlignment = .center
		titleLabel.sizeToFit()
		titleLabel.font = UIFont.boldSystemFont(ofSize: 22)
		titleLabel.textColor = .white
		titleLabel.numberOfLines = 0
		titleLabel.lineBreakMode = .byWordWrapping
		titleLabel.layer.shadowColor = UIColor.black.cgColor
		titleLabel.layer.shadowRadius = 2.0
		titleLabel.layer.shadowOpacity = 1.0
		titleLabel.layer.shadowOffset = CGSize(width: 2, height: 2)
		titleLabel.layer.masksToBounds = false

		let dateLabel = UILabel()
		dateLabel.text = "Fecha: " + DateFormatter().string(from: activity.date, with: "dd/MM/YYYY")
		addSubview(dateLabel)
		dateLabel.translatesAutoresizingMaskIntoConstraints = false
		dateLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 25).isActive = true
		dateLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor, constant: 20).isActive = true
		dateLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor).isActive = true

		dateLabel.textAlignment = .left
		dateLabel.sizeToFit()
		dateLabel.font = UIFont.boldSystemFont(ofSize: 18)
		dateLabel.textColor = .white
		dateLabel.numberOfLines = 0
		dateLabel.lineBreakMode = .byWordWrapping
		dateLabel.layer.shadowColor = UIColor.black.cgColor
		dateLabel.layer.shadowRadius = 2.0
		dateLabel.layer.shadowOpacity = 1.0
		dateLabel.layer.shadowOffset = CGSize(width: 2, height: 2)
		dateLabel.layer.masksToBounds = false

		let descriptionTextView = UITextView()
		descriptionTextView.text = activity.description
		addSubview(descriptionTextView)
		descriptionTextView.translatesAutoresizingMaskIntoConstraints = false
		descriptionTextView.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 30).isActive = true
		descriptionTextView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive = true
		descriptionTextView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20).isActive = true
		descriptionTextView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height * 0.3).isActive = true
		descriptionTextView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -40).isActive = true

		descriptionTextView.layer.cornerRadius = 10.0
		descriptionTextView.layer.borderWidth = 2.0
		descriptionTextView.layer.borderColor = UIColor.black.cgColor

	}
}
