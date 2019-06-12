//
//  MenuView.swift
//  AltoViaje
//
//  Created by Nicolas Alvarez on 6/2/19.
//  Copyright © 2019 AltoViaje. All rights reserved.
//

import UIKit

class MenuView: UIView {

    @IBOutlet var contentView: UIView!
    @IBOutlet weak var menuCollection: UICollectionView!

    override init(frame: CGRect) {
        super.init(frame: frame)
        initView()

    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initView()
    }

    private func initView() {
        let nib = UINib(nibName: "MenuView", bundle: nil)
        nib.instantiate(withOwner: self, options: nil)
        contentView.frame = bounds
        addSubview(contentView)
        menuCollection.register(UINib.init(nibName: MenuCell.itemIdentifier, bundle: nil), forCellWithReuseIdentifier: MenuCell.itemIdentifier)
        
    }
    override func awakeFromNib() {
        super.awakeFromNib()

    }
    
    func setDataSource(_ dataSource: UICollectionViewDataSource) {
        menuCollection.dataSource = dataSource
    }

    func setDelegate(_ delegate: UICollectionViewDelegate) {
        menuCollection.delegate = delegate
    }
}
