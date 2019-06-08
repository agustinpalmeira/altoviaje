//
//  MyTripsView.swift
//  AltoViaje
//
//  Created by Agustin Palmeira on 06/06/2019.
//  Copyright © 2019 AltoViaje. All rights reserved.
//

import Foundation
import UIKit

protocol MyTripsViewDelegate: class {
	func createNewTrip()
}

class MyTripsView: UIView {

	//MARK: - Variables
	@IBOutlet var myTripContainerView: UIView!
	@IBOutlet weak var tableView: UITableView!

	weak var delegate: MyTripsViewDelegate?

	//MARK: - Initialization
	override init(frame: CGRect) {
		super.init(frame: frame)
		commonInit()
	}

	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
		commonInit()
	}

	private func commonInit() {
		let nib = UINib(nibName: "MyTripsView", bundle: nil)
		nib.instantiate(withOwner: self, options: nil)
		addSubview(myTripContainerView)
		myTripContainerView.frame = self.bounds
		myTripContainerView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
		tableView.register(UINib.init(nibName: "MyTripsCell", bundle: nil), forCellReuseIdentifier: MyTripsCell.cellIdentifier)
	}

	//MARK: - Actions
	@IBAction func newTripButtonAction(_ sender: Any) {
		delegate?.createNewTrip()
	}

	//MARK: - Table View methods
	func setTableDataSource(_ dataSource: UITableViewDataSource) {
		tableView.dataSource = dataSource
	}

	func setTableViewDelegate(_ delegate: UITableViewDelegate) {
		tableView.delegate = delegate
	}
}
