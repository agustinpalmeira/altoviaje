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
    @IBOutlet weak var newTripBoockedView: UIView!
    @IBOutlet weak var newTripTileView: UIView!

    let menuItems: [MenuItemModel] = [
        MenuItemModel(image: #imageLiteral(resourceName: "planeIcon"), name: "Vuelos"),
        MenuItemModel(image: #imageLiteral(resourceName: "lodging"), name: "Alojamiento"),
        MenuItemModel(image: #imageLiteral(resourceName: "trip"), name: "Recorrido"),
        MenuItemModel(image: #imageLiteral(resourceName: "suitcase"), name: "Paquetes"),
        MenuItemModel(image: #imageLiteral(resourceName: "equipment"), name: "Equipo"),
        MenuItemModel(image: #imageLiteral(resourceName: "transport"), name: "Transporte")
    ]

    let trips: [Trip] = [
        Trip(place: "Bariloche", placeholder: #imageLiteral(resourceName: "Bariloche"), estimatedPrize: 6500),
        Trip(place: "Iguazu", placeholder: #imageLiteral(resourceName: "Iguazu"), estimatedPrize: 6200),
        Trip(place: "Salta", placeholder: #imageLiteral(resourceName: "Salta"), estimatedPrize: 7200)
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupTable()
        setupMenu()
        setupWatcher()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
    }

    private func setupWatcher() {
        NotificationCenter.default.addObserver(self, selector: #selector(newTripBoocked), name: AltoViajeNotification.newTripBoocked.name, object: nil)
    }

    private func setupViews() {
        newTripTileView.layer.cornerRadius = 15
        newTripBoockedView.alpha = 0
    }

    private func setupMenu() {
        menuView.setDelegate(self)
        menuView.setDataSource(self)
    }

    private func setupTable() {
        tripsTable.register(UINib.init(nibName: "DashboardCell", bundle: nil), forCellReuseIdentifier: DashboardCell.cellIdentifier)
    }

    @objc func newTripBoocked() {
        showNewTrip()
    }

    func showNewTrip() {
        UIView.animate(withDuration: 0.5, animations: {  [weak self] in
            self?.menuView.alpha = 0
        }) { _ in
            UIView.animate(withDuration: 0.5, animations: {  [weak self] in
                self?.newTripBoockedView.alpha = 1
                }, completion: { _ in
                    Timer.scheduledTimer(withTimeInterval: 1, repeats: false, block: { [weak self] _ in
                        self?.hideNewTrip()
                    })
            })
        }
    }

    func hideNewTrip() {
        UIView.animate(withDuration: 0.5, animations: {  [weak self] in
            self?.newTripBoockedView.alpha = 0
        }) { _ in
            UIView.animate(withDuration: 0.5, animations: {  [weak self] in
                self?.menuView.alpha = 1
                }, completion: nil)
        }
    }
}

extension DashboardViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return trips.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: DashboardCell.cellIdentifier, for: indexPath) as? DashboardCell else {
            return DashboardCell()
        }
        cell.configCell(trips[indexPath.row])
        return cell
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
        let tripVC = TripViewController(nibName:"TripViewController", bundle: nil)
        navigationController?.pushViewController(tripVC, animated: true)
    }
}
