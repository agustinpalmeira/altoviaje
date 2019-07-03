//
//  UIView+Shadows.swift
//  CrESITrivia
//
//  Created by Agustin Palmeira on 08/03/2019.
//  Copyright © 2019 Josmer Delgado. All rights reserved.
//

import Foundation
import UIKit

enum VerticalLocation: String {
	case bottom
	case top
}

extension UIView {
	func addShadow(location: VerticalLocation, color: UIColor = .black, opacity: Float = 0.5, radius: CGFloat = 5.0) {
		switch location {
		case .bottom:
			addShadow(offset: CGSize(width: 0, height: 10), color: color, opacity: opacity, radius: radius)
		case .top:
			addShadow(offset: CGSize(width: 0, height: -10), color: color, opacity: opacity, radius: radius)
		}
	}

	func addShadow(offset: CGSize, color: UIColor = .black, opacity: Float = 0.5, radius: CGFloat = 5.0) {
		self.layer.masksToBounds = false
		self.layer.shadowColor = color.cgColor
		self.layer.shadowOffset = offset
		self.layer.shadowOpacity = opacity
		self.layer.shadowRadius = radius
	}
}
