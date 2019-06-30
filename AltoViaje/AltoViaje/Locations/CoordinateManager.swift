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
			BarilocheItinerary.barilocheBuenosAires: CLLocationCoordinate2DMake(-41.1467142, -71.1642183),
			BarilocheItinerary.accommodation: CLLocationCoordinate2DMake(-41.025101, -71.8173227),
			BarilocheItinerary.firstExcursion: CLLocationCoordinate2DMake(-41.1805557, -72.055416),
			BarilocheItinerary.secondExcursion:CLLocationCoordinate2DMake(-41.1982652,-71.4882568),
			//Aeroparque:
			BarilocheItinerary.barilocheBuenosAires:CLLocationCoordinate2DMake(-34.5580305,-58.4191975)
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
