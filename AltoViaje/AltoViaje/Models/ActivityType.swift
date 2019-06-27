//
//  ActivityType.swift
//  AltoViaje
//
//  Created by Nicolas Alvarez on 6/26/19.
//  Copyright © 2019 AltoViaje. All rights reserved.
//

import Foundation

enum ActivityType: Int {
    case climbing
    case beach
    case trekking
    case camping

    var name: String {
        switch self {
        case .climbing:
            return "Montañismo"
        case .beach:
            return "Playa"
        case .trekking:
            return "Trekking"
        case .camping:
            return "Camping"
        }
    }
}
