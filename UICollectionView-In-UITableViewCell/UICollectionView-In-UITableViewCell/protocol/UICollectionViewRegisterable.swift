//
//  UICollectionViewRegisterable.swift
//  UICollectionView-In-UITableViewCell
//
//  Created by ogasawara_dev on 2018/11/18.
//  Copyright © 2018 ogasawara_dev. All rights reserved.
//

import UIKit

protocol UICollectionViewRegisterable { }
extension UICollectionViewRegisterable {
    
    /// register cell to collection view
    ///
    /// - Parameters:
    ///   - cell: registeree UICollectionViewCell. xib file using same name.
    ///   - collectionView: registers UICollectionViewCell
    func register<T: UICollectionViewCell, U: UICollectionView>
        (cell: T.Type, to collectionView: U) {
        let identifier = Name(of: cell)
        collectionView
            .register(
                nibName: identifier,
                cellReuseIdentifier: identifier
        )
    }
}
