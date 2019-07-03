//
//  BaseFillFieldsView.swift
//  CrESITrivia
//
//  Created by Agustin Palmeira on 31/05/2019.
//  Copyright © 2019 Josmer Delgado. All rights reserved.
//

import Foundation
import UIKit

class BaseFillFieldsView: BaseView {
	//MARK: - Initializers
	override init() {
		super.init()
	}
}

//MARK: - TextFieldDelegate
extension BaseFillFieldsView: UITextFieldDelegate {
	func textFieldShouldReturn(_ textField: UITextField) -> Bool {
		endEditing(true)

		return false
	}
}
