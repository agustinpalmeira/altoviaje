//
//  ShopViewController.swift
//  AltoViaje
//
//  Created by Nicolas Alvarez on 7/3/19.
//  Copyright © 2019 AltoViaje. All rights reserved.
//

import UIKit

class ShopViewController: UIViewController {

    @IBOutlet weak var buyButton: UIButton!
    @IBOutlet weak var itemsTable: UITableView!
    @IBOutlet weak var describedView: UIView!

    @IBOutlet weak var itemsBuyedView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Forma de Pago"

        itemsTable.register(UINib.init(nibName: "BuyedInventoryViewCell", bundle: nil), forCellReuseIdentifier: BuyedInventoryViewCell.identifier)
        NotificationCenter.default.addObserver(self, selector: #selector(newItemsBuyed), name: AltoViajeNotification.itemBuyed.name, object: nil)

        describedView.layer.cornerRadius = 15
        itemsBuyedView.alpha = 0


    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        itemsTable.reloadData()
    }

    @IBAction func goToShop(_ sender: Any) {
        let cartVC = InventoryWithoutTripViewController(nibName: "InventoryWithoutTripViewController", bundle: nil)
        
        navigationController?.pushViewController(cartVC, animated: true)
    }

    @objc
    func newItemsBuyed() {
        UIView.animate(withDuration: 0.5, animations: {  [weak self] in
            self?.itemsBuyedView.alpha = 1
            }, completion: { _ in
                Timer.scheduledTimer(withTimeInterval: 1, repeats: false, block: { [weak self] _ in
                    UIView.animate(withDuration: 0.5, animations: {
                        self?.itemsBuyedView.alpha = 0

                    })
                })
        })
    }
}


extension ShopViewController: UITableViewDelegate {
}

extension ShopViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return User.shared.buyedItems.count

    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        guard let cell = tableView.dequeueReusableCell(withIdentifier: BuyedInventoryViewCell.identifier) as? BuyedInventoryViewCell else {
            return UITableViewCell()
        }

        cell.setupCell(User.shared.buyedItems[indexPath.row])

        return cell
    }


}
