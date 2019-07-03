//
//  BaseView.swift
//  CrESITrivia
//
//  Created by Agustin Palmeira on 31/05/2019.
//  Copyright © 2019 Josmer Delgado. All rights reserved.
//

import Foundation
import UIKit

class BaseView: UIView {
	//MARK: - Initializers
	init() {
		super.init(frame: .zero)
	}

	@available(*, unavailable, message: "init is unavailable, use init(subject: String).")
	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
}
