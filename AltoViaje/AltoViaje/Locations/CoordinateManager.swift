//
//  CoordinateManager.swift
//  AltoViaje
//
//  Created by Agustin Palmeira on 30/06/2019.
//  Copyright © 2019 AltoViaje. All rights reserved.
//

import Foundation
import MapKit

class CoordinateManager {
	static let instance = CoordinateManager()
	private var dictionary: NSDictionary!

	private init() {
		dictionary = [
			//Aeropuerto de bariloche:
			//BarilocheItinerary.barilocheBuenosAires: CLLocationCoordinate2DMake(-41.1467142, -71.1642183),
			//BarilocheItinerary.accommodation: CLLocationCoordinate2DMake(-41.025101, -71.8173227),
			//BarilocheItinerary.firstExcursion: CLLocationCoordinate2DMake(-41.1805557, -72.055416),
			//BarilocheItinerary.secondExcursion:CLLocationCoordinate2DMake(-41.1982652,-71.4882568),
			//Aeroparque:
			//BarilocheItinerary.barilocheBuenosAires:CLLocationCoordinate2DMake(-34.5580305,-58.4191975)
			BarilocheItinerary.tronadorExcursion: CLLocationCoordinate2DMake(-41.1608314, -71.9050096),
			BarilocheItinerary.catedralExcursion: CLLocationCoordinate2DMake(-41.1833311, -71.4675096),
			IguazuItinerary.cataratasExcursion: CLLocationCoordinate2DMake(-25.6809586, -54.478353),
			IguazuItinerary.wandaExcursion: CLLocationCoordinate2DMake(-25.9580004, -54.6014352),
			SaltaItinerary.trenNubesExcursion: CLLocationCoordinate2DMake(-24.7771852, -65.4134858),
			SaltaItinerary.salinasGrandesExcursion: CLLocationCoordinate2DMake(-23.7166653, -66.0483429),
			SaltaItinerary.tastilExcursion: CLLocationCoordinate2DMake(-24.4503645, -65.9527298),
			SaltaItinerary.cafayateExcursion: CLLocationCoordinate2DMake(-26.0695533, -65.9929056)
		]
	}

	func getCoordinate(fromString locationName: String) -> CLLocationCoordinate2D {
		if let coordinate = dictionary[locationName] {
			return coordinate as! CLLocationCoordinate2D
		} else {
			return CLLocationCoordinate2DMake(-34.617529,-58.3705057)
		}
	}
}
