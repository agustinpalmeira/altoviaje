//
//  MyTripsViewController.swift
//  AltoViaje
//
//  Created by Agustin Palmeira on 07/06/2019.
//  Copyright © 2019 AltoViaje. All rights reserved.
//

/* Mock data for loading the view controller:

var activitiesArray = ["Vuelo Bs. As. -> Bariloche", "Alojamiento solcito"]
var dateActivity = DateActivity(date: "01/01/2020", activities: activitiesArray)
var datesActivities = [dateActivity]

activitiesArray = ["Excursión Tronador"]
dateActivity = DateActivity(date: "05/01/2020", activities: activitiesArray)
datesActivities.append(dateActivity)

activitiesArray = ["Excursión Frey"]
dateActivity = DateActivity(date: "09/01/2020", activities: activitiesArray)
datesActivities.append(dateActivity)

activitiesArray = ["Vuelo Bariloche -> Bs. As."]
dateActivity = DateActivity(date: "15/01/2020", activities: activitiesArray)
datesActivities.append(dateActivity)

let package = Package(dateFrom: "01/01/2020", dateTo: "15/01/2020",
destiny: "Bariloche",
image: #imageLiteral(resourceName: "Bariloche"),
activities: datesActivities)

//View controller
let tripVC = MyTripsViewController(nibName:"MyTripsViewController", bundle: nil)
tripVC.packagesArray = [package, package]
navigationController?.pushViewController(tripVC, animated: true)

*/

import Foundation
import UIKit

class MyTripsViewController: UIViewController {

	@IBOutlet weak var myTripsView: MyTripsView!
	var packagesArray: [Package]! {
		didSet {
			myTripsView.tableView.reloadData()
		}
	}
	
	//MARK: - View life cycle
	override func viewDidLoad() {
		super.viewDidLoad()
		setSubviews()

		var activitiesArray = ["Vuelo Bs. As. -> Bariloche", "Alojamiento solcito"]
		var dateActivity = DateActivity(date: "01/01/2020", activities: activitiesArray)
		var datesActivities = [dateActivity]

		activitiesArray = ["Excursión Tronador"]
		dateActivity = DateActivity(date: "05/01/2020", activities: activitiesArray)
		datesActivities.append(dateActivity)

		activitiesArray = ["Excursión Frey"]
		dateActivity = DateActivity(date: "09/01/2020", activities: activitiesArray)
		datesActivities.append(dateActivity)

		activitiesArray = ["Vuelo Bariloche -> Bs. As."]
		dateActivity = DateActivity(date: "15/01/2020", activities: activitiesArray)
		datesActivities.append(dateActivity)

		let package = Package(dateFrom: "01/01/2020", dateTo: "15/01/2020",
							  destiny: "Bariloche",
							  image: #imageLiteral(resourceName: "Bariloche"),
							  activities: datesActivities)

		packagesArray = [package]
	}

	override func viewWillAppear(_ animated: Bool) {
		navigationController?.setNavigationBarHidden(false, animated: true)
		navigationItem.title = "Mis Viajes"
	}

	//MARK: - Configure subviews
	private func setSubviews() {
		myTripsView.delegate = self
		packagesArray = []
		myTripsView.setTableDataSource(self)
		myTripsView.setTableViewDelegate(self)
	}

	//MARK: - Initialization
//	init(packages: [Package]) {
//		super.init(nibName: nil, bundle: nil)
//		self.packagesArray = packages
//	}
//
//	required init?(coder aDecoder: NSCoder) {
//		fatalError("init(coder:) has not been implemented")
//	}
}

//MARK: - Extensions

extension MyTripsViewController: UITableViewDataSource {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return packagesArray.count
	}

	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell: MyTripsCell = tableView.dequeueReusableCell(withIdentifier: MyTripsCell.cellIdentifier) as! MyTripsCell
		let package = packagesArray![indexPath.row]
		cell.dateFromLabel.text = package.dateFrom
		cell.dateToLabel.text = package.dateTo
		cell.destinyTitleLabel.text = package.destiny
		cell.placeImageView.image = package.image
		
		return cell
	}

	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		return 200
	}
}

extension MyTripsViewController: UITableViewDelegate {
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		let viewController = ItineraryViewController(activities: packagesArray[indexPath.row].activities)
		navigationController?.pushViewController(viewController, animated: true)
	}
}

extension MyTripsViewController: MyTripsViewDelegate {
	func createNewTrip() {
		//TODO: Implement where should this button lead to.
	}
}
