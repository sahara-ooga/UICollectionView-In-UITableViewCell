//
//  JSONLoadTests.swift
//  UICollectionView-In-UITableViewCellTests
//
//  Created by ogasawara_dev on 2018/11/18.
//  Copyright © 2018 ogasawara_dev. All rights reserved.
//

import XCTest
@testable import UICollectionView_In_UITableViewCell

class JSONLoadTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testLoadAndDecode() throws {
        let jsonData = JSONLoaderImpl.jsonData(from: "rest01")
        let aaa = try ShopData(data: jsonData!)
        print(aaa)
    }

}
