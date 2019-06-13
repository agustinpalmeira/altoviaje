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
		mapView.delegate = self
		mapView.setMapViewDelegate(self)

		mockLocation()

		//		let location: CLLocationCoordinate2D =  CLLocationCoordinate2DMake(-41.1805557, -72.055416)
		//		//let location: CLLocationCoordinate2D = CLLocationCoordinate2DMake(-34.6317146, -58.3737228) //Mi casita :)
		//		//var span : MKCoordinateSpan = MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5)
		//		let region = MKCoordinateRegion(center: location, latitudinalMeters: 10000, longitudinalMeters: 10000)
		//		if CLLocationCoordinate2DIsValid (location) {
		//			mapView.setRegion(region)
		//		}
	}

	func mockLocation() {
		let tronadorCoordinates = CLLocationCoordinate2DMake(-41.1805557, -72.055416)
		setMapInLocation(coordinates: tronadorCoordinates)


		setAnnonationInMapLocation(coordinates: tronadorCoordinates,
								   title: "Cerro Tronador",
								   subtitle: "Puerto Varas. Región de los Lagos.")
	}

	func setMapInLocation(coordinates: CLLocationCoordinate2D) {
		mapView.mkMapView.mapType = MKMapType.satelliteFlyover
		mapView.mkMapView.showsBuildings = true // displays buildings

		let coordinates = coordinates

		// sets the visible region of the map
		mapView.setRegion(MKCoordinateRegion(center: coordinates, latitudinalMeters: 10000, longitudinalMeters: 10000))

		// create a 3D Camera
		let mapCamera = MKMapCamera()
		mapCamera.centerCoordinate = coordinates
		mapCamera.pitch = 45
		mapCamera.altitude = 10000 //Altitude
		mapCamera.heading = 45

		// set the camera property
		mapView.mkMapView.camera = mapCamera
	}

	func setAnnonationInMapLocation(coordinates: CLLocationCoordinate2D, title: String, subtitle: String) {
		let annotation = MKPointAnnotation()
		annotation.coordinate = coordinates
		annotation.title = title
		annotation.subtitle = subtitle
		mapView.mkMapView.addAnnotation(annotation)
	}
}

//MARK: - Extensions
extension MapViewController: CLLocationManagerDelegate {
	func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
		//MARK: - This is to update the user location all time.
		defer { currentLocation = locations.last }

		if currentLocation == nil {
			// Zoom to user location
			if let userLocation = locations.last {
				let viewRegion = MKCoordinateRegion(center: userLocation.coordinate, latitudinalMeters: 2000, longitudinalMeters: 2000)
				//mapView.setRegion(viewRegion)
			}
		}
	}
}

extension MapViewController: MKMapViewDelegate {
	//MARK: - Do magic here.
}

extension MapViewController: MapViewDelegate {
	func zoomToUserLocation() {
		if let location = currentLocation {
			var mapRegion = MKCoordinateRegion(center: location.coordinate, latitudinalMeters: 2000, longitudinalMeters: 2000)
			mapRegion.center = location.coordinate
			mapRegion.span.latitudeDelta = CLLocationDegrees(0.2)
			mapRegion.span.longitudeDelta = CLLocationDegrees(0.2)
			mapView.setRegion(mapRegion)
			setAnnonationInMapLocation(coordinates: location.coordinate, title: "Ubicacion actual.", subtitle: "Estas aqui.")
		}
	}

	func zoomToItineraryLocation() {
		mockLocation()
	}
}
