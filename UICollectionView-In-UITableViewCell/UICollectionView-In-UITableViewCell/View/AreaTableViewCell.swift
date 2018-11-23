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
    func setCollectionView
        <D: UICollectionViewDataSource>
        (dataSource: D, forRow row: Int) {
        areaCollectionView.tag = row
        areaCollectionView.dataSource = dataSource
        areaCollectionView.reloadData()
    }
    func setCollectionView<D: UICollectionViewDelegate>
        (delegate: D) {
        areaCollectionView.delegate = delegate
    }
}
extension AreaTableViewCell: ConfigurableCell {
    func configure(data: String?) {
        self.areaNameLabel.text = data
    }
}
