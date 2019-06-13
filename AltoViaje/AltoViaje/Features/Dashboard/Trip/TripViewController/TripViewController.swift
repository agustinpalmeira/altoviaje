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
		navigationItem.title = "Bariloche"
	}

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        var dateComponent = DateComponents()
        dateComponent.day = 1
        dateComponent.month = 1
        dateComponent.year = 2019

        var dateComponent1 = DateComponents()
        dateComponent1.day = 1
        dateComponent1.month = 9
        dateComponent1.year = 2019

        var dateComponent2 = DateComponents()
        dateComponent2.day = 1
        dateComponent2.month = 4
        dateComponent2.year = 2020

        possibleActivities = [
            Activity(name: "Trekking", availableFrom: Calendar.current.date(from: dateComponent) ?? Date(), availableTo: Date(timeIntervalSinceNow: 3600 * 24 * 365), active: false),
                               Activity(name: "Playa", availableFrom: Calendar.current.date(from: dateComponent1) ?? Date(), availableTo: Calendar.current.date(from: dateComponent2) ?? Date(), active: false),
        Activity(name: "Camping", availableFrom: Calendar.current.date(from: dateComponent) ?? Date(), availableTo: Date(timeIntervalSinceNow: 3600 * 24 * 365), active: false),
        Activity(name: "Montañismo", availableFrom:  Calendar.current.date(from: dateComponent) ?? Date(), availableTo: Date(timeIntervalSinceNow: 3600 * 24 * 365), active: false)]
        navigationController?.setNavigationBarHidden(false, animated: true)
        tripView.activities = possibleActivities
    }
    @IBAction func moveToCart(_ sender: Any) {
        let cartVC = InventoryViewController(nibName: "InventoryViewController", bundle: nil)
        let days = Calendar.current.dateComponents([.day], from: tripView.fromDate, to: tripView.toDate)
        let daysForTrip = days.day ?? 0
        cartVC.days = daysForTrip + 1
        navigationController?.pushViewController(cartVC, animated: true)
    }
    override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
	}
}
