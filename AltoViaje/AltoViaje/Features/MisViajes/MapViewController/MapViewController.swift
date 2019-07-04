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
	private var tourCoordinate: CLLocationCoordinate2D!

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

	init(title: String, coordinate: CLLocationCoordinate2D) {
		super.init(nibName: nil, bundle: nil)
		titleText = title
		tourCoordinate = coordinate
	}

	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	// MARK: - Configure Sub Views

	private func setSubViews() {
		mapView = MapView(title: titleText)
        mapView.backgroundColor = .clear
        let backgroundImage = UIImageView(image: #imageLiteral(resourceName: "backgroundApp"))
        view.addSubview(backgroundImage)
		view.addSubview(mapView)
        backgroundImage.frame = view.bounds
		mapView.frame = view.bounds
		mapView.delegate = self
		mapView.setMapViewDelegate(self)

		addCustomAnnotations()

		setLocation(title: titleText, coordinate: tourCoordinate)

		//		let location: CLLocationCoordinate2D =  CLLocationCoordinate2DMake(-41.1805557, -72.055416)
		//		//let location: CLLocationCoordinate2D = CLLocationCoordinate2DMake(-34.6317146, -58.3737228) //Mi casita :)
		//		//var span : MKCoordinateSpan = MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5)
		//		let region = MKCoordinateRegion(center: location, latitudinalMeters: 10000, longitudinalMeters: 10000)
		//		if CLLocationCoordinate2DIsValid (location) {
		//			mapView.setRegion(region)
		//		}
	}

	private func setLocation(title: String, coordinate: CLLocationCoordinate2D) {
		//let tronadorCoordinates = CLLocationCoordinate2DMake(-41.1805557, -72.055416)
		setMapInLocation(coordinates: tourCoordinate)

		setAnnonationInMapLocation(coordinates: tourCoordinate,
								   title: "Destino",
								   subtitle: "")
	}

	private func setMapInLocation(coordinates: CLLocationCoordinate2D) {
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

	private func setAnnonationInMapLocation(coordinates: CLLocationCoordinate2D, title: String, subtitle: String) {
		let annotation = MKPointAnnotation()
		annotation.coordinate = coordinates
		annotation.title = title
		annotation.subtitle = subtitle
		mapView.mkMapView.addAnnotation(annotation)
	}

	private func addCustomAnnotations() {

		//Bariloche
//		[-25.6842081, -54.4458484, 17],
//		[-25.6837223, -54.4459691, 17],
//		[-25.6852984, -54.4465314, 17]
		//First
		var annotation1 = MKPointAnnotation()
		annotation1.coordinate = CLLocationCoordinate2DMake(-25.6842081, -54.445844)
		annotation1.title = "Punto intermedio hacia las cataratas"
		annotation1.subtitle = ""
		mapView.mkMapView.addAnnotation(annotation1)

		var annotation2 = MKPointAnnotation()
		annotation2.coordinate = CLLocationCoordinate2DMake(-25.6852984, -54.4465314)
		annotation2.title = "Fin recorrido a las cataratas"
		annotation2.subtitle = ""
		mapView.mkMapView.addAnnotation(annotation2)

		var geodesic = MKGeodesicPolyline(coordinates: [annotation1.coordinate , annotation2.coordinate], count: 2)
		mapView.mkMapView.addOverlay(geodesic)

		//Second
		var annotation3 = MKPointAnnotation()
		annotation3.coordinate = CLLocationCoordinate2DMake(-25.6837223, -54.4459691)
		annotation3.title = "Comienzo recorrido a las cataratas"
		annotation3.subtitle = ""
		mapView.mkMapView.addAnnotation(annotation3)

		geodesic = MKGeodesicPolyline(coordinates: [annotation1.coordinate , annotation3.coordinate], count: 2)
		mapView.mkMapView.addOverlay(geodesic)



//
//		let request = MKDirections.Request()
//		request.source = MKMapItem(placemark: MKPlacemark(coordinate: annotation1.coordinate, addressDictionary: nil))
//		request.destination = MKMapItem(placemark: MKPlacemark(coordinate: annotation2.coordinate, addressDictionary: nil))
//		request.requestsAlternateRoutes = false
//		request.transportType = .walking
//
//		let directions = MKDirections(request: request)
//
//		directions.calculate { [unowned self] response, error in
//			guard let unwrappedResponse = response else { return }
//
//			if (unwrappedResponse.routes.count > 0) {
//				self.mapView.mkMapView.addOverlay(unwrappedResponse.routes[0].polyline)
//				self.mapView.mkMapView.setVisibleMapRect(unwrappedResponse.routes[0].polyline.boundingMapRect, animated: false)
//			}
//		}



//		let sourcePlacemark = MKPlacemark(coordinate: CLLocationCoordinate2DMake(-25.6842081, -54.445844), addressDictionary: nil)
//		let destinationPlacemark = MKPlacemark(coordinate: CLLocationCoordinate2DMake(-25.6852984, -54.4465314), addressDictionary: nil)
//
//		let sourceMapItem = MKMapItem(placemark: sourcePlacemark)
//		let destinationMapItem = MKMapItem(placemark: destinationPlacemark)
//
//		let sourceAnnotation = MKPointAnnotation()
//
//		if let location = sourcePlacemark.location {
//			sourceAnnotation.coordinate = location.coordinate
//		}
//
//		let destinationAnnotation = MKPointAnnotation()
//
//		if let location = destinationPlacemark.location {
//			destinationAnnotation.coordinate = location.coordinate
//		}
//
//		//self.mapView.mkMapView.showAnnotations([sourceAnnotation,destinationAnnotation], animated: true )
//
//		let directionRequest = MKDirections.Request()
//		directionRequest.source = sourceMapItem
//		directionRequest.destination = destinationMapItem
//		directionRequest.transportType = .any
//
//		// Calculate the direction
//		let directions = MKDirections(request: directionRequest)
//
//		directions.calculate {
//			(response, error) -> Void in
//
//			guard let response = response else {
//				if let error = error {
//					print("Error: \(error)")
//				}
//
//				return
//			}
//
//			let route = response.routes[0]
//
//			self.mapView.mkMapView.addOverlay((route.polyline), level: MKOverlayLevel.aboveLabels)
//
//			let rect = route.polyline.boundingMapRect
//			self.mapView.mkMapView.setRegion(MKCoordinateRegion(rect), animated: true)
//		}
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
	func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
//		if overlay is MKPolyline {
//			var polylineRenderer = MKPolylineRenderer(overlay: overlay)
//			polylineRenderer.strokeColor = UIColor.blue
//			polylineRenderer.lineWidth = 2
//			return polylineRenderer
//		}
//		return MKPolylineRenderer()
//	}

	let renderer = MKPolylineRenderer(overlay: overlay)
	renderer.strokeColor = UIColor(red: 17.0/255.0, green: 147.0/255.0, blue: 255.0/255.0, alpha: 1)
	renderer.lineWidth = 2.0

	return renderer
	}
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
		setLocation(title: titleText, coordinate: tourCoordinate)
	}
}
