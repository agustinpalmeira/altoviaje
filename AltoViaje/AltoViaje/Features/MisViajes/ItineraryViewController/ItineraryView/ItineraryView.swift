////
////  ItineraryView.swift
////  AltoViaje
////
////  Created by Agustin Palmeira on 09/06/2019.
////  Copyright © 2019 AltoViaje. All rights reserved.
////
//
//import Foundation
//import UIKit
//
//protocol ItineraryViewDelegate: class {
//	func openMap(title: String)
//}
//
//class ItineraryView: UIView {
//
//	//MARK: - Variables
//	var activities: [DateActivity]!
//	var tableView: UITableView!
//	weak var delegate: ItineraryViewDelegate?
//
//	//MARK: - Initializers
//
//	init(activities: [DateActivity]) {
//		super.init(frame: .zero)
//		backgroundColor = .white
//		self.activities = activities
//		setSubViews()
//	}
//
//	required init?(coder aDecoder: NSCoder) {
//		fatalError("init(coder:) has not been implemented")
//	}
//
//	//MARK: - Configure views
//	private func setSubViews() {
//		tableView = UITableView()
//		tableView.translatesAutoresizingMaskIntoConstraints = false
//		tableView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
//		tableView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
//		tableView.topAnchor.constraint(equalTo: topAnchor).isActive = true
//		tableView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
//
//		//tableView.backgroundColor = .none
//		tableView.delegate = self
//		tableView.dataSource = self
//		tableView.register(ItineraryCell.self, forCellReuseIdentifier: ItineraryCell.identifier)
//		//tableView.sectionFooterHeight = 0
//		//tableView.estimatedSectionHeaderHeight = 10
//	}
//
//	private func getActivityLabel(text: String) -> UILabel {
//		let activityLabel = UILabel()
//		activityLabel.text = text
//		activityLabel.textAlignment = .left
//		activityLabel.sizeToFit()
//		activityLabel.font = UIFont.boldSystemFont(ofSize: 18)
//		activityLabel.textColor = .white
//		activityLabel.numberOfLines = 0
//		activityLabel.lineBreakMode = .byWordWrapping
//		activityLabel.layer.shadowColor = UIColor.black.cgColor
//		activityLabel.layer.shadowRadius = 2.0
//		activityLabel.layer.shadowOpacity = 1.0
//		activityLabel.layer.shadowOffset = CGSize(width: 2, height: 2)
//		activityLabel.layer.masksToBounds = false
//
//		return activityLabel
//	}
//
//	private func getDateLabel(text: String) -> UILabel {
//		let dateLabel = UILabel()
//		dateLabel.font = UIFont.boldSystemFont(ofSize: 22)
//		dateLabel.textColor = .white
//		dateLabel.translatesAutoresizingMaskIntoConstraints = false
//		dateLabel.text = "Fecha: " + text
//		dateLabel.textAlignment = .center
//		dateLabel.layer.shadowColor = UIColor.black.cgColor
//		dateLabel.layer.shadowRadius = 3.0
//		dateLabel.layer.shadowOpacity = 1.0
//		dateLabel.layer.shadowOffset = CGSize(width: 4, height: 4)
//		dateLabel.layer.masksToBounds = false
//
//		return dateLabel
//	}
//
//	//MARK: - Actions
//	@objc
//	func didTapButton(sender: UIButton) {
//		if let text = sender.titleLabel?.text {
//			delegate?.openMap(title: text)
//		}
//	}
//}
