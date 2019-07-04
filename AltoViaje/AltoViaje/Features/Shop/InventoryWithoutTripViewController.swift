//
//  InventoryViewController.swift
//  AltoViaje
//
//  Created by Nicolas Alvarez on 6/12/19.
//  Copyright © 2019 AltoViaje. All rights reserved.
//

import UIKit

class InventoryWithoutTripViewController: UIViewController {

    var equips: [Equipment] = [Equipment(name: "Bolsa de Dormir Térmica Broksol", price: 1380, image: #imageLiteral(resourceName: "bolsa"), forActivities: [.camping, .climbing]),
                               Equipment(name: "Campera Columbia Hombre", price: 1880, image: #imageLiteral(resourceName: "Image"), forActivities: [.camping, .climbing]),
                               Equipment(name: "Zapatilla Montagne Hombre", price: 2000, image: #imageLiteral(resourceName: "zapatillas"), forActivities: [.trekking]),
                               Equipment(name: "Carpa Iglu Pavillo", price: 850, image: #imageLiteral(resourceName: "carpa"), forActivities: [.camping]),
                               Equipment(name: "Mochila Camping 25l Gadnic", price: 2000, image: #imageLiteral(resourceName: "mochila"), forActivities: [.camping, .climbing, .trekking]),
                               Equipment(name: "Cantimplora 0.80l Gibson's", price: 390, image: #imageLiteral(resourceName: "cantimplora"), forActivities: [.camping, .climbing]),
                               Equipment(name: "Brújula Waterdog", price: 270, image: #imageLiteral(resourceName: "brujula"), forActivities: [.trekking,])]

    var selectedItems: [Buyable] = []

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
        navigationController?.setNavigationBarHidden(false, animated: true)
        navigationItem.title = "Carrito"
        billView.layer.borderColor = UIColor.lightGray.cgColor
        billView.layer.borderWidth = 1
        billToPay = 0
        continueButton.layer.cornerRadius = 5
        continueButton.layer.borderColor = UIColor.black.cgColor
        continueButton.layer.borderWidth = 1
        continueButton.isEnabled = false
        continueButton.alpha = 0.5
        itemsTable.register(UINib.init(nibName: "InventoryViewCell", bundle: nil), forCellReuseIdentifier: InventoryViewCell.identifier)
        itemsTable.register(UINib.init(nibName: "InventoryHeaderView", bundle: nil), forHeaderFooterViewReuseIdentifier: "InventoryHeader")
    }

    private func removeSelectedItem(_ item: Buyable) {
        selectedItems = selectedItems.filter({ (aItem) -> Bool in
            return aItem.name != item.name
        })

        billToPay -= item.price
        if billToPay <= 0 {
            continueButton.isEnabled = false
            continueButton.alpha = 0.5
        }
    }

    private func addSelectedItem(_ item: Buyable) {
        selectedItems.append(item)

        billToPay += item.price
        continueButton.isEnabled = true
        continueButton.alpha = 1
    }

    @IBAction func proceedToBuy(_ sender: Any) {
        let paymentVC = PaymentViewController(nibName: "PaymentViewController", bundle: nil)
        paymentVC.toPay = billToPay
        paymentVC.items = selectedItems
        navigationController?.pushViewController(paymentVC, animated: true)
    }

}

extension InventoryWithoutTripViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        addSelectedItem(equips[indexPath.row])
    }

    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        removeSelectedItem(equips[indexPath.row])
    }
}

extension InventoryWithoutTripViewController: UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "InventoryHeader") as? InventoryHeaderView else {
            return nil
        }
        headerView.headerTitle.text = "Equipo"
        return headerView

    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return equips.count

    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: InventoryViewCell.identifier) as? InventoryViewCell else {
            return UITableViewCell()
        }

        cell.setupCell(equips[indexPath.row])

        return cell
    }


}
