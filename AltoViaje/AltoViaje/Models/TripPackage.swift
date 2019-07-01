//
//  TripPackage.swift
//  AltoViaje
//
//  Created by Nicolas Alvarez on 7/1/19.
//  Copyright © 2019 AltoViaje. All rights reserved.
//

import Foundation

struct TripPackage {
    var destiny: Destiny
    var activityType: [ActivityType]
    var from: Date
    var to: Date
    var selectedActivities: [Activity]
}
