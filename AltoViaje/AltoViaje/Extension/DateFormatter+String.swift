//
//  DateFormatter+String.swift
//  AltoViaje
//
//  Created by Nicolas Alvarez on 6/10/19.
//  Copyright © 2019 AltoViaje. All rights reserved.
//

import Foundation

extension DateFormatter {
    func string(from value: Date, with format: String) -> String {
        dateFormat = format; return string(from: value)
    }
}
