//
//  TripView.swift
//  AltoViaje
//
//  Created by Agustin Palmeira on 05/06/2019.
//  Copyright © 2019 AltoViaje. All rights reserved.
//

import Foundation
import UIKit

class TripView: UIView {
	@IBOutlet var contentView: UIView!
	@IBOutlet weak var destinyImageView: UIImageView!
	@IBOutlet weak var descriptionLabel: UILabel!
	@IBOutlet weak var fromDateLabel: UILabel!
	@IBOutlet weak var toDateLabel: UILabel!
	
	@IBOutlet weak var trekkingSwitch: UISwitch!
	@IBOutlet weak var campingSwitch: UISwitch!
	@IBOutlet weak var beachSwitch: UISwitch!
	@IBOutlet weak var mountainSwitch: UISwitch!


	override init(frame: CGRect) {
		super.init(frame: frame)
		commonInit()
	}

	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
		commonInit()
	}

	private func commonInit() {
		Bundle.main.loadNibNamed("TripView", owner: self, options: nil)
		addSubview(contentView)
		contentView.frame = self.bounds
		contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
	}
}
