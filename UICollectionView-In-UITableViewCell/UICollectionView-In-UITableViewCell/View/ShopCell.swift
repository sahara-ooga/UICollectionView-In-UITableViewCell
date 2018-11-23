//
//  ShopCell.swift
//  UICollectionView-In-UITableViewCell
//
//  Created by ogasawara_dev on 2018/11/17.
//  Copyright © 2018 ogasawara_dev. All rights reserved.
//

import UIKit

class ShopCell: UICollectionViewCell {
    // MARK: property
    @IBOutlet weak var shopImage: UIImageView!
    @IBOutlet weak var shopLabel: UILabel!
    
    // MARK: Life Cycle
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
}
extension ShopCell: ConfigurableCell {
    func configure(data: Shop) {
        let shop = data
        self.shopLabel.text = shop.name
        guard let shopImageUrl = URL(string: shop.shopImageURL),
            let data = try? Data(contentsOf: shopImageUrl)
            else { return }
        let shopImage = UIImage(data: data)
        self.shopImage.image = shopImage
    }
}
