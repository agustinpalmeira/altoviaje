//
//  MainTabViewController.swift
//  AltoViaje
//
//  Created by Nicolas Alvarez on 6/13/19.
//  Copyright © 2019 AltoViaje. All rights reserved.
//

import UIKit

class MainTabViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(newTripBoocked), name: AltoViajeNotification.newTripBoocked.name, object: nil)
    }

    @objc func newTripBoocked() {
        guard let tab = self.tabBar.items?[1] else {
            return
        }
        tab.badgeValue = "!"
    }

}

extension MainTabViewController: UITabBarControllerDelegate {
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        item.badgeValue = nil
    }
}
