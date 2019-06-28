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
		view.translatesAutoresizingMaskIntoConstraints = false
		activityView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
		activityView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
		activityView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true

		let activityBarMenuView = ActivityBarMenuView()
		view.addSubview(activityBarMenuView)
		activityBarMenuView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
		activityBarMenuView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
		activityBarMenuView.topAnchor.constraint(equalTo: activityView.bottomAnchor).isActive = true
		activityBarMenuView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
	}
}
