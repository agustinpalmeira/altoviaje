//
//  DashboardViewController.swift
//  AltoViaje
//
//  Created by Nicolas Alvarez on 6/2/19.
//  Copyright © 2019 AltoViaje. All rights reserved.
//

import UIKit

class DashboardViewController: UIViewController {
    @IBOutlet weak var tripsTable: UITableView!
    @IBOutlet weak var menuView: MenuView!

    let menuItems: [MenuItemModel] = [
        MenuItemModel(image: #imageLiteral(resourceName: "planeIcon"), name: "Vuelos"),
        MenuItemModel(image: #imageLiteral(resourceName: "lodging"), name: "Alojamiento"),
        MenuItemModel(image: #imageLiteral(resourceName: "trip"), name: "Recorrido"),
        MenuItemModel(image: #imageLiteral(resourceName: "suitcase"), name: "Paquetes"),
        MenuItemModel(image: #imageLiteral(resourceName: "equipment"), name: "Equipo"),
        MenuItemModel(image: #imageLiteral(resourceName: "transport"), name: "Transporte")
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTable()
        setupMenu()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
    }

    private func setupMenu() {
        menuView.setDelegate(self)
        menuView.setDataSource(self)
    }

    private func setupTable() {
        tripsTable.register(UINib.init(nibName: "DashboardCell", bundle: nil), forCellReuseIdentifier: DashboardCell.cellIdentifier)
    }
}

extension DashboardViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 8
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return tableView.dequeueReusableCell(withIdentifier: DashboardCell.cellIdentifier, for: indexPath)
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }


}

extension DashboardViewController: UICollectionViewDelegate {

}

extension DashboardViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return menuItems.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let item = collectionView.dequeueReusableCell(withReuseIdentifier: MenuCell.itemIdentifier, for: indexPath) as? MenuCell else {
            return UICollectionViewCell()
        }
        item.configureCell(menuItems[indexPath.row])
        return item
    }


}

extension DashboardViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //let tripVC = TripViewController(nibName:"TripViewController", bundle: nil)
        //navigationController?.pushViewController(tripVC, animated: true)

		let vc = MyTripsViewController()
		navigationController?.pushViewController(vc, animated: true)
    }
}
