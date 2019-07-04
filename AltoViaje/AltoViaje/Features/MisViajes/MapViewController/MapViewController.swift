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

		addFirst()
		addSecond()
		addThird()



	}

	func addFirst() {
		//Cataratas
		//		[-25.6842081, -54.4458484, 17],
		//		[-25.6837223, -54.4459691, 17],
		//		[-25.6852984, -54.4465314, 17]
		//First
		let annotation1 = MKPointAnnotation()
		annotation1.coordinate = CLLocationCoordinate2DMake(-25.6842081, -54.445844)
		annotation1.title = "Punto intermedio hacia las cataratas"
		annotation1.subtitle = ""
		mapView.mkMapView.addAnnotation(annotation1)

		let annotation2 = MKPointAnnotation()
		annotation2.coordinate = CLLocationCoordinate2DMake(-25.6852984, -54.4465314)
		annotation2.title = "Fin recorrido a las cataratas"
		annotation2.subtitle = ""
		mapView.mkMapView.addAnnotation(annotation2)

		var geodesic = MKGeodesicPolyline(coordinates: [annotation1.coordinate , annotation2.coordinate], count: 2)
		mapView.mkMapView.addOverlay(geodesic)

		//Second
		let annotation3 = MKPointAnnotation()
		annotation3.coordinate = CLLocationCoordinate2DMake(-25.6837223, -54.4459691)
		annotation3.title = "Comienzo recorrido a las cataratas"
		annotation3.subtitle = ""
		mapView.mkMapView.addAnnotation(annotation3)

		geodesic = MKGeodesicPolyline(coordinates: [annotation1.coordinate , annotation3.coordinate], count: 2)
		mapView.mkMapView.addOverlay(geodesic)
	}

	func addSecond() {

		var geodesic: MKGeodesicPolyline
				//Tronador
				let annotation1 = MKPointAnnotation()
				annotation1.coordinate = CLLocationCoordinate2DMake(-41.226620, -71.787543)
				annotation1.title = "Pampa Linda"
				annotation1.subtitle = "Comiendo recorrido del Tronador"
				mapView.mkMapView.addAnnotation(annotation1)

		let annotation2 = MKPointAnnotation()
				annotation2.coordinate = CLLocationCoordinate2DMake(-41.222170, -71.787740)
				mapView.mkMapView.addAnnotation(annotation2)
				annotation2.title = ""

		let annotation3 = MKPointAnnotation()
				annotation3.coordinate = CLLocationCoordinate2DMake(-41.219388, -71.787673)
				annotation3.title = ""
				mapView.mkMapView.addAnnotation(annotation3)

				let annotation4 = MKPointAnnotation()
				annotation4.coordinate = CLLocationCoordinate2DMake(-41.216797, -71.787341)
				mapView.mkMapView.addAnnotation(annotation4)

				let  annotation5 = MKPointAnnotation()
				annotation5.coordinate = CLLocationCoordinate2DMake(-41.208820, -71.788240)
				mapView.mkMapView.addAnnotation(annotation5)

				let annotation6 = MKPointAnnotation()
				annotation6.coordinate = CLLocationCoordinate2DMake(-41.199709, -71.787983)
				mapView.mkMapView.addAnnotation(annotation6)

				let annotation7 = MKPointAnnotation()
				annotation7.coordinate = CLLocationCoordinate2DMake(-41.189304, -71.788242)
				mapView.mkMapView.addAnnotation(annotation7)

				let annotation8 = MKPointAnnotation()
				annotation8.coordinate = CLLocationCoordinate2DMake(-41.183712, -71.787519)
				mapView.mkMapView.addAnnotation(annotation8)

				let annotation9 = MKPointAnnotation()
				annotation9.coordinate = CLLocationCoordinate2DMake(-41.177458, -71.789005)
				mapView.mkMapView.addAnnotation(annotation9)

				let annotation10 = MKPointAnnotation()
				annotation10.coordinate = CLLocationCoordinate2DMake(-41.171526, -71.804267)
				mapView.mkMapView.addAnnotation(annotation10)

				let annotation11 = MKPointAnnotation()
				annotation11.coordinate = CLLocationCoordinate2DMake(-41.173298, -71.812810)
				mapView.mkMapView.addAnnotation(annotation11)

				let annotation12 = MKPointAnnotation()
				annotation12.coordinate = CLLocationCoordinate2DMake(-41.167705, -71.818693)
				mapView.mkMapView.addAnnotation(annotation12)

				let annotation13 = MKPointAnnotation()
				annotation13.coordinate = CLLocationCoordinate2DMake(-41.164906, -71.817345)
				mapView.mkMapView.addAnnotation(annotation13)

				let annotation14 = MKPointAnnotation()
				annotation14.coordinate = CLLocationCoordinate2DMake(-41.160798, -71.821771)
				mapView.mkMapView.addAnnotation(annotation14)

				let annotation15 = MKPointAnnotation()
				annotation15.coordinate = CLLocationCoordinate2DMake(-41.156949, -71.825768)
				mapView.mkMapView.addAnnotation(annotation15)

				let annotation16 = MKPointAnnotation()
				annotation16.coordinate = CLLocationCoordinate2DMake(-41.149739, -71.829594)
				mapView.mkMapView.addAnnotation(annotation16)

				let annotation17 = MKPointAnnotation()
				annotation17.coordinate = CLLocationCoordinate2DMake(-41.151270, -71.836916)
				annotation17.title = "Refugio Otto Meilling"
				annotation17.subtitle = "Fin recorrido tronador"
				mapView.mkMapView.addAnnotation(annotation17)

				geodesic = MKGeodesicPolyline(coordinates: [annotation1.coordinate , annotation2.coordinate], count: 2)
				mapView.mkMapView.addOverlay(geodesic)

				geodesic = MKGeodesicPolyline(coordinates: [annotation2.coordinate , annotation3.coordinate], count: 2)
				mapView.mkMapView.addOverlay(geodesic)

				geodesic = MKGeodesicPolyline(coordinates: [annotation3.coordinate , annotation4.coordinate], count: 2)
				mapView.mkMapView.addOverlay(geodesic)

				geodesic = MKGeodesicPolyline(coordinates: [annotation4.coordinate , annotation5.coordinate], count: 2)
				mapView.mkMapView.addOverlay(geodesic)

				geodesic = MKGeodesicPolyline(coordinates: [annotation5.coordinate , annotation6.coordinate], count: 2)
				mapView.mkMapView.addOverlay(geodesic)

				geodesic = MKGeodesicPolyline(coordinates: [annotation6.coordinate , annotation7.coordinate], count: 2)
				mapView.mkMapView.addOverlay(geodesic)

				geodesic = MKGeodesicPolyline(coordinates: [annotation7.coordinate , annotation8.coordinate], count: 2)
				mapView.mkMapView.addOverlay(geodesic)

				geodesic = MKGeodesicPolyline(coordinates: [annotation8.coordinate , annotation9.coordinate], count: 2)
				mapView.mkMapView.addOverlay(geodesic)

				geodesic = MKGeodesicPolyline(coordinates: [annotation9.coordinate , annotation10.coordinate], count: 2)
				mapView.mkMapView.addOverlay(geodesic)

				geodesic = MKGeodesicPolyline(coordinates: [annotation10.coordinate , annotation11.coordinate], count: 2)
				mapView.mkMapView.addOverlay(geodesic)

				geodesic = MKGeodesicPolyline(coordinates: [annotation11.coordinate , annotation12.coordinate], count: 2)
				mapView.mkMapView.addOverlay(geodesic)

				geodesic = MKGeodesicPolyline(coordinates: [annotation12.coordinate , annotation13.coordinate], count: 2)
				mapView.mkMapView.addOverlay(geodesic)

				geodesic = MKGeodesicPolyline(coordinates: [annotation13.coordinate , annotation14.coordinate], count: 2)
				mapView.mkMapView.addOverlay(geodesic)

				geodesic = MKGeodesicPolyline(coordinates: [annotation14.coordinate , annotation15.coordinate], count: 2)
				mapView.mkMapView.addOverlay(geodesic)

				geodesic = MKGeodesicPolyline(coordinates: [annotation15.coordinate , annotation16.coordinate], count: 2)
				mapView.mkMapView.addOverlay(geodesic)

				geodesic = MKGeodesicPolyline(coordinates: [annotation16.coordinate , annotation17.coordinate], count: 2)
				mapView.mkMapView.addOverlay(geodesic)
	}

	func addThird() {

		var geodesic: MKGeodesicPolyline

				//Catedral
				let annotation1 = MKPointAnnotation()
				annotation1.coordinate = CLLocationCoordinate2DMake(-41.168777, -71.439372)
				annotation1.title = "Base cerro catedral"
				annotation1.subtitle = "Comiendo recorrido de Catedral"
				mapView.mkMapView.addAnnotation(annotation1)

				let annotation2 = MKPointAnnotation()
				annotation2.coordinate = CLLocationCoordinate2DMake(-41.174208, -71.439949)
				mapView.mkMapView.addAnnotation(annotation2)


				let annotation3 = MKPointAnnotation()
				annotation3.coordinate = CLLocationCoordinate2DMake(-41.178770, -71.437207)
				mapView.mkMapView.addAnnotation(annotation3)

				let annotation4 = MKPointAnnotation()
				annotation4.coordinate = CLLocationCoordinate2DMake(-41.184419, -71.438073)
				mapView.mkMapView.addAnnotation(annotation4)

				let annotation5 = MKPointAnnotation()
				annotation5.coordinate = CLLocationCoordinate2DMake(-41.188655, -71.436629)
				mapView.mkMapView.addAnnotation(annotation5)

				let annotation6 = MKPointAnnotation()
				annotation6.coordinate = CLLocationCoordinate2DMake(-41.195606, -71.432876)
				mapView.mkMapView.addAnnotation(annotation6)

				let annotation7 = MKPointAnnotation()
				annotation7.coordinate = CLLocationCoordinate2DMake(-41.201906, -71.432586)
				mapView.mkMapView.addAnnotation(annotation7)

				let annotation8 = MKPointAnnotation()
				annotation8.coordinate = CLLocationCoordinate2DMake(-41.207446, -71.437206)
				mapView.mkMapView.addAnnotation(annotation8)

				let annotation9 = MKPointAnnotation()
				annotation9.coordinate = CLLocationCoordinate2DMake(-41.209836, -71.447023)
				mapView.mkMapView.addAnnotation(annotation9)

				let annotation10 = MKPointAnnotation()
				annotation10.coordinate = CLLocationCoordinate2DMake(-41.207772, -71.453376)
				mapView.mkMapView.addAnnotation(annotation10)

				let annotation11 = MKPointAnnotation()
				annotation11.coordinate = CLLocationCoordinate2DMake(-41.203643, -71.462038)
				mapView.mkMapView.addAnnotation(annotation11)

				let annotation12 = MKPointAnnotation()
				annotation12.coordinate = CLLocationCoordinate2DMake(-41.199405, -71.468966)
				mapView.mkMapView.addAnnotation(annotation12)

				let annotation13 = MKPointAnnotation()
				annotation13.coordinate = CLLocationCoordinate2DMake(-41.195928, -71.473872)
				mapView.mkMapView.addAnnotation(annotation13)

				let annotation14 = MKPointAnnotation()
				annotation14.coordinate = CLLocationCoordinate2DMake(-41.194623, -71.480223)
				mapView.mkMapView.addAnnotation(annotation14)

				let annotation15 = MKPointAnnotation()
				annotation15.coordinate = CLLocationCoordinate2DMake(-41.198217, -71.482747)
				mapView.mkMapView.addAnnotation(annotation15)

				let annotation16 = MKPointAnnotation()
				annotation16.coordinate = CLLocationCoordinate2DMake(-41.198003, -71.486025)
				mapView.mkMapView.addAnnotation(annotation16)
				annotation16.title = "Refugio Frey"
				annotation16.subtitle = "Fin recorrido de Catedral"

				geodesic = MKGeodesicPolyline(coordinates: [annotation1.coordinate , annotation2.coordinate], count: 2)
				mapView.mkMapView.addOverlay(geodesic)

				geodesic = MKGeodesicPolyline(coordinates: [annotation2.coordinate , annotation3.coordinate], count: 2)
				mapView.mkMapView.addOverlay(geodesic)

				geodesic = MKGeodesicPolyline(coordinates: [annotation3.coordinate , annotation4.coordinate], count: 2)
				mapView.mkMapView.addOverlay(geodesic)

				geodesic = MKGeodesicPolyline(coordinates: [annotation4.coordinate , annotation5.coordinate], count: 2)
				mapView.mkMapView.addOverlay(geodesic)

				geodesic = MKGeodesicPolyline(coordinates: [annotation5.coordinate , annotation6.coordinate], count: 2)
				mapView.mkMapView.addOverlay(geodesic)

				geodesic = MKGeodesicPolyline(coordinates: [annotation6.coordinate , annotation7.coordinate], count: 2)
				mapView.mkMapView.addOverlay(geodesic)

				geodesic = MKGeodesicPolyline(coordinates: [annotation7.coordinate , annotation8.coordinate], count: 2)
				mapView.mkMapView.addOverlay(geodesic)

				geodesic = MKGeodesicPolyline(coordinates: [annotation8.coordinate , annotation9.coordinate], count: 2)
				mapView.mkMapView.addOverlay(geodesic)

				geodesic = MKGeodesicPolyline(coordinates: [annotation9.coordinate , annotation10.coordinate], count: 2)
				mapView.mkMapView.addOverlay(geodesic)

				geodesic = MKGeodesicPolyline(coordinates: [annotation10.coordinate , annotation11.coordinate], count: 2)
				mapView.mkMapView.addOverlay(geodesic)

				geodesic = MKGeodesicPolyline(coordinates: [annotation11.coordinate , annotation12.coordinate], count: 2)
				mapView.mkMapView.addOverlay(geodesic)

				geodesic = MKGeodesicPolyline(coordinates: [annotation12.coordinate , annotation13.coordinate], count: 2)
				mapView.mkMapView.addOverlay(geodesic)

				geodesic = MKGeodesicPolyline(coordinates: [annotation13.coordinate , annotation14.coordinate], count: 2)
				mapView.mkMapView.addOverlay(geodesic)

				geodesic = MKGeodesicPolyline(coordinates: [annotation14.coordinate , annotation15.coordinate], count: 2)
				mapView.mkMapView.addOverlay(geodesic)

				geodesic = MKGeodesicPolyline(coordinates: [annotation15.coordinate , annotation16.coordinate], count: 2)
				mapView.mkMapView.addOverlay(geodesic)
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
				mapView.setRegion(viewRegion)
			}
		}
	}
}

extension MapViewController: MKMapViewDelegate {
	//MARK: - Do magic here.
	func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
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
