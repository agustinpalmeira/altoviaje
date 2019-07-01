//
//  User.swift
//  AltoViaje
//
//  Created by Nicolas Alvarez on 7/1/19.
//  Copyright © 2019 AltoViaje. All rights reserved.
//

import Foundation

class User {
    static let shared: User = {
        let user = User()
        return user
    }()

    var name: String
    var lastName: String
    var trips: [TripPackage]
    var buyedItems: [Buyable]
    var toBuyItems: [Buyable]

    private init() {
        name = ""
        lastName = ""
        trips = []
        buyedItems = []
        toBuyItems = []
    }
}
