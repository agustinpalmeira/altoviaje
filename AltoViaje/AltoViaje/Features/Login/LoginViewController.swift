//
//  LoginViewController.swift
//  AltoViaje
//
//  Created by Agustin Palmeira on 02/07/2019.
//  Copyright © 2019 AltoViaje. All rights reserved.
//

import MaterialComponents.MaterialTextFields
import Foundation
import UIKit

class LoginViewController: UIViewController {

	//MARK: - Variables

	let loginView: LoginView = {
		let view = LoginView()

		return view
	}()

	//MARK: - View life cycle

	override func viewDidLoad() {
		super.viewDidLoad()
		view.backgroundColor = .white
		navigationItem.title = ""
		NotificationCenter.default.addObserver(self,
											   selector: #selector(keyboardWillShow),
											   name: UIResponder.keyboardWillShowNotification, object: nil)
		NotificationCenter.default.addObserver(self,
											   selector: #selector(keyboardWillHide),
											   name: UIResponder.keyboardWillHideNotification, object: nil)
		setSubViews()
	}

	//MARK: - Subviews configuration

	private func setSubViews() {
		loginView.delegate = self
		view.addSubview(loginView)
		NSLayoutConstraint.useAndActivateConstraints(constraints: [
			loginView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
			loginView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
			loginView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
			loginView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
			])
	}

	//MARK: - Login

	private func loginUser() {
		//let loginManager = UserLoginManager.instance
		let username = loginView.usernameTextFieldFloating.text!
		let password = loginView.passwordTextFieldFloating.text!
		let (areFieldsValid, errorMessages) = validateFields(username: username,
															 password: password)
		if hasEmptyFields(username: username, password: password) {
			showAlert(text: "No pueden haber campos vacios.")
		}
		if areFieldsValid {
			//TODO: Go to the view controller
		} else {
			if let errorMessage = errorMessages.first {
				showAlert(text: errorMessage)
			}
		}
	}

	private func validateFields(username: String, password: String) -> (Bool, [String]) {
		var areValid = true
		var errorMessagesArray = [String]()

		if username != "Romualdo" || password != "elcapitan" {
				areValid = false
				errorMessagesArray.append("Credenciales invalidas.")
				loginView.usernameTextFieldControllerFloating.setErrorText("Credenciales invalidas.",
																		   errorAccessibilityValue: "Credenciales invalidas.")
			} else {
				loginView.usernameTextFieldControllerFloating.setErrorText(nil,
																		   errorAccessibilityValue: nil)
			}
		return (areValid, errorMessagesArray)
	}

	private func hasEmptyFields(username: String, password: String) -> Bool {
		var hasEmpty = false
		if username.isEmpty || password.isEmpty {
			hasEmpty = true
			if username.isEmpty {
				loginView.usernameTextFieldControllerFloating.setErrorText("Usuario vacio.",
																		   errorAccessibilityValue: "Usuario vacio.")
			}
			if password.isEmpty {
				loginView.passwordTextFieldControllerFloating.setErrorText("Password vacio.",
																		   errorAccessibilityValue: "Password vacio.")
			}
		}

		return hasEmpty
	}
}
//MARK: - Extensions

extension LoginViewController: LoginViewDelegate {
	func login() {
		loginUser()
	}

	func forgotPassword() {
		//TODO: The forgot password functionallity is not available until backend is developed.
	}

	func createAccount() {
//		let controller = CreateAccountViewController()
//		navigationController?.pushViewController(controller, animated: true)
	}
}

extension LoginViewController: KeyboardProtocol {
	@objc
	func keyboardWillShow(notification: NSNotification) {
		loginView.hideLogo(hide: true)
		UIView.animate(withDuration: 0.5) {
			self.view.layoutIfNeeded()
		}
	}

	@objc
	func keyboardWillHide(notification: NSNotification) {
		loginView.hideLogo(hide: false)
		UIView.animate(withDuration: 0.5) {
			self.view.layoutIfNeeded()
		}
	}
}
