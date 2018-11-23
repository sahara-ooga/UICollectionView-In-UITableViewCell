//
//  Constants.swift
//  UICollectionView-In-UITableViewCell
//
//  Created by ogasawara_dev on 2018/11/24.
//  Copyright © 2018 ogasawara_dev. All rights reserved.
//
import UIKit

enum Constants {
    enum AreaTableViewCell {
        static let height: CGFloat = 250
        static let labelHeight = height - collectionViewHeight
        static let collectionViewHeight: CGFloat = 230
    }
    enum ShopCell {
        static let height: CGFloat = AreaTableViewCell.collectionViewHeight
        static let width: CGFloat = 100
    }
}
