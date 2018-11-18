//
//  JSONLoader.swift
//  UICollectionView-In-UITableViewCell
//
//  Created by ogasawara_dev on 2018/11/18.
//  Copyright © 2018 ogasawara_dev. All rights reserved.
//

import Foundation

protocol JSONLoader { }
extension JSONLoader {
    static func jsonData(from filename: String) -> Data? {
        let jsonPath = Bundle.main.path(forResource: filename, ofType: "json")
        return try? Data(contentsOf: URL(fileURLWithPath: jsonPath!))
    }
    static func jsonFromFile(_ filename: String) -> [String: AnyObject] {
        let jsonData = Self.jsonData(from: filename)
        return try! JSONSerialization.jsonObject(with: jsonData!, options: []) as! [String: AnyObject]
    }
    static func jsonArrayFromFile(_ filename: String) -> [[String: AnyObject]] {
        let jsonData = Self.jsonData(from: filename)
        return try! JSONSerialization.jsonObject(with: jsonData!, options: []) as! [[String: AnyObject]]
    }
    static func decode<T: Decodable>(_ filename: String) throws -> T {
        let jsonData = Self.jsonData(from: filename)
        let jsonDecoder = JSONDecoder()
        return try jsonDecoder.decode(T.self, from: jsonData!)
    }
}
struct JSONLoaderImpl: JSONLoader { }
