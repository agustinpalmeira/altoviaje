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

    let destinies: [Destiny] = [Destiny(place: "Bariloche",
                                        description: "Bariloche es una ciudad ubicada entre bosques milenarios, montañas cubiertas de nieve y lagos cristalinos, en la provincia de Río Negro, Argentina. Se trata de una postal de nuestra Patagonia. Una ciudad anfitriona por excelencia, enmarcada por algunas de las bellezas naturales más importantes del país.",
                                        image: #imageLiteral(resourceName: "Bariloche"),
                                        estimatedPrize: 6500,
                                        activities: [
                                            Activity(name: BarilocheItinerary.vueloIda, description: "Vuelo de ida de Buenos Aires a Bariloche", date: Date(timeInterval: 86400*30, since: Date())),
                                            Activity(name: BarilocheItinerary.tronadorExcursion, description: "El cerro Tronador es un volcán geológicamente inactivo. Su altura de 3554 msnm lo destaca entre los macizos montañosos del Parque nacional Nahuel Huapi. El Tronador posee un total de siete glaciares distrubuidos en su superficie", date: Date(timeInterval: 86400*30 + 86400, since: Date())),
                                            Activity(name: BarilocheItinerary.catedralExcursion, description: "El cerro Catedral es una montaña ubicada en San Carlos de Bariloche, a 19 kilómetros del centro de la ciudad y dentro del Parque Nacional Nahuel Huapi. Es el centro de esquí más grande de Sudamérica", date: Date(timeInterval: 86400*30 + 86400 * 2, since: Date())),
                                            Activity(name: BarilocheItinerary.vueloVuelta, description: "Vuelo de vuelta de  Bariloche a Buenos Aires", date: Date(timeInterval: 86400*30 + 86400*15, since: Date()))]),
                                Destiny(place: "Iguazu",
                                        description: "Bariloche es una ciudad ubicada entre bosques milenarios, montañas cubiertas de nieve y lagos cristalinos, en la provincia de Río Negro, Argentina. Se trata de una postal de nuestra Patagonia. Una ciudad anfitriona por excelencia, enmarcada por algunas de las bellezas naturales más importantes del país.",
                                        image: #imageLiteral(resourceName: "Iguazu"),
                                        estimatedPrize: 6200,
                                        activities: [
                                            Activity(name: IguazuItinerary.vueloIda, description: "Vuelo de vuelta de  Iguazu a Buenos Aires", date: Date(timeInterval: 86400*60, since: Date())),
                                            Activity(name: IguazuItinerary.cataratasExcursion, description: "Las majestuosas Cataratas del Iguazú se encuentran en el interior del Parque Nacional Iguazú, un área de preservación de la naturaleza que abarca 67.720 hectáreas en el extremo norte de la Provincia de Misiones, en la República Argentina.", date: Date(timeInterval: 86400*60 + 86400, since: Date())),
                                            Activity(name: IguazuItinerary.wandaExcursion, description: "Ubicadas a 40 kilómetros de Puerto Iguazú y a 260 de Posadas, se encuentran las famosas Minas de Wanda, en un yacimiento de piedras semipreciosas de cristales de cuarzo, amatistas, ágatas y topacios, entre las más importantes.", date: Date(timeInterval: 86400*60 + 86400*2, since: Date())),
                                            Activity(name: IguazuItinerary.vueloVuelta, description: "Vuelo de vuelta de  Iguazu a Buenos Aires", date: Date(timeInterval: 86400*60 + 86400*15, since: Date()))]),
                                Destiny(place: "Salta",
                                        description: "Bariloche es una ciudad ubicada entre bosques milenarios, montañas cubiertas de nieve y lagos cristalinos, en la provincia de Río Negro, Argentina. Se trata de una postal de nuestra Patagonia. Una ciudad anfitriona por excelencia, enmarcada por algunas de las bellezas naturales más importantes del país.",
                                        image: #imageLiteral(resourceName: "Salta"),
                                        estimatedPrize: 7200,
                                        activities: [
                                            Activity(name: SaltaItinerary.vueloIda, description: "Vuelo de vuelta de  Salta a Buenos Aires", date: Date(timeInterval: 86400*90, since: Date())),
                                            Activity(name: SaltaItinerary.trenNubesExcursion, description: "Un viaje en plena puna salteña que combina sus servicios en dos tramos, para luego embarcar a la mágica experiencia del Tren a las Nubes.", date: Date(timeInterval: 86400*90 + 86400, since: Date())),
                                            Activity(name: SaltaItinerary.salinasGrandesExcursion, description: "Las Salinas Grandes consisten en un salar que se extienden hasta donde alcanza la vista, perdiéndose en el horizonte.", date: Date(timeInterval: 86400*90 + 86400*2, since: Date())),
                                            Activity(name: SaltaItinerary.tastilExcursion, description: "Las Ruinas de Tastil, declaradas Monumento Histórico Nacional fue la ciudad precolombina más grande ubicada en el actual territorio argentino.", date: Date(timeInterval: 86400*90 + 86400*3, since: Date())),
                                            Activity(name: SaltaItinerary.cafayateExcursion, description: "La ciudad de Cafayate se encuentra rodeada de las maravillas que el tiempo ha llegado a formar con sus llamativas y coloridas formaciones rocosas tales como la garganta del diablo, el anfiteatro, el sapo, el fraile, el obelisco y las ventanas", date: Date(timeInterval: 86400*90 + 86400*4, since: Date())),
                                            Activity(name: SaltaItinerary.vueloVuelta, description: "Vuelo de vuelta de  Salta a Buenos Aires", date: Date(timeInterval: 86400*90 + 86400*15, since: Date()))
                                            ])]

    let menuItems: [MenuItemModel] = [
        MenuItemModel(image: #imageLiteral(resourceName: "suitcase"), name: "Paquetes", active: true),
        MenuItemModel(image: #imageLiteral(resourceName: "planeIcon"), name: "Vuelos", active: false),
        MenuItemModel(image: #imageLiteral(resourceName: "lodging"), name: "Alojamiento", active: false),
        MenuItemModel(image: #imageLiteral(resourceName: "trip"), name: "Recorrido", active: false),
        MenuItemModel(image: #imageLiteral(resourceName: "equipment"), name: "Equipo", active: false),
        MenuItemModel(image: #imageLiteral(resourceName: "transport"), name: "Transporte", active: false)
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
        return destinies.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: DashboardCell.cellIdentifier, for: indexPath) as? DashboardCell else {
            return DashboardCell()
        }
        cell.configCell(destinies[indexPath.row])
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
        tripVC.destiny = destinies[indexPath.row]
        navigationController?.pushViewController(tripVC, animated: true)
    }
}
