//
//  UIButton+Custom.swift
//  AltoViaje
//
//  Created by Agustin Palmeira.
//  Copyright © 2019 - All rights reserved.
//

/* Button extension for the bottom button confirmation.
- Button with corner radius.
- The width and height are related to the screen size.
- A background color depending on the button state can be added.
*/

import Foundation
import UIKit

struct ConfirmationButtonConstants {
	static let width: CGFloat = UIScreen.main.bounds.width * 0.5
	static let height: CGFloat = UIScreen.main.bounds.height * 0.06
	static let cornerRadius: CGFloat = 20
	static let borderWidth: CGFloat = 2
}

extension UIButton {
	class func attributedButton() -> UIButton {
		let button = UIButton()
		NSLayoutConstraint.useAndActivateConstraints(constraints: [
			button.heightAnchor.constraint(equalToConstant: ConfirmationButtonConstants.height),
			button.widthAnchor.constraint(equalToConstant: ConfirmationButtonConstants.width)
			])
		button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
		button.layer.cornerRadius = ConfirmationButtonConstants.cornerRadius
		button.layer.borderWidth = ConfirmationButtonConstants.borderWidth
		button.setAttributes(normalBorderColor: UIColor(red: 110/255, green: 218/255, blue: 193/255, alpha: 1),
							 normalBackgroundColor: UIColor(red: 110/255, green: 218/255, blue: 193/255, alpha: 1),
							 normalTitleColor: UIColor.white,
							 highlightedBackgroundColor: UIColor(red: 44/255, green: 189/255, blue: 155/255, alpha: 1),
							 highlightedTitleColor: UIColor.white)
		button.clipsToBounds = true

		return button
	}

	func setBackgroundColor(color: UIColor, forState: UIControl.State) {
		let rect = CGRect(x: 0.0, y: 0.0, width: 1.0, height: 1.0)
		UIGraphicsBeginImageContext(rect.size)
		let context = UIGraphicsGetCurrentContext()
		context?.setFillColor(color.cgColor)
		context?.fill(rect)
		let image = UIGraphicsGetImageFromCurrentImageContext()
		UIGraphicsEndImageContext()
		self.setBackgroundImage(image, for: forState)
	}

	func setAttributes(normalBorderColor: UIColor,
					   normalBackgroundColor: UIColor,
					   normalTitleColor: UIColor,
					   highlightedBackgroundColor: UIColor,
					   highlightedTitleColor: UIColor) {
		layer.borderColor = normalBorderColor.cgColor
		backgroundColor = normalBackgroundColor
		setTitleColor(normalTitleColor, for: .normal)
		setTitleColor(highlightedTitleColor, for: .highlighted)
		setBackgroundColor(color: highlightedBackgroundColor, forState: .highlighted)
	}
}
