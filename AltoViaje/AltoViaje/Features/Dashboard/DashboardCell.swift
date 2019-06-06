//
//  DashboardCell.swift
//  AltoViaje
//
//  Created by Nicolas Alvarez on 6/2/19.
//  Copyright © 2019 AltoViaje. All rights reserved.
//

import UIKit

class DashboardCell: UITableViewCell {
    static let cellIdentifier = "DashboardCell"
    @IBOutlet weak var containerView: UIView!
    
    @IBOutlet weak var placeImage: UIImageView!
    @IBOutlet weak var prizeLabel: UILabel!
    @IBOutlet weak var prizeContainer: UIView!
    @IBOutlet weak var placeTitle: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        containerView.layer.borderColor = UIColor.black.cgColor
        containerView.layer.cornerRadius = 10
        containerView.layer.borderWidth = 1

        prizeContainer.layer.cornerRadius = 15

        placeTitle.layer.shadowColor = UIColor.black.cgColor
        placeTitle.layer.shadowRadius = 3.0
        placeTitle.layer.shadowOpacity = 1.0
        placeTitle.layer.shadowOffset = CGSize(width: 4, height: 4)
        placeTitle.layer.masksToBounds = false

    }

    func configCell(_ trip: Trip) {
        placeTitle.text = "Descubrí \(trip.place)"
        placeImage.image = trip.placeholder
        prizeLabel.text = "Paquetes desde $\(trip.estimatedPrize)"
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
