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
    var destiny: Destiny!

	@IBOutlet weak var tripView: TripView!

    var possibleActivities: [ActivityType] = [.beach, .camping, .climbing, .trekking]

    var selectedActivities: [ActivityType] = []

	override func viewDidLoad() {
		super.viewDidLoad()
		navigationItem.title = destiny.place
        navigationController?.setNavigationBarHidden(false, animated: true)
        tripView.setupViews(with: destiny)
	}

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tripView.activities = possibleActivities
    }
    @IBAction func moveToCart(_ sender: Any) {
        let cartVC = InventoryViewController(nibName: "InventoryViewController", bundle: nil)
        cartVC.selectedActivities = tripView.selectedActivities
        let days = Calendar.current.dateComponents([.day], from: tripView.fromDate, to: tripView.toDate)
        let daysForTrip = days.day ?? 0
        cartVC.days = daysForTrip + 1
        navigationController?.pushViewController(cartVC, animated: true)
    }
    override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
	}
}
