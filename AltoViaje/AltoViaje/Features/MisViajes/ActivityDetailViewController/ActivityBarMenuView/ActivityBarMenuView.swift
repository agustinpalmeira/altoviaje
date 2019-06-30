//
//  ActivityBarMenuView.swift
//  AltoViaje
//
//  Created by Agustin Palmeira on 27/06/2019.
//  Copyright © 2019 AltoViaje. All rights reserved.
//

import Foundation
import UIKit

protocol ActivityBarMenuViewDelegate: class {
	func openMap()
	func deleteActivity()
}

class ActivityBarMenuView: UIView {

	//MARK: - Variables
	weak var delegate: ActivityBarMenuViewDelegate?

	//MARK: - Initializers

	init() {
		super.init(frame: .zero)
		backgroundColor = .clear
		setSubViews()
	}

	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	//MARK: - Configure views
	private func setSubViews() {
		let trashButton = UIButton()
		trashButton.addTarget(self, action: #selector(didTapTrashButton), for: .touchUpInside)
		trashButton.translatesAutoresizingMaskIntoConstraints = false
		trashButton.setImage(#imageLiteral(resourceName: "trash"), for: .normal)
		addSubview(trashButton)
		trashButton.heightAnchor.constraint(equalToConstant: 80).isActive = true
		trashButton.widthAnchor.constraint(equalTo: trashButton.heightAnchor).isActive = true
		trashButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 50).isActive = true
		trashButton.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
		trashButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -10).isActive = true

		let mapButton = UIButton()
		mapButton.addTarget(self, action: #selector(didTapMapButton), for: .touchUpInside)
		mapButton.translatesAutoresizingMaskIntoConstraints = false
		mapButton.setImage(#imageLiteral(resourceName: "map"), for: .normal)
		addSubview(mapButton)
		mapButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
		mapButton.widthAnchor.constraint(equalTo: mapButton.heightAnchor).isActive = true
		mapButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -50).isActive = true
		mapButton.centerYAnchor.constraint(equalTo: trashButton.centerYAnchor).isActive = true
	}

	//MARK: - Actions
	@objc
	func didTapMapButton() {
		self.delegate?.openMap()
	}

	@objc
	func didTapTrashButton() {
		self.delegate?.deleteActivity()
	}
}
