//
//  UserInfoView.swift
//  CrESITrivia
//
//  Created by Agustin Palmeira on 01/03/2019.
//  Copyright © 2019 Josmer Delgado. All rights reserved.
//

import Foundation
import UIKit

protocol UserInfoViewDelegate: class {
	func logout()
	func openLibrary()
}

class UserInfoView: UIView {

	//MARK: - Variables

	weak var delegate: UserInfoViewDelegate?
	//private var userInfo: UserInfo!

	private let usernameLabel: UILabel = {
		let label = UILabel()
		label.font = UIFont.boldSystemFont(ofSize: 26)
		label.textColor = .white

		return label
	}()

	private let correctAnswersLabel: UILabel = {
		let label = UILabel()
		label.font = UIFont.boldSystemFont(ofSize: 20)
		label.textColor =  UIColor.black
		label.textAlignment = .left

		return label
	}()

	private let lifesLabel: UILabel = {
		let label = UILabel()
		label.font = UIFont.boldSystemFont(ofSize: 20)
		label.textColor = UIColor.black
		label.textAlignment = .left

		return label
	}()

	private let pointsLabel: UILabel = {
		let label = UILabel()
		label.font = UIFont.boldSystemFont(ofSize: 20)
		label.textColor = UIColor.black
		label.textAlignment = .left

		return label
	}()

	private let imageView: UIImageView = {
		let imageView = UIImageView(image: #imageLiteral(resourceName: "userPlaceholder"))
		imageView.contentMode = .scaleAspectFill

		return imageView
	}()

	//MARK: - Initialization

	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}

	// swiftlint:disable force_cast
	init() {
		super.init(frame: .zero)
		backgroundColor = .white
		addShadow(location: .bottom)
		addGestureToUserImage()
		setFields()
		setSubViews()
	}
	//swiftlint:enable force_cast

	//MARK: - Subviews configuration

	private func setFields() {
		imageView.image = #imageLiteral(resourceName: "userPlaceholder")//userInfo.image
		setTextsToLabels()
	}

	private func addGestureToUserImage() {
		let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
		imageView.isUserInteractionEnabled = true
		imageView.addGestureRecognizer(tapGestureRecognizer)
	}

	private func setTextsToLabels() {
		usernameLabel.text = "Romualdo"
	}

	private func setSubViews() {
		let userInfoHeaderView = UserInfoHeaderView()
		addSubview(userInfoHeaderView)
		NSLayoutConstraint.useAndActivateConstraints(constraints: [
			userInfoHeaderView.topAnchor.constraint(equalTo: topAnchor),
			userInfoHeaderView.leadingAnchor.constraint(equalTo: leadingAnchor),
			userInfoHeaderView.trailingAnchor.constraint(equalTo: trailingAnchor),
			userInfoHeaderView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height * 0.25)
		])

		addSubview(imageView)
		NSLayoutConstraint.useAndActivateConstraints(constraints: [
			imageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 50),
			imageView.heightAnchor.constraint(equalTo: widthAnchor, multiplier: 0.3),
			imageView.widthAnchor.constraint(equalTo: imageView.heightAnchor),
			imageView.bottomAnchor.constraint(equalTo: userInfoHeaderView.bottomAnchor, constant: 40)
		])

		addSubview(usernameLabel)
		NSLayoutConstraint.useAndActivateConstraints(constraints: [
			usernameLabel.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 50),
			usernameLabel.bottomAnchor.constraint(equalTo: userInfoHeaderView.bottomAnchor, constant: -10),
			usernameLabel.trailingAnchor.constraint(equalTo: userInfoHeaderView.trailingAnchor, constant: -5)
		])

		let containerView = UIView()
		addSubview(containerView)
		NSLayoutConstraint.useAndActivateConstraints(constraints: [
			containerView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
			containerView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
			containerView.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 50),
			containerView.bottomAnchor.constraint(equalTo: bottomAnchor)
		])

		//Lifes

		let nameLabel = createTitleLabel(text: "Romualdo Burifandela")
		containerView.addSubview(nameLabel)
		NSLayoutConstraint.useAndActivateConstraints(constraints: [
			nameLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
			nameLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
			nameLabel.topAnchor.constraint(equalTo: containerView.topAnchor)
		])

		let emailLabel = createTitleLabel(text: "romuburi@gmail.com")
		emailLabel.textColor = .blue
		containerView.addSubview(emailLabel)
		NSLayoutConstraint.useAndActivateConstraints(constraints: [
			emailLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
			emailLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
			emailLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 20)
		])

		let logoutButton = UIButton.attributedButton()
		addSubview(logoutButton)
		logoutButton.setTitle("Logout", for: .normal)
		logoutButton.addTarget(self, action: #selector(logout), for: .touchUpInside)
		NSLayoutConstraint.useAndActivateConstraints(constraints: [
			logoutButton.centerXAnchor.constraint(equalTo: centerXAnchor),
			logoutButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -30)
		])

		logoutButton.isHidden = true
	}

	private func createTitleLabel(text: String) -> UILabel {
		let label = UILabel()
		label.font = UIFont.boldSystemFont(ofSize: 20)
		label.text = text
		label.textColor = UIColor.black
		label.textAlignment = .center

		return label
	}

	private func createLineView() -> UIView {
		let lineView = UIView()
		lineView.backgroundColor = .lightGray
		lineView.widthAnchor.constraint(equalToConstant: 1).isActive = true

		return lineView
	}

	//MARK: - User image
	func setUserImage(image: UIImage) {
		imageView.image = image
		configureImage()
	}

	func configureImage() {
		imageView.layer.cornerRadius = imageView.frame.height / 2
		imageView.layer.masksToBounds = true
	}

	//MARK: - Actions.

	@objc
	private func logout() {
		print("Logout.")
		self.delegate!.logout()
	}

	@objc
	private func imageTapped(tapGestureRecognizer: UITapGestureRecognizer) {
		delegate?.openLibrary()
	}
}
