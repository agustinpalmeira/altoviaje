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
	private var activities: [DateActivity]!
//	private var section: [String]!
//	private var items: [String]!
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

		//tableView.backgroundColor = .none
		tableView.register(ItineraryCell.self, forCellReuseIdentifier: ItineraryCell.identifier)
		tableView.register(UINib.init(nibName: "InventoryHeaderView", bundle: nil), forHeaderFooterViewReuseIdentifier: "InventoryHeader")

		//tableView.sectionFooterHeight = 0
		//tableView.estimatedSectionHeaderHeight = 10
	}
}

//extension ItineraryViewController: ItineraryViewDelegate {
//	func openMap(title: String) {
//		//MARK: Do stuff here!!!
//		let viewController = MapViewController(title: title)
//		navigationController?.pushViewController(viewController, animated: true)
//	}
//}

extension ItineraryViewController: UITableViewDelegate {

	func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
		return 1
	}

	func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
		guard let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "InventoryHeader") as? InventoryHeaderView else {
			return nil
		}
		headerView.headerTitle.text = activities![section].date

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

extension ItineraryViewController: UITableViewDataSource {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return activities[section].activities.count
	}

	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = ItineraryCell(style: .default, reuseIdentifier: ItineraryCell.identifier)
		cell.setup(withActivity: activities![indexPath.section].activities[indexPath.row])

		return cell
	}

	func numberOfSections(in tableView: UITableView) -> Int {
		return activities.count
	}
}
