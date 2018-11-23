//
//  ConfigurableCell.swift
//  UICollectionView-In-UITableViewCell
//
//  Created by ogasawara_dev on 2018/11/24.
//  Copyright © 2018 ogasawara_dev. All rights reserved.
//

protocol ConfigurableCell {
    associatedtype DataType
    func configure(data: DataType)
}
