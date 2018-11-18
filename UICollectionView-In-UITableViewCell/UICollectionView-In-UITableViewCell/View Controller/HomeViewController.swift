//
//  HomeViewController.swift
//  UICollectionView-In-UITableViewCell
//
//  Created by ogasawara_dev on 2018/11/17.
//  Copyright © 2018 ogasawara_dev. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var tableViewDataSource: UITableViewDataSource!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.configureTableView()
    }


}
extension HomeViewController {
    /// initial set up for table view
    func configureTableView() {
        self.register(cell: AreaTableViewCell.self, to: self.tableView)
        self.tableView.dataSource = self.tableViewDataSource
        self.tableView.delegate = self
    }
}
extension HomeViewController: UITableViewCellRegisterable { }

extension HomeViewController: UITableViewDelegate { }
