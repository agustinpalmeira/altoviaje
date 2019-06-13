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

		let tronadorCoordinates = CLLocationCoordinate2DMake(-41.1805557, -72.055416)
		setMapInLocation(coordinates: tronadorCoordinates)


		setAnnonationInMapLocation(coordinates: tronadorCoordinates,
								   title: "Cerro Tronador",
								   subtitle: "Puerto Varas. Región de los Lagos.")

//		let location: CLLocationCoordinate2D =  CLLocationCoordinate2DMake(-41.1805557, -72.055416)
//		//let location: CLLocationCoordinate2D = CLLocationCoordinate2DMake(-34.6317146, -58.3737228) //Mi casita :)
//		//var span : MKCoordinateSpan = MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5)
//		let region = MKCoordinateRegion(center: location, latitudinalMeters: 10000, longitudinalMeters: 10000)
//		if CLLocationCoordinate2DIsValid (location) {
//			mapView.setRegion(region)
//		}
	}

	func setMapInLocation(coordinates: CLLocationCoordinate2D) {
		mapView.mapView.mapType = MKMapType.satelliteFlyover
		mapView.mapView.showsBuildings = true // displays buildings

		let coordinates = coordinates
		mapView.mapView.region = MKCoordinateRegion(center: coordinates, latitudinalMeters: 10000, longitudinalMeters: 10000) // sets the visible region of the map

		// create a 3D Camera
		let mapCamera = MKMapCamera()
		mapCamera.centerCoordinate = coordinates
		mapCamera.pitch = 45
		mapCamera.altitude = 10000 //Altitude
		mapCamera.heading = 45

		// set the camera property
		mapView.mapView.camera = mapCamera
	}

	func setAnnonationInMapLocation(coordinates: CLLocationCoordinate2D, title: String, subtitle: String) {
		let annotation = MKPointAnnotation()
		annotation.coordinate = coordinates
		annotation.title = title
		annotation.subtitle = subtitle
		mapView.mapView.addAnnotation(annotation)
	}
}

//MARK: - Extensions
extension MapViewController: CLLocationManagerDelegate {
	func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
//		defer { currentLocation = locations.last }
//
//		if currentLocation == nil {
//			// Zoom to user location
//			if let userLocation = locations.last {
//				let viewRegion = MKCoordinateRegion(center: userLocation.coordinate, latitudinalMeters: 2000, longitudinalMeters: 2000)
//				mapView.setRegion(viewRegion)
//			}
//		}
	}
}

extension MapViewController: MKMapViewDelegate {

}
