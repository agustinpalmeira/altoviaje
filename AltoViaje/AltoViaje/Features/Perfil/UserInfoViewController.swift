//
//  UserInfoViewController.swift
//  CrESITrivia
//
//  Created by Agustin Palmeira on 01/03/2019.
//  Copyright © 2019 Josmer Delgado. All rights reserved.
//

import Foundation
import UIKit

protocol UserInfoViewControllerDelegate: class {
	func clearUsernameAndPassword()
}

class UserInfoViewController: UIViewController, UINavigationControllerDelegate {

	//MARK: - Variables

	weak var delegate: UserInfoViewControllerDelegate?
	var user = NSDictionary()
	var userInfoView: UserInfoView!

	//MARK: - Initialization

//	init() {
//		super.init(nibName: nil, bundle: nil)
//		//self.user = user
//	}

	//MARK: - View life cycle
	
	override func viewDidLoad() {
		super.viewDidLoad()

		setSubViews()
	}

	override func viewWillLayoutSubviews() {
		userInfoView.configureImage()
	}

	//MARK: - Subviews configuration

	fileprivate func setSubViews() {
//		let imageData = user.object(forKey: UserLogin.image)
		//let image = UIImage(data: imageData as! Data)

//		let image = #imageLiteral(resourceName: "hostel1")

//		let userInfo = UserInfo(username: (user.object(forKey: UserLogin.username) as! String),
//								correctAnswers: (user.object(forKey: UserLogin.correctAnswers) as! String),
//								incorrectAnswers: (user.object(forKey: UserLogin.incorrectAnswers) as! String),
//								lifes: (user.object(forKey: UserLogin.lifes) as! String),
//								points: (user.object(forKey: UserLogin.points) as! String),
//								image: image!)

		userInfoView = UserInfoView()
		userInfoView.delegate = self
		view.addSubview(userInfoView)
		NSLayoutConstraint.useAndActivateConstraints(constraints: [
			userInfoView.topAnchor.constraint(equalTo: view.topAnchor),
			userInfoView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
			userInfoView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
			userInfoView.bottomAnchor.constraint(equalTo: view.bottomAnchor)])
	}

	//MARK: - Actions

	@objc
	func close() {
		//navigationController?.popToRootViewController(animated: true)
	}
}

//MARK: - Extensions

extension UserInfoViewController: UserInfoViewDelegate {
	func logout() {
		//UserLoginManager.instance.logout()
		//self.delegate?.clearUsernameAndPassword()
		//navigationController?.popToRootViewController(animated: true)
	}

	func openLibrary() {
		let picker = UIImagePickerController()
		picker.allowsEditing = false
		picker.delegate = self
		picker.sourceType = .photoLibrary
		present(picker, animated: true)
	}
}

extension UserInfoViewController: UIImagePickerControllerDelegate {
	@objc
	func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
		dismiss(animated: true, completion: nil)
	}

	@objc
	func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
		if let pickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
			userInfoView.setUserImage(image: pickedImage)
			//UserLoginManager.instance.updateUserImage(image: pickedImage)
		}

		dismiss(animated: true)
	}
}


