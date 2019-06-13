//
//  AltoViajeNotification.swift
//  AltoViaje
//
//  Created by Nicolas Alvarez on 6/13/19.
//  Copyright © 2019 AltoViaje. All rights reserved.
//

import Foundation

enum AltoViajeNotification: String {
    case newTripBoocked

    var name: Notification.Name {
        switch self {
        case .newTripBoocked:
            return Notification.Name(self.rawValue)
        }
    }
}
