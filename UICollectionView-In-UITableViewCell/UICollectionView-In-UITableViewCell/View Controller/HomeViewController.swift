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
    lazy var shopData: ShopData? = {
        guard let jsonData = JSONLoaderImpl.jsonData(from: "rest01") else { return nil }
        return try? ShopData(data: jsonData)
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.configureTableView()
    }
}
extension HomeViewController {
    /// initial set up for table view
    func configureTableView() {
        self.register(cell: AreaTableViewCell.self, to: self.tableView)
        self.tableView.dataSource = self
        self.tableView.delegate = self
    }
}
extension HomeViewController: UITableViewCellRegisterable { }

extension HomeViewController: UITableViewDataSource {
    func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int) -> Int {
        return self.shopData?.numOfArea ?? 1
    }
    func tableView(
        _ tableView: UITableView,
        willDisplay cell: UITableViewCell,
        forRowAt indexPath: IndexPath) {
        guard let cell = cell as? AreaTableViewCell else { return }
        cell.setCollectionViewDelegate(delegate: self)
        cell.setCollectionViewDataSource(dataSourceDelegate: self, forRow: indexPath.row)
    }
    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView
            .dequeueReusableCell(
                withIdentifier: "AreaTableViewCell",
                for: indexPath) as! AreaTableViewCell
        return cell
    }
}
extension HomeViewController: UITableViewDelegate { }

extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int) -> Int {
        let tag = collectionView.tag
        return self.shopData?[tag].shops.count ?? 0
    }
    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView
            .dequeueReusableCell(
                withReuseIdentifier: Name(of: ShopCell.self),
                for: indexPath) as! ShopCell
        
        let tag = collectionView.tag
        if let shop = self.shopData?[tag].shops[indexPath.item] {
            cell.set(shop)
        }
        return cell
    }
}
