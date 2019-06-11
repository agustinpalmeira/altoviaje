//
//  TripViewController.swift
//  AltoViaje
//
//  Created by Agustin Palmeira on 05/06/2019.
//  Copyright © 2019 AltoViaje. All rights reserved.
//

import Foundation
import UIKit

class TripViewController: UIViewController {
	@IBOutlet weak var tripView: TripView!

    var possibleActivities: [Activity] = [
    ]

    var selectedActivities: [Activity] = []

	override func viewDidLoad() {
		super.viewDidLoad()
	}

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        var dateComponent1 = DateComponents()
        dateComponent1.day = 1
        dateComponent1.month = 9
        dateComponent1.year = 2019

        var dateComponent2 = DateComponents()
        dateComponent2.day = 1
        dateComponent2.month = 4
        dateComponent2.year = 2020

        possibleActivities = [ Activity(name: "Trekking", availableFrom: Date(), availableTo: Date(timeIntervalSinceNow: 3600 * 24 * 365)),
        Activity(name: "Playa", availableFrom: Calendar.current.date(from: dateComponent1) ?? Date(), availableTo: Calendar.current.date(from: dateComponent2) ?? Date()),
        Activity(name: "Camping", availableFrom: Date(), availableTo: Date(timeIntervalSinceNow: 3600 * 24 * 365)),
        Activity(name: "Montañismo", availableFrom:  Calendar.current.date(from: dateComponent1) ?? Date(), availableTo: Date(timeIntervalSinceNow: 3600 * 24 * 365))]
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
	}
}
