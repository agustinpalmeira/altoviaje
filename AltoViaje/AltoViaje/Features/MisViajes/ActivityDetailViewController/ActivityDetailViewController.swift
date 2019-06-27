//
//  ActivityDetailViewController.swift
//  AltoViaje
//
//  Created by Agustin Palmeira on 26/06/2019.
//  Copyright © 2019 AltoViaje. All rights reserved.
//

import Foundation
import UIKit

class ActivityDetailViewController: UIViewController {

	//MARK: - Variables
	var activity: TourActivity!

	// MARK: - View life cycle

	override func viewDidLoad() {
		super.viewDidLoad()
		setSubViews()
	}

	override func viewWillAppear(_ animated: Bool) {
		navigationController?.setNavigationBarHidden(false, animated: true)
		navigationItem.title = "Actividad"
	}

	// MARK: - Initialization

	init(withActivity activity: TourActivity) {
		super.init(nibName: nil, bundle: nil)
		self.activity = activity
		setSubViews()
	}

	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	//MARK: - Configure Sub Views

	private func setSubViews() {
		let activityView = ActivityDetailView(withActivity: activity)
		view.addSubview(activityView)
		activityView.frame = view.bounds
	}
}
