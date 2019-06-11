//
//  MapViewController.swift
//  AltoViaje
//
//  Created by Agustin Palmeira on 11/06/2019.
//  Copyright © 2019 AltoViaje. All rights reserved.
//

import Foundation
import UIKit

class MapViewController: UIViewController {

	//Variables
	var titleText: String!

	// MARK: - View life cycle

	override func viewDidLoad() {
		super.viewDidLoad()
		setSubViews()
	}

	override func viewWillAppear(_ animated: Bool) {
		navigationController?.setNavigationBarHidden(false, animated: true)
		navigationItem.title = "Ubicacion"
	}

	// MARK: - Initialization

	init(title: String) {
		super.init(nibName: nil, bundle: nil)
		titleText = title
	}

	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	// MARK: - Configure Sub Views

	private func setSubViews() {
		let mapView = MapView(title: titleText)
		view.addSubview(mapView)
		mapView.frame = view.bounds
	}
}

