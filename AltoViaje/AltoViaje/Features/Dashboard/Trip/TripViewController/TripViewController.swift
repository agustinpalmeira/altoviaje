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

	override func viewDidLoad() {
		super.viewDidLoad()
	}

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
	}
}
