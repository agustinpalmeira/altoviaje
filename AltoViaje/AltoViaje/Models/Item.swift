//
//  Item.swift
//  AltoViaje
//
//  Created by Nicolas Alvarez on 6/12/19.
//  Copyright © 2019 AltoViaje. All rights reserved.
//

import Foundation
import UIKit

protocol Buyable {
    var name: String { get }
    var price: Int { get }
    var image: UIImage? { get }
}

struct Flight: Buyable {
    var name: String
    var price: Int
    var image: UIImage?
}

struct Transport: Buyable {
    var name: String
    var price: Int
    var image: UIImage?
}

struct Housing: Buyable {
    var name: String
    var price: Int
    var image: UIImage?
}

struct Equipment: Buyable {
    var name: String
    var price: Int
    var image: UIImage?
}
