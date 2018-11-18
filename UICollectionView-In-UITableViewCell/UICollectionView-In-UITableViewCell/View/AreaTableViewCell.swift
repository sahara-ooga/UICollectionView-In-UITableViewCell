//
//  AreaTableViewCell.swift
//  UICollectionView-In-UITableViewCell
//
//  Created by ogasawara_dev on 2018/11/17.
//  Copyright © 2018 ogasawara_dev. All rights reserved.
//

import UIKit

class AreaTableViewCell: UITableViewCell {
    @IBOutlet weak var shopCollectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Initialization code
        self.register(cell: ShopCell.self, to: self.shopCollectionView)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
extension AreaTableViewCell: UICollectionViewRegisterable { }
extension AreaTableViewCell {
    func setCollectionViewDataSource
        <D: UICollectionViewDataSource>
        (dataSourceDelegate: D, forRow row: Int) {
        shopCollectionView.tag = row
        shopCollectionView.dataSource = dataSourceDelegate
        shopCollectionView.reloadData()
    }
    func setCollectionViewDelegate<D: UICollectionViewDelegate>
        (delegate: D) {
        shopCollectionView.delegate = delegate
    }
}
