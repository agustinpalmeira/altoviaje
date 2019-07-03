//
//  NSLayoutContraint+Util.swift
//  AltoViaje
//
//  Created by Agustin Palmeira on 03/07/2019.
//  Copyright © 2019 AltoViaje. All rights reserved.
//

import UIKit

extension NSLayoutConstraint {

	public class func useAndActivateConstraints(constraints: [NSLayoutConstraint]) {
		for constraint in constraints {
			if let view = constraint.firstItem as? UIView {
				view.translatesAutoresizingMaskIntoConstraints = false
			}
		}
		activate(constraints)
	}
}

