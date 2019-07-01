//
//  ItineraryViewController.swift
//  AltoViaje
//
//  Created by Agustin Palmeira on 08/06/2019.
//  Copyright © 2019 AltoViaje. All rights reserved.
//

import Foundation
import MapKit
import UIKit

class ItineraryViewController: UIViewController {

	//MARK: - Variables
	private var activities: [DateActivity]!
	var tableView: UITableView!

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
		tableView = UITableView()
		view.addSubview(tableView)
        tableView.backgroundView = UIImageView(image: #imageLiteral(resourceName: "backgroundApp"))
		tableView.delegate = self
		tableView.dataSource = self
		tableView.frame = view.bounds
		tableView.separatorStyle = .none
		tableView.register(ItineraryCell.self, forCellReuseIdentifier: ItineraryCell.identifier)
		tableView.register(UINib.init(nibName: "InventoryHeaderView", bundle: nil),
						   forHeaderFooterViewReuseIdentifier: "InventoryHeader")
	}
}

//extension ItineraryViewController: ItineraryViewDelegate {
//	func openMap(title: String) {
//		//MARK: Do stuff here!!!
//		let viewController = MapViewController(title: title)
//		navigationController?.pushViewController(viewController, animated: true)
//	}
//}

//MARK: - UITableViewDelegate

extension ItineraryViewController: UITableViewDelegate {

	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		//TODO: DON'T MOCK LOCATION!
		let dateActivity = activities![indexPath.section]
		let coordinate = CoordinateManager.instance.getCoordinate(fromString: dateActivity.activities[indexPath.row])
		let tour = TourActivity(date: dateActivity.date, title: dateActivity.activities[indexPath.row], description: "", coordinate: coordinate)

		let viewController = ActivityDetailViewController(withActivity: tour)
		viewController.delegate = self
		navigationController?.pushViewController(viewController, animated: true)
	}

	func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
		return 0
	}

	func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
		guard let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "InventoryHeader") as? InventoryHeaderView else {
			return nil
		}
		headerView.headerTitle.text = DateFormatter().string(from: activities![section].date, with: "dd/MM/YYYY")
		
		return headerView
	}

	func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
		let view = UIView(frame: .zero)
		view.backgroundColor = .none

		return view
	}

	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		return UIScreen.main.bounds.size.height * 0.1
	}

	func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
		return UIScreen.main.bounds.size.height * 0.1
	}
}

//MARK: - UITableViewDataSource

extension ItineraryViewController: UITableViewDataSource {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return activities[section].activities.count
	}

	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = ItineraryCell(style: .default, reuseIdentifier: ItineraryCell.identifier)
		cell.setup(withActivity: activities![indexPath.section].activities[indexPath.row])
		cell.selectionStyle = .none

		return cell
	}

	func numberOfSections(in tableView: UITableView) -> Int {
		return activities.count
	}
}

extension ItineraryViewController: ActivityDetailViewControllerDelegate {
	func deleteActivity() {
		//TODO: Implement.
	}
}
