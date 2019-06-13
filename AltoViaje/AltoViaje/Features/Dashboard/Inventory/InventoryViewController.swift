//
//  InventoryViewController.swift
//  AltoViaje
//
//  Created by Nicolas Alvarez on 6/12/19.
//  Copyright © 2019 AltoViaje. All rights reserved.
//

import UIKit

class InventoryViewController: UIViewController {
    var flights: [Flight] = [Flight(name: "Latam, Económico", price: 6000, image: #imageLiteral(resourceName: "latam")),
                             Flight(name: "Aerolineas Argentinas, Económico", price: 6300, image: #imageLiteral(resourceName: "aerolineas"))]

    var equips: [Equipment] = [Equipment(name: "Bolsa de Dormir Térmica Broksol", price: 1380, image: #imageLiteral(resourceName: "bolsa")),
                               Equipment(name: "Campera Columbia Hombre", price: 1880, image: #imageLiteral(resourceName: "Image")),
                               Equipment(name: "Zapatilla Montagne Hombre", price: 2000, image: #imageLiteral(resourceName: "zapatillas")),
                               Equipment(name: "Carpa Iglu Pavillo", price: 850, image: #imageLiteral(resourceName: "carpa")),
                               Equipment(name: "Mochila Camping 25l Gadnic", price: 2000, image: #imageLiteral(resourceName: "mochila")),
                               Equipment(name: "Cantimplora 0.80l Gibson's", price: 390, image: #imageLiteral(resourceName: "cantimplora")),
                               Equipment(name: "Brújula Waterdog", price: 270, image: #imageLiteral(resourceName: "brujula"))]

    var transports: [Transport] = [Transport(name: "Combi 'Jumping' a Tronador", price: 350, image: #imageLiteral(resourceName: "Bariloche")),
                                   Transport(name: "Combi 'Rodriguez' a Frey", price: 320, image: #imageLiteral(resourceName: "frey"))]

    var housing: [Housing] = [Housing(name: "Hostel 'Aventura'", price: 800, image: #imageLiteral(resourceName: "hostel1")),
                              Housing(name: "Hostel 'Casa Blanca'", price: 750, image: #imageLiteral(resourceName: "hostel2")),
                              Housing(name: "Camping 'Los Rápidos'", price: 500, image: #imageLiteral(resourceName: "camping"))]

    var data: [[Buyable]] {
        get {
            return [flights, housing, transports, equips]
        }
    }

    var selectedItems: [Buyable] = []
    var days: Int = 3

    @IBOutlet weak var billView: UIView!
    @IBOutlet weak var itemsTable: UITableView!
    @IBOutlet weak var toPayLabel: UILabel!
    @IBOutlet weak var continueButton: UIButton!
    var billToPay = 0 {
        didSet {
            toPayLabel.text = "$\(billToPay)"
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Carrito"
        billView.layer.borderColor = UIColor.lightGray.cgColor
        billView.layer.borderWidth = 1
        billToPay = 0
        continueButton.layer.cornerRadius = 5
        itemsTable.register(UINib.init(nibName: "InventoryViewCell", bundle: nil), forCellReuseIdentifier: InventoryViewCell.identifier)
        itemsTable.register(UINib.init(nibName: "InventoryHeaderView", bundle: nil), forHeaderFooterViewReuseIdentifier: "InventoryHeader")
    }

    private func removeSelectedItem(_ item: Buyable) {
        selectedItems = selectedItems.filter({ (aItem) -> Bool in
            return aItem.name != item.name
        })
        var multiplier = 1
        if item is Housing {
            multiplier = days
        }

        billToPay -= multiplier * item.price
    }

    private func addSelectedItem(_ item: Buyable) {
        selectedItems.append(item)
        var multiplier = 1
        if item is Housing {
            multiplier = days
        }

        billToPay += multiplier * item.price
    }

    @IBAction func proceedToBuy(_ sender: Any) {

    }

}

extension InventoryViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        addSelectedItem(data[indexPath.section][indexPath.row])
        if indexPath.section == 0 || indexPath.section == 1 {
            let indexesSelected = tableView.indexPathsForSelectedRows?.filter({ path -> Bool in
                return indexPath.section == path.section && indexPath.row != path.row
            })
            for indexSelected in indexesSelected ?? [] {
                removeSelectedItem(data[indexSelected.section][indexSelected.row])
                tableView.deselectRow(at: indexSelected, animated: true)
            }
        }

    }

    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        removeSelectedItem(data[indexPath.section][indexPath.row])
    }
}

extension InventoryViewController: UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "InventoryHeader") as? InventoryHeaderView else {
            return nil
        }
        var title: String
        switch section {
        case 0:
            title = "Vuelos"
        case 1:
            title =  "Alojamientos"
        case 2:
            title =  "Transportes"
        case 3:
            title =  "Equipo"
        default:
            title =  ""
        }
        headerView.headerTitle.text = title
        return headerView

    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data[section].count
        
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let data: [[Buyable]] = [flights, housing, transports, equips]
        guard let cell = tableView.dequeueReusableCell(withIdentifier: InventoryViewCell.identifier) as? InventoryViewCell else {
            return UITableViewCell()
        }

        cell.setupCell(data[indexPath.section][indexPath.row])

        return cell
    }


}
