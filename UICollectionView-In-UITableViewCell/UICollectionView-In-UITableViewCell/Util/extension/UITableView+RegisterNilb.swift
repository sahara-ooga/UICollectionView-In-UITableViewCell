//
//  UITableView+RegisterNilb.swift
//  UICollectionView-In-UITableViewCell
//
//  Created by ogasawara_dev on 2018/11/18.
//  Copyright © 2018 ogasawara_dev. All rights reserved.
//

import UIKit

extension UITableView {
    func register(nibName: String, cellReuseIdentifier: String) {
        let nib = UINib(nibName: nibName, bundle: nil)
        self.register(
            nib, forCellReuseIdentifier: cellReuseIdentifier
        )
    }
}
