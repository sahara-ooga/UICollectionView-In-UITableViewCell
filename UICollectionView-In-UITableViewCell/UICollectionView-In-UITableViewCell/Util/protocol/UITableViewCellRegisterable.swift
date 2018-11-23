//
//  UITableViewCellRegisterable.swift
//  UICollectionView-In-UITableViewCell
//
//  Created by ogasawara_dev on 2018/11/18.
//  Copyright © 2018 ogasawara_dev. All rights reserved.
//

import UIKit

protocol UITableViewCellRegisterable { }
extension UITableViewCellRegisterable {
    
    /// register cell to collection view
    ///
    /// - Parameters:
    ///   - cell: registeree UITableViewCell. xib file using same name.
    ///   - tableView: registers UITableViewCell
    func register<T: UITableViewCell, U: UITableView>
        (cell: T.Type, to tableView: U) {
        let identifier = Name(of: cell)
        tableView
            .register(
                nibName: identifier,
                cellReuseIdentifier: identifier
        )
    }
}
