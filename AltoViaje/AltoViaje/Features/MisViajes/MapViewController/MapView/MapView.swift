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

protocol MapViewDelegate: class {
	func zoomToUserLocation()
	func zoomToItineraryLocation()
}

class MapView: UIView {
	weak var delegate: MapViewDelegate?

	//MARK: - Variables
	let mkMapView: MKMapView = {
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

		addSubview(mkMapView)
		mkMapView.translatesAutoresizingMaskIntoConstraints = false
		mkMapView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20).isActive = true
		mkMapView.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor).isActive = true
		mkMapView.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor).isActive = true
		mkMapView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -15).isActive = true

		let currentLocationButton = UIButton()
		currentLocationButton.addTarget(self, action: #selector(didTapCurrentLocationButton), for: .touchUpInside)
		currentLocationButton.translatesAutoresizingMaskIntoConstraints = false
		currentLocationButton.setImage(#imageLiteral(resourceName: "currentLocationNormal"), for: .normal)
		currentLocationButton.setImage(#imageLiteral(resourceName: "currentLocationSelected"), for: .highlighted)
		currentLocationButton.setImage(#imageLiteral(resourceName: "currentLocationSelected"), for: .selected)
		addSubview(currentLocationButton)
		currentLocationButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
		currentLocationButton.widthAnchor.constraint(equalTo: currentLocationButton.heightAnchor).isActive = true
		currentLocationButton.trailingAnchor.constraint(equalTo: mkMapView.trailingAnchor, constant: -20).isActive = true
		currentLocationButton.bottomAnchor.constraint(equalTo: mkMapView.bottomAnchor, constant: -20).isActive = true

		let itineraryLocationButton = UIButton()
		itineraryLocationButton.addTarget(self, action: #selector(didTapItineraryLocationButton), for: .touchUpInside)
		itineraryLocationButton.translatesAutoresizingMaskIntoConstraints = false
		itineraryLocationButton.setImage(#imageLiteral(resourceName: "location"), for: .normal)
		addSubview(itineraryLocationButton)
		itineraryLocationButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
		itineraryLocationButton.widthAnchor.constraint(equalTo: currentLocationButton.heightAnchor).isActive = true
		itineraryLocationButton.leadingAnchor.constraint(equalTo: mkMapView.leadingAnchor, constant: 20).isActive = true
		itineraryLocationButton.bottomAnchor.constraint(equalTo: mkMapView.bottomAnchor, constant: -20).isActive = true
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

	//MARK: - Configure Map

	func setRegion(_ region: MKCoordinateRegion) {
		mkMapView.setRegion(region, animated: true)
	}

	func setMapViewDelegate(_ delegate: MKMapViewDelegate) {
		mkMapView.delegate = delegate
	}

	//MARK: - Actions
	@objc
	func didTapCurrentLocationButton(sender: UIButton) {
		delegate?.zoomToUserLocation()
	}

	@objc
	func didTapItineraryLocationButton(sender: UIButton) {
		delegate?.zoomToItineraryLocation()
	}
}
