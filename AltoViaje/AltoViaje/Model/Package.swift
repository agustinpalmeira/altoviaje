//
//  Package.swift
//  AltoViaje
//
//  Created by Agustin Palmeira on 09/06/2019.
//  Copyright © 2019 AltoViaje. All rights reserved.
//

import Foundation
import UIKit

struct Package {
	let dateFrom: Date
	let dateTo: Date
	let destiny: String
	let image: UIImage
	let itineraries: [DateItinerary]
}
