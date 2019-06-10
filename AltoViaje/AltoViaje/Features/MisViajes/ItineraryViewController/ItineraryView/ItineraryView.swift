//
//  ItineraryView.swift
//  AltoViaje
//
//  Created by Agustin Palmeira on 09/06/2019.
//  Copyright © 2019 AltoViaje. All rights reserved.
//

import Foundation
import UIKit

class ItineraryView: UIView {

	//MARK: - Variables

//	let userNameTextFieldFloating: MDCTextField = {
//		let textField = MDCTextField()
//		textField.placeholder = ContactUsTexts.username
//
//		return textField
//	}()

	//MARK: - Initializers

	init() {
		super.init(frame: .zero)
		setSubViews()
	}

	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	//MARK: - Configure views
	private func setSubViews() {
		let firstDateLabel = UILabel()
		firstDateLabel.text = "01/01/20"
//		let 
//
//
//		let secondDateLabel = UILabel()
//		let thirdDateLabel = UILabel()
//		let fourthDateLabel = UILabel()

	}

	//MARK: - Actions

}
