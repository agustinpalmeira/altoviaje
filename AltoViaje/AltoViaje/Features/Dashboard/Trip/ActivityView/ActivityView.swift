//
//  ActivityView.swift
//  AltoViaje
//
//  Created by Nicolas Alvarez on 6/10/19.
//  Copyright © 2019 AltoViaje. All rights reserved.
//

import UIKit

protocol ActivityViewDelegate {
    func selectActivity(activity: ActivityType, active: Bool)
}

class ActivityView: UIView {
    @IBOutlet weak var activated: UISwitch!



    @IBOutlet weak var name: UILabel!
    var viewDelegate: ActivityViewDelegate?
    var activity: ActivityType!

    func setupView(_ activity: ActivityType, active: Bool = false) {
        self.activity = activity
        activated.isOn = active
        name.text = activity.name
    }

    @IBAction func switchMoved(_ sender: Any) {
        viewDelegate?.selectActivity(activity: activity, active: activated.isOn)
    }
}
