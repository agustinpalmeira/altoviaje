//
//  MapViewController.swift
//  AltoViaje
//
//  Created by Agustin Palmeira on 11/06/2019.
//  Copyright © 2019 AltoViaje. All rights reserved.
//

import Foundation
import MapKit
import UIKit

class MapViewController: UIViewController {

	//Variables
	var titleText: String!
	var mapView: MapView!
	private var locationManager: CLLocationManager!
	private var currentLocation: CLLocation?

	// MARK: - View life cycle

	override func viewDidLoad() {
		super.viewDidLoad()

		locationManager = CLLocationManager()
		locationManager.delegate = self
		locationManager.desiredAccuracy = kCLLocationAccuracyBest

		if CLLocationManager.locationServicesEnabled() {
			locationManager.requestWhenInUseAuthorization()
			locationManager.startUpdatingLocation()
		}

		setSubViews()
	}

	override func viewWillAppear(_ animated: Bool) {
		navigationController?.setNavigationBarHidden(false, animated: true)
		navigationItem.title = "Ubicacion"
	}

	// MARK: - Initialization

	init(title: String) {
		super.init(nibName: nil, bundle: nil)
		titleText = title
	}

	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	// MARK: - Configure Sub Views

	private func setSubViews() {
		mapView = MapView(title: titleText)
		view.addSubview(mapView)
		mapView.frame = view.bounds
		mapView.setMapViewDelegate(self)
	}
}

//MARK: - Extensions
extension MapViewController: CLLocationManagerDelegate {
	func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
		defer { currentLocation = locations.last }

		if currentLocation == nil {
			// Zoom to user location
			if let userLocation = locations.last {
				let viewRegion = MKCoordinateRegion(center: userLocation.coordinate, latitudinalMeters: 2000, longitudinalMeters: 2000)
				mapView.setRegion(viewRegion)
			}
		}
	}
}

extension MapViewController: MKMapViewDelegate {

}
