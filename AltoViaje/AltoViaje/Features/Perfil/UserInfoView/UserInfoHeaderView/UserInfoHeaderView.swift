//
//  UserInfoHeaderView.swift
//  CrESITrivia
//
//  Created by Agustin Palmeira on 06/06/2019.
//  Copyright © 2019 Josmer Delgado. All rights reserved.
//

import Foundation
import UIKit

class UserInfoHeaderView: UIView {

	//MARK: - Variables

	//MARK: - Initialization

	init() {
		super.init(frame: .zero)
		setSubViews()
	}

	@available(*, unavailable, message: "init is unavailable, use init(question: String).")
	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}

	//MARK: - Configure subviews

	private func setSubViews() {

		let containerView = UIView()
		addSubview(containerView)
		NSLayoutConstraint.useAndActivateConstraints(constraints: [
			containerView.topAnchor.constraint(equalTo: topAnchor),
			containerView.bottomAnchor.constraint(equalTo: bottomAnchor),
			containerView.leadingAnchor.constraint(equalTo: leadingAnchor),
			containerView.trailingAnchor.constraint(equalTo: trailingAnchor)
		])

		let backgroundView = UIImageView(image: #imageLiteral(resourceName: "backgroundApp"))
		containerView.addSubview(backgroundView)
		NSLayoutConstraint.useAndActivateConstraints(constraints: [
			backgroundView.topAnchor.constraint(equalTo: topAnchor),
			backgroundView.bottomAnchor.constraint(equalTo: bottomAnchor),
			backgroundView.leadingAnchor.constraint(equalTo: leadingAnchor),
			backgroundView.trailingAnchor.constraint(equalTo: trailingAnchor)
		])
	}
}
