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

    var fromDate = Date() {
        didSet {
            setupActivities()
        }
    }
    var toDate = Date() {
        didSet {
            setupActivities()
        }
    }
    var activities: [ActivityType] = [] {
        didSet {
            self.setupActivities()
        }
    }

    var selectedActivities: [ActivityType] = []

    @IBOutlet weak var activitiesContainer: UIStackView!
    @IBOutlet var contentView: UIView!
	@IBOutlet weak var destinyImageView: UIImageView!
	@IBOutlet weak var descriptionLabel: UILabel!
	@IBOutlet weak var fromDateLabel: UILabel!
	@IBOutlet weak var toDateLabel: UILabel!
	
    @IBOutlet weak var activitiesHeight: NSLayoutConstraint!
    
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
        setupInitalDate()
        toDateLabel.text = DateFormatter().string(from: toDate, with: "dd/MM/YY")
        fromDateLabel.text = DateFormatter().string(from: fromDate, with: "dd/MM/YY")
		destinyImageView.layer.cornerRadius = 4.0
		destinyImageView.layer.borderWidth = 2.0
		destinyImageView.layer.borderColor = UIColor.black.cgColor
		destinyImageView.clipsToBounds = true


	}

    func setupViews(with destiny: Destiny) {
        descriptionLabel.text = destiny.description
        destinyImageView.image = destiny.image
    }

    private func setupInitalDate() {
        var dateComponent = DateComponents()
        dateComponent.day = 1
        dateComponent.month = 1
        dateComponent.year = 2020
        let fromDay = Calendar.current.date(from: dateComponent)

        dateComponent.day = 15
        let toDay = Calendar.current.date(from: dateComponent)
        fromDate = fromDay!
        toDate = toDay!
    }

    func setupActivities() {
        activitiesContainer.removeAllArrangedSubviews()
        var stackHeight = 0
        for activity in self.activities {
                let activityView = ActivityView.loadFromNib()
                activityView.viewDelegate = self
            activityView.setupView(activity, active: isSelectedActivityType(activity))
                stackHeight += 55
                activitiesContainer.addArrangedSubview(activityView)

        }
        activitiesHeight.constant = CGFloat(stackHeight)
    }

    private func isSelectedActivityType(_ type: ActivityType) -> Bool {
        for aType in selectedActivities {
            if aType.rawValue == type.rawValue {
                return true
            }
        }
        return false
    }

    @IBAction func fromDate(_ sender: Any) {
        ActionSheetDatePicker.show(withTitle: "Desde", datePickerMode: .date, selectedDate: fromDate, minimumDate: Date(), maximumDate: Date(timeIntervalSinceNow: 3600 * 24 * 365), doneBlock: { [weak self] (picker, selectedDate, _) in

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
        ActionSheetDatePicker.show(withTitle: "Hasta", datePickerMode: .date, selectedDate: toDate, minimumDate: Date(), maximumDate: Date(timeIntervalSinceNow: 3600 * 24 * 365), doneBlock: { [weak self] (picker, selectedDate, _) in

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

extension TripView: ActivityViewDelegate {
    func selectActivity(activity: ActivityType, active: Bool) {
        if !active {
            selectedActivities = selectedActivities.filter { (anActivity) -> Bool in
                return anActivity.rawValue != activity.rawValue
            }
        } else {
            selectedActivities.append(activity)
        }
        print(selectedActivities.count)
    }
}
