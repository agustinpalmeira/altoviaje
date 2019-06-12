//
//  ActivityView.swift
//  AltoViaje
//
//  Created by Nicolas Alvarez on 6/10/19.
//  Copyright © 2019 AltoViaje. All rights reserved.
//

import UIKit

protocol ActivityViewDelegate {
    func selectActivity(activity: Activity)
}

class ActivityView: UIView {
    @IBOutlet weak var activated: UISwitch!



    @IBOutlet weak var name: UILabel!
    var viewDelegate: ActivityViewDelegate?
    var activity: Activity!

    func setupView(_ activity: Activity) {
        self.activity = activity
        activated.isOn = activity.active
        name.text = activity.name
    }

    @IBAction func switchMoved(_ sender: Any) {
        activity.active = activated.isOn
        viewDelegate?.selectActivity(activity: activity)
    }
}
