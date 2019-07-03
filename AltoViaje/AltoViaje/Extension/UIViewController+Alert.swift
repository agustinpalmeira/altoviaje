//
//  UIViewController+Alert.swift
//  AltoViaje
//
//  Created by Agustin Palmeira on 03/07/2019.
//  Copyright © 2019 AltoViaje. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
	func showAlert(text: String) {
		let alert = UIAlertController(title: text,
									  message: "",
									  preferredStyle: UIAlertController.Style.alert)

		alert.addAction(UIAlertAction(title: "Ok.",
									  style: UIAlertAction.Style.default,
									  handler: { (action: UIAlertAction!) in
										print("Handle Ok logic here")
		}))

		self.present(alert, animated: true, completion: nil)
	}
}
