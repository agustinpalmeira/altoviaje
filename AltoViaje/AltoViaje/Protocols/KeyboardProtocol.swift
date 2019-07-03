//
//  KeyboardProtocol.swift
//  AltoViaje
//
//  Created by Agustin Palmeira.
//  Copyright © 2019 - All rights reserved.
//

import Foundation

protocol KeyboardProtocol: class {
	func keyboardWillShow(notification: NSNotification)
	func keyboardWillHide(notification: NSNotification)
}
