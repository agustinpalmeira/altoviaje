//
//  ItineraryViewController.swift
//  AltoViaje
//
//  Created by Agustin Palmeira on 08/06/2019.
//  Copyright © 2019 AltoViaje. All rights reserved.
//

import Foundation
import UIKit

class ItineraryViewController: UIViewController {

	//MARK: - Variables
	var activities: [DateActivity]!

	// MARK: - View life cycle

	override func viewDidLoad() {
		super.viewDidLoad()
		setSubViews()
	}

	override func viewWillAppear(_ animated: Bool) {
		navigationController?.setNavigationBarHidden(false, animated: true)
		navigationItem.title = "Itinerario"
	}

	// MARK: - Initialization

	init(activities: [DateActivity]) {
		super.init(nibName: nil, bundle: nil)
		self.activities = activities
	}

	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	// MARK: - Configure Sub Views

	private func setSubViews() {
		let itineraryView = ItineraryView(activities: activities)
		itineraryView.delegate = self
		view.addSubview(itineraryView)
		itineraryView.frame = view.bounds
	}
}

extension ItineraryViewController: ItineraryViewDelegate {
	func openMap(title: String) {
		//MARK: Do stuff here!!!
		
	}
}
