//
//  TripView.swift
//  AltoViaje
//
//  Created by Agustin Palmeira on 05/06/2019.
//  Copyright © 2019 AltoViaje. All rights reserved.
//

import Foundation
import UIKit
import ActionSheetPicker_3_0

class TripView: UIView {
    var fromDate = Date()
    var toDate = Date()
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
		let nib = UINib(nibName: "TripView", bundle: nil)
		nib.instantiate(withOwner: self, options: nil)
		addSubview(contentView)
		contentView.frame = self.bounds
		contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        toDateLabel.text = DateFormatter().string(from: toDate, with: "dd/MM/YY")
        fromDateLabel.text = DateFormatter().string(from: fromDate, with: "dd/MM/YY")
	}

    @IBAction func fromDate(_ sender: Any) {
        ActionSheetDatePicker.show(withTitle: "From", datePickerMode: .date, selectedDate: fromDate, minimumDate: Date(), maximumDate: Date(timeIntervalSinceNow: 3600 * 24 * 365), doneBlock: { [weak self] (picker, selectedDate, _) in

            guard let s = self else {
                return
            }

            guard let newDate = selectedDate as? Date else {
                return
            }
            s.fromDate = newDate
            s.fromDateLabel.text = DateFormatter().string(from: newDate, with: "dd/MM/YY")

            if s.fromDate > s.toDate {
                s.toDate = newDate
                s.toDateLabel.text = DateFormatter().string(from: newDate, with: "dd/MM/YY")
            }
            return
        }, cancel: { (_) in
            
        }, origin: self)
    }

    @IBAction func toDate(_ sender: Any) {
        ActionSheetDatePicker.show(withTitle: "From", datePickerMode: .date, selectedDate: toDate, minimumDate: Date(), maximumDate: Date(timeIntervalSinceNow: 3600 * 24 * 365), doneBlock: { [weak self] (picker, selectedDate, _) in

            guard let s = self else {
                return
            }

            guard let newDate = selectedDate as? Date else {
                return
            }
            s.toDate = newDate
            s.toDateLabel.text = DateFormatter().string(from: newDate, with: "dd/MM/YY")

            if s.fromDate > s.toDate {
                s.fromDate = newDate
                s.fromDateLabel.text = DateFormatter().string(from: newDate, with: "dd/MM/YY")
            }
            return
            }, cancel: { (_) in

        }, origin: self)
    }
}
