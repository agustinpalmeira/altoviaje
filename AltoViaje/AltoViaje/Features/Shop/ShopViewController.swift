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


    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        itemsTable.register(UINib.init(nibName: "BuyedInventoryViewCell", bundle: nil), forCellReuseIdentifier: BuyedInventoryViewCell.identifier)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        itemsTable.reloadData()
    }

    @IBAction func goToShop(_ sender: Any) {
        let cartVC = InventoryWithoutTripViewController(nibName: "InventoryWithoutTripViewController", bundle: nil)
        
        navigationController?.pushViewController(cartVC, animated: true)
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
