//
//  MyTripsViewController.swift
//  AltoViaje
//
//  Created by Agustin Palmeira on 07/06/2019.
//  Copyright © 2019 AltoViaje. All rights reserved.
//

import Foundation
import UIKit

class MyTripsViewController: UIViewController {

	@IBOutlet weak var myTripsView: MyTripsView!
	
	//MARK: - View life cycle
	override func viewDidLoad() {
		super.viewDidLoad()
		setSubviews()
	}

	//MARK: - Configure subviews
	private func setSubviews() {
		myTripsView.delegate = self
		myTripsView.setTableDataSource(self)
		myTripsView.setTableViewDelegate(self)
	}
}

//MARK: - Extensions

extension MyTripsViewController: UITableViewDataSource {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return 1
	}

	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		return tableView.dequeueReusableCell(withIdentifier: MyTripsCell.cellIdentifier, for: indexPath)
	}

	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		return 200
	}
}

extension MyTripsViewController: UITableViewDelegate {
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		//TODO: Implement the view controller that should be pushed by the navigation
		//let viewController = ...(nibName:"", bundle: nil)
		//navigationController?.pushViewController(viewController, animated: true)
	}
}

extension MyTripsViewController: MyTripsViewDelegate {
	func createNewTrip() {
		//TODO: Implement where should this button lead to.
	}
}
