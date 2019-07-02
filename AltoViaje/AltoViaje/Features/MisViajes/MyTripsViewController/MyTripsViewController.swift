//
//  MyTripsViewController.swift
//  AltoViaje
//
//  Created by Agustin Palmeira on 07/06/2019.
//  Copyright © 2019 AltoViaje. All rights reserved.
//

/* Mock data for loading the view controller:

var activitiesArray = ["Vuelo desde Buenos Aires As hacia Bariloche", "Alojamiento Puerto Blest"]
var dateItinerary = DateItinerary(date: "01/01/2020", activities: activitiesArray)
var datesItineraries = [dateItinerary]

activitiesArray = ["Excursión Tronador"]
dateItinerary = DateItinerary(date: "05/01/2020", activities: activitiesArray)
datesItineraries.append(dateItinerary)

activitiesArray = ["Excursión Frey"]
dateItinerary = DateItinerary(date: "09/01/2020", activities: activitiesArray)
datesItineraries.append(dateItinerary)

activitiesArray = ["Vuelo desde Bariloche hacia Buenos Aires"]
dateItinerary = DateItinerary(date: "15/01/2020", activities: activitiesArray)
datesItineraries.append(dateItinerary)

let package = Package(dateFrom: "01/01/2020", dateTo: "15/01/2020",
destiny: "Bariloche",
image: #imageLiteral(resourceName: "Bariloche"),
activities: datesItineraries)

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

		var dateComponent = DateComponents()
		dateComponent.day = 1
		dateComponent.month = 1
		dateComponent.year = 2020
		var date = Calendar.current.date(from: dateComponent)

		var activitiesArray = [BarilocheItinerary.buenosAiresBariloche, BarilocheItinerary.accommodation]
		var dateItinerary = DateItinerary(date: date!, activities: activitiesArray)
		var datesItineraries = [dateItinerary]

		dateComponent.day = 5
		dateComponent.month = 1
		dateComponent.year = 2020
		date = Calendar.current.date(from: dateComponent)

		activitiesArray = [BarilocheItinerary.firstExcursion]
		dateItinerary = DateItinerary(date: date!, activities: activitiesArray)
		datesItineraries.append(dateItinerary)

		dateComponent.day = 9
		dateComponent.month = 1
		dateComponent.year = 2020
		date = Calendar.current.date(from: dateComponent)
		activitiesArray = [BarilocheItinerary.secondExcursion]
		dateItinerary = DateItinerary(date: date!, activities: activitiesArray)
		datesItineraries.append(dateItinerary)

		dateComponent.day = 15
		dateComponent.month = 1
		dateComponent.year = 2020
		date = Calendar.current.date(from: dateComponent)

		activitiesArray = [BarilocheItinerary.barilocheBuenosAires]
		dateItinerary = DateItinerary(date: date!, activities: activitiesArray)
		datesItineraries.append(dateItinerary)

		dateComponent.day = 1
		dateComponent.month = 1
		dateComponent.year = 2020
		date = Calendar.current.date(from: dateComponent)


		dateComponent.day = 15
		dateComponent.month = 1
		dateComponent.year = 2020
		let toDate = Calendar.current.date(from: dateComponent)

		let package = Package(dateFrom: date!, dateTo: toDate!,
							  destiny: "Bariloche",
							  image: #imageLiteral(resourceName: "Bariloche"),
							  itineraries: datesItineraries)

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
		cell.dateFromLabel.text = DateFormatter().string(from: package.dateFrom, with: "dd/MM/YYYY")
		cell.dateToLabel.text = DateFormatter().string(from: package.dateTo, with: "dd/MM/YYYY")
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
		let viewController = ItineraryViewController(itineraries: packagesArray[indexPath.row].itineraries)
		viewController.indexPath = indexPath
		viewController.delegate = self
		navigationController?.pushViewController(viewController, animated: true)
	}
}

extension MyTripsViewController: MyTripsViewDelegate {
	func createNewTrip() {
		tabBarController?.selectedIndex = 0
	}
}

extension MyTripsViewController: ItineraryViewControllerDelegate {
	func updatePackage(indexPath: IndexPath) {
		packagesArray[indexPath.section].itineraries.remove(at: indexPath.row)
	}
}
