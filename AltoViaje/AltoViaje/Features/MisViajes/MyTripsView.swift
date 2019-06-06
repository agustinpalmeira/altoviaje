//
//  MyTripsView.swift
//  AltoViaje
//
//  Created by Agustin Palmeira on 06/06/2019.
//  Copyright © 2019 AltoViaje. All rights reserved.
//

import Foundation
import UIKit

class MyTripsView: UIView {
	override init(frame: CGRect) {
		super.init(frame: frame)
		commonInit()
	}

	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
		commonInit()
	}

	private func commonInit() {
		let nib = UINib(nibName: "MyTripsView", bundle: nil)
		nib.instantiate(withOwner: self, options: nil)
		addSubview(contentView)
		contentView.frame = self.bounds
		contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
	}
}
