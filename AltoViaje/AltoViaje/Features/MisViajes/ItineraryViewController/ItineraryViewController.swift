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

	private let itineraryView: ItineraryView = {
		let view = ItineraryView()

		return view
	}()

	// MARK: - View life cycle

	override func viewDidLoad() {
		super.viewDidLoad()
		setSubViews()
	}

	// MARK: - Initialization

	init() {
		super.init(nibName: nil, bundle: nil)
	}

	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	// MARK: - Configure Sub Views

	fileprivate func setSubViews() {
		view.addSubview(itineraryView)
		itineraryView.topAnchor.constraint(equalTo: view.topAnchor)
		itineraryView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
		itineraryView.leadingAnchor.constraint(equalTo: view.leadingAnchor)
		itineraryView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
	}
}
