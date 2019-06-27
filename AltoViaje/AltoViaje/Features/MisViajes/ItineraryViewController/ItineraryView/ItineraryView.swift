//
//  ItineraryView.swift
//  AltoViaje
//
//  Created by Agustin Palmeira on 09/06/2019.
//  Copyright © 2019 AltoViaje. All rights reserved.
//

import Foundation
import UIKit

protocol ItineraryViewDelegate: class {
	func openMap(title: String)
}

class ItineraryView: UIView {

	//MARK: - Variables
	var activities: [DateActivity]!
	weak var delegate: ItineraryViewDelegate?

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
		var itemLabel: UILabel
		var containerView: UIView
		var activityButton: UIButton
		var activityInvisibleButton: UIButton

        let backgroundImage = UIImageView(image: #imageLiteral(resourceName: "backgroundApp"))
        addSubview(backgroundImage)
        backgroundImage.translatesAutoresizingMaskIntoConstraints = false
        backgroundImage.topAnchor.constraint(equalTo: topAnchor).isActive = true
        backgroundImage.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        backgroundImage.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        backgroundImage.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true

		let scrollView = UIScrollView()
		addSubview(scrollView)
		scrollView.translatesAutoresizingMaskIntoConstraints = false
		scrollView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor).isActive = true
		scrollView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
		scrollView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
		scrollView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true

		let contentView = UIView()
		scrollView.addSubview(contentView)
		contentView.translatesAutoresizingMaskIntoConstraints = false
		contentView.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
		contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
		contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive = true
		contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor).isActive = true
		contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true

		let color = UIColor(red: 72/255, green: 135/255, blue: 223/255, alpha: 1)

		for dateActivity in activities {
			containerView = UIView()
			contentView.addSubview(containerView)
			containerView.backgroundColor = color
			containerView.layer.borderColor = color.cgColor
			containerView.layer.cornerRadius = 5.0
			containerView.layer.borderWidth = 2.0
			containerView.translatesAutoresizingMaskIntoConstraints = false

			dateLabel = getDateLabel(text: dateActivity.date)
			containerView.addSubview(dateLabel)
			dateLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 5).isActive = true
			dateLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -5).isActive = true
			dateLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 5).isActive = true
			containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10).isActive = true
			containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10).isActive = true

			if let view = previousView {
				containerView.topAnchor.constraint(equalTo: view.bottomAnchor, constant: 25).isActive = true
			} else {
				containerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
			}
			previousView = containerView

			for activity in dateActivity.activities {
				itemLabel = getActivityLabel(text: "»")
				containerView.addSubview(itemLabel)
				itemLabel.translatesAutoresizingMaskIntoConstraints = false
				itemLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 10).isActive = true
				itemLabel.widthAnchor.constraint(equalToConstant: 20.0).isActive = true

				activityLabel = getActivityLabel(text: activity)
				containerView.addSubview(activityLabel)
				activityLabel.translatesAutoresizingMaskIntoConstraints = false
				activityLabel.leadingAnchor.constraint(equalTo: itemLabel.trailingAnchor, constant: 5).isActive = true
				activityLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20).isActive = true
				if let label = previousActivityLabel {
					activityLabel.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 10).isActive = true
				} else {
					activityLabel.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 20).isActive = true
				}
				itemLabel.topAnchor.constraint(equalTo: activityLabel.topAnchor).isActive = true
				itemLabel.bottomAnchor.constraint(equalTo: activityLabel.bottomAnchor).isActive = true
				previousActivityLabel = activityLabel

				activityButton = UIButton()
				activityButton.titleLabel?.text = activity
				activityButton.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
				containerView.addSubview(activityButton)
				activityButton.translatesAutoresizingMaskIntoConstraints = false
				activityButton.setBackgroundImage(#imageLiteral(resourceName: "white-arrow"), for: .normal)
				activityButton.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.width * 0.04).isActive = true
				activityButton.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width * 0.04).isActive = true
				activityButton.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -5).isActive = true
				activityButton.centerYAnchor.constraint(equalTo: activityLabel.centerYAnchor).isActive = true

				activityInvisibleButton = UIButton()
				activityInvisibleButton.titleLabel?.text = activity
				activityInvisibleButton.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
				containerView.addSubview(activityInvisibleButton)
				activityInvisibleButton.translatesAutoresizingMaskIntoConstraints = false
				activityInvisibleButton.trailingAnchor.constraint(equalTo: activityLabel.trailingAnchor).isActive = true
				activityInvisibleButton.leadingAnchor.constraint(equalTo: itemLabel.leadingAnchor).isActive = true
				activityInvisibleButton.topAnchor.constraint(equalTo: activityLabel.topAnchor).isActive = true
				activityInvisibleButton.bottomAnchor.constraint(equalTo: activityLabel.bottomAnchor).isActive = true
			}
			previousActivityLabel?.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -10).isActive = true
			previousActivityLabel = nil
		}
		previousView?.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
	}

	private func getActivityLabel(text: String) -> UILabel {
		let activityLabel = UILabel()
		activityLabel.text = text
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

	private func getDateLabel(text: String) -> UILabel {
		let dateLabel = UILabel()
		dateLabel.font = UIFont.boldSystemFont(ofSize: 22)
		dateLabel.textColor = .white
		dateLabel.translatesAutoresizingMaskIntoConstraints = false
		dateLabel.text = "Fecha: " + text
		dateLabel.textAlignment = .center
		dateLabel.layer.shadowColor = UIColor.black.cgColor
		dateLabel.layer.shadowRadius = 3.0
		dateLabel.layer.shadowOpacity = 1.0
		dateLabel.layer.shadowOffset = CGSize(width: 4, height: 4)
		dateLabel.layer.masksToBounds = false

		return dateLabel
	}

	//MARK: - Actions
	@objc
	func didTapButton(sender: UIButton) {
		if let text = sender.titleLabel?.text {
			delegate?.openMap(title: text)
		}
	}
}
