//
//  InventoryViewController.swift
//  AltoViaje
//
//  Created by Nicolas Alvarez on 6/12/19.
//  Copyright © 2019 AltoViaje. All rights reserved.
//

import UIKit

class InventoryViewController: UIViewController {
    var flights: [Flight] = []
    var equips: [Equipment] = []
    var transports: [Transport] = []
    var housing: [Housing] = []

    @IBOutlet weak var itemsTable: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

}

extension InventoryViewController: UITableViewDelegate {

}

extension InventoryViewController: UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }

    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        switch section {
        case 0:
            return "Vuelos"
        case 1:
            return "Alojamientos"
        case 2:
            return "Transportes"
        case 3:
            return "Equipo"
        default:
            return ""
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return flights.count
        case 1:
            return transports.count
        case 2:
            return housing.count
        case 3:
            return equips.count
        default:
            return 0
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }


}
