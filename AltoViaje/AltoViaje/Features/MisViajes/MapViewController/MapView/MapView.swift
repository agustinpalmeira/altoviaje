//
//  MapView.swift
//  AltoViaje
//
//  Created by Agustin Palmeira on 11/06/2019.
//  Copyright © 2019 AltoViaje. All rights reserved.
//

import Foundation
import MapKit
import UIKit

class MapView: UIView {

	//MARK: - Variables
	private let mapView: MKMapView = {
		let view = MKMapView()
		view.layer.cornerRadius = 2.0
		view.layer.borderColor = UIColor.black.cgColor
		view.layer.borderWidth = 1.0

		return view
	}()

	private var titleText: String!

	//MARK: - Initializers

	init(title: String) {
		super.init(frame: .zero)
		backgroundColor = .white
		titleText = title

		setSubViews()
	}

	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	//MARK: - Configure views
	private func setSubViews() {
		let titleLabel = getTitleLabel(text: titleText)
		addSubview(titleLabel)
		titleLabel.translatesAutoresizingMaskIntoConstraints = false
		titleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 15).isActive = true
		titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
		titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true

		addSubview(mapView)
		mapView.translatesAutoresizingMaskIntoConstraints = false
		mapView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20).isActive = true
		mapView.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor).isActive = true
		mapView.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor).isActive = true
		mapView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -15).isActive = true
	}

	private func getTitleLabel(text: String) -> UILabel {
		let label = UILabel()
		label.font = UIFont.boldSystemFont(ofSize: 22)
		label.textColor = .black
		label.numberOfLines = 0
		label.translatesAutoresizingMaskIntoConstraints = false
		label.text = text
		label.textAlignment = .center
		label.layer.shadowColor = UIColor.black.cgColor
		label.layer.shadowRadius = 2.0
		label.layer.shadowOpacity = 1.0
		label.layer.shadowOffset = CGSize(width: 2, height: 2)
		label.layer.masksToBounds = false

		return label
	}

	//MARK: - Actions
}
