//
//  PaymentViewController.swift
//  AltoViaje
//
//  Created by Nicolas Alvarez on 6/13/19.
//  Copyright © 2019 AltoViaje. All rights reserved.
//

import UIKit

class PaymentViewController: UIViewController {
    var toPay: Int = 0
    @IBOutlet weak var cvvTextField: UITextField!
    @IBOutlet weak var totalToPayLabel: UILabel!
    @IBOutlet weak var payButton: UIButton!

    @IBOutlet weak var cardView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Forma de Pago"
        cvvTextField.delegate = self
        totalToPayLabel.text = "$\(toPay)"
        payButton.layer.borderColor = UIColor.black.cgColor
        payButton.layer.borderWidth = 1
        payButton.layer.cornerRadius = 5

        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(hideKeyboard)))
    }


    @objc func hideKeyboard(){
        self.view.endEditing(true)
    }

    @IBAction func payAction(_ sender: Any) {
        NotificationCenter.default.post(name: AltoViajeNotification.newTripBoocked.name, object: nil)
        navigationController?.popToRootViewController(animated: true)
    }

}

extension PaymentViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if string == "" {
            return true
        }
        return textField.text!.count < 3
    }
}
