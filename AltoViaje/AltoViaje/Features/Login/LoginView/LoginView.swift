//
//  LoginView.swift
//  AltoViaje
//
//  Created by Agustin Palmeira on 03/07/2019.
//  Copyright © 2019 AltoViaje. All rights reserved.
//

import MaterialComponents.MaterialTextFields
import Foundation
import UIKit

//MARK: - Protocols

protocol LoginViewDelegate: class {
	func login()
	func forgotPassword()
	func createAccount()
}

class LoginView: BaseFillFieldsView {

	//MARK: - Variables

	private var logoImageViewHeightConstraint: NSLayoutConstraint!
	private var logoImageViewHeight = UIScreen.main.bounds.size.width * 0.5
	var usernameTextFieldControllerFloating : MDCTextInputControllerUnderline!
	var passwordTextFieldControllerFloating : MDCTextInputControllerUnderline!
	weak var delegate : LoginViewDelegate!

	let usernameTextFieldFloating: MDCTextField = {
		let textField = MDCTextField()
		textField.placeholder = "Usuario"

		return textField
	}()

	let passwordTextFieldFloating: MDCTextField = {
		let textField = MDCTextField()
		textField.placeholder = "Password"
		textField.isSecureTextEntry = true

		return textField
	}()

	//MARK: - Initializers

	override init() {
		super.init()
		setFloatingTextFieldsControllers()
		setSubViews()

		self.backgroundColor = .white
	}

	//MARK: - Configure views

	private func setFloatingTextFieldsControllers() {
		usernameTextFieldControllerFloating = MDCTextInputControllerUnderline(textInput: usernameTextFieldFloating)
		usernameTextFieldControllerFloating.expandsOnOverflow = false
		passwordTextFieldControllerFloating = MDCTextInputControllerUnderline(textInput: passwordTextFieldFloating)
		passwordTextFieldControllerFloating.expandsOnOverflow = false
	}

	private func setSubViews() {
		usernameTextFieldFloating.delegate = self
		passwordTextFieldFloating.delegate = self

		let forgotPasswordButton = UIButton()
		addSubview(forgotPasswordButton)
		forgotPasswordButton.setTitle("Forgot password", for: .normal)
		forgotPasswordButton.setTitleColor(UIColor.black, for: .normal)
		forgotPasswordButton.titleLabel?.font = UIFont.systemFont(ofSize: 14)
		forgotPasswordButton.addTarget(self, action: #selector(forgotPasswordButtonAction), for: .touchUpInside)
		NSLayoutConstraint.useAndActivateConstraints(constraints: [
			forgotPasswordButton.centerXAnchor.constraint(equalTo: centerXAnchor),
			forgotPasswordButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -30)
			])

		//TODO: The forgot password functionallity is not available until backend is developed.
		forgotPasswordButton.isHidden = true

		let createAccountButton = UIButton.attributedButton()
		createAccountButton.isHidden = true
		addSubview(createAccountButton)
		createAccountButton.setTitle("Crear cuenta", for: .normal)
		createAccountButton.addTarget(self, action: #selector(createAccountButtonAction), for: .touchUpInside)
		NSLayoutConstraint.useAndActivateConstraints(constraints: [
			createAccountButton.centerXAnchor.constraint(equalTo: centerXAnchor),
			createAccountButton.bottomAnchor.constraint(equalTo: forgotPasswordButton.topAnchor, constant: -15)
			])

		createAccountButton.setAttributes(normalBorderColor: UIColor(red: 110/255, green: 218/255, blue: 193/255, alpha: 1),
										  normalBackgroundColor: UIColor.white,
										  normalTitleColor: UIColor(red: 110/255, green: 218/255, blue: 193/255, alpha: 1),
										  highlightedBackgroundColor: UIColor.white,
										  highlightedTitleColor: UIColor(red: 44/255, green: 189/255, blue: 155/255, alpha: 1))

		let loginButton = UIButton.attributedButton()
		addSubview(loginButton)
		loginButton.setTitle("Login", for: .normal)
		loginButton.addTarget(self, action: #selector(loginButtonAction), for: .touchUpInside)

//		NSLayoutConstraint.useAndActivateConstraints(constraints: [
//			loginButton.centerXAnchor.constraint(equalTo: centerXAnchor),
//			loginButton.bottomAnchor.constraint(equalTo: createAccountButton.topAnchor, constant: -15)
//			])

		NSLayoutConstraint.useAndActivateConstraints(constraints: [
			loginButton.centerXAnchor.constraint(equalTo: centerXAnchor),
			loginButton.bottomAnchor.constraint(equalTo: forgotPasswordButton.topAnchor, constant: -15)
		])

		let logoImageView = UIImageView(image: #imageLiteral(resourceName: "Splash"))
		logoImageView.contentMode = .scaleAspectFit
		addSubview(logoImageView)
		NSLayoutConstraint.useAndActivateConstraints(constraints: [
			logoImageView.topAnchor.constraint(equalTo: topAnchor, constant: 30),
			logoImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
			logoImageView.widthAnchor.constraint(equalToConstant: logoImageViewHeight)
			])

		logoImageViewHeightConstraint = logoImageView.heightAnchor.constraint(equalToConstant: logoImageViewHeight)
		logoImageViewHeightConstraint.isActive = true

		addSubview(usernameTextFieldFloating)
		NSLayoutConstraint.useAndActivateConstraints(constraints: [
			usernameTextFieldFloating.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 30),
			usernameTextFieldFloating.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
			usernameTextFieldFloating.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30)
			])

		addSubview(passwordTextFieldFloating)
		NSLayoutConstraint.useAndActivateConstraints(constraints: [
			passwordTextFieldFloating.topAnchor.constraint(equalTo: usernameTextFieldFloating.bottomAnchor),
			passwordTextFieldFloating.leadingAnchor.constraint(equalTo: usernameTextFieldFloating.leadingAnchor),
			passwordTextFieldFloating.trailingAnchor.constraint(equalTo: usernameTextFieldFloating.trailingAnchor),
			])
	}

	//MARK: - Show image logo
	func hideLogo(hide: Bool) {
		if hide {
			logoImageViewHeightConstraint.constant = 0
		} else {
			logoImageViewHeightConstraint.constant = logoImageViewHeight
		}
	}

	//MARK: - Actions.

	@objc
	private func loginButtonAction() {
		delegate.login()
	}

	@objc
	private func forgotPasswordButtonAction() {
		delegate.forgotPassword()
	}

	@objc
	private func createAccountButtonAction() {
		delegate.createAccount()
	}
}
