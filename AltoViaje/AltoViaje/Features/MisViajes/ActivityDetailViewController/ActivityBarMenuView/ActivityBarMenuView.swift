//
//  ActivityBarMenuView.swift
//  AltoViaje
//
//  Created by Agustin Palmeira on 27/06/2019.
//  Copyright © 2019 AltoViaje. All rights reserved.
//

import Foundation
import UIKit

class ActivityBarMenuView: UIView {

	//MARK: - Variables

	//MARK: - Initializers

	init() {
		super.init(frame: .zero)
		backgroundColor = .white
		setSubViews()
	}

	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	//MARK: - Configure views
	private func setSubViews() {
		let trashButton = UIButton()
		//trashButton.addTarget(self, action: #selector(didTapCurrentLocationButton), for: .touchUpInside)
		trashButton.translatesAutoresizingMaskIntoConstraints = false
		trashButton.setImage(#imageLiteral(resourceName: "map"), for: .normal)
		addSubview(trashButton)
		trashButton.heightAnchor.constraint(equalToConstant: 20).isActive = true
		trashButton.widthAnchor.constraint(equalTo: trashButton.heightAnchor).isActive = true
		trashButton.leadingAnchor.constraint(equalTo: trailingAnchor, constant: 20).isActive = true
		trashButton.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true

		let mapButton = UIButton()
		//mapButton.addTarget(self, action: #selector(didTapCurrentLocationButton), for: .touchUpInside)
		mapButton.translatesAutoresizingMaskIntoConstraints = false
		mapButton.setImage(#imageLiteral(resourceName: "trash"), for: .normal)
		addSubview(mapButton)
		mapButton.heightAnchor.constraint(equalToConstant: 20).isActive = true
		mapButton.widthAnchor.constraint(equalTo: mapButton.heightAnchor).isActive = true
		mapButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20).isActive = true
		mapButton.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
	}
}
