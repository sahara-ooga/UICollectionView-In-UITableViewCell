//
//  Shop.swift
//  UICollectionView-In-UITableViewCell
//
//  Created by ogasawara_dev on 2018/11/18.
//  Copyright © 2018 ogasawara_dev. All rights reserved.
//

import Foundation
// To parse the JSON, add this file to your project and do:
//
//   let result = try ShopData(json)
//

typealias ShopData = [Shops]

struct Shops: Codable {
    /// area description
    let title: String
    let shops: [Shop]
    
    enum CodingKeys: String, CodingKey {
        case title = "title"
        case shops = "shops"
    }
}

struct Shop: Codable {
    let name: String
    let address: String
    let tel: String
    let budget: String
    let shopImageURL: String
    
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case address = "address"
        case tel = "tel"
        case budget = "budget"
        case shopImageURL = "shop_image1"
    }
}

// MARK: Convenience initializers and mutators

extension Shops {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Shops.self, from: data)
    }
    
    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }
    
    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }
    
    func with(
        title: String? = nil,
        shops: [Shop]? = nil
        ) -> Shops {
        return Shops(
            title: title ?? self.title,
            shops: shops ?? self.shops
        )
    }
    
    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }
    
    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

extension Shop {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Shop.self, from: data)
    }
    
    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }
    
    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }
    
    func with(
        name: String? = nil,
        address: String? = nil,
        tel: String? = nil,
        budget: String? = nil,
        shopImageURL: String? = nil
        ) -> Shop {
        return Shop(
            name: name ?? self.name,
            address: address ?? self.address,
            tel: tel ?? self.tel,
            budget: budget ?? self.budget,
            shopImageURL: shopImageURL ?? self.shopImageURL
        )
    }
    
    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }
    
    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

extension Array where Element == ShopData.Element {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(ShopData.self, from: data)
    }
    
    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }
    
    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }
    
    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }
    
    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

func newJSONDecoder() -> JSONDecoder {
    let decoder = JSONDecoder()
    if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
        decoder.dateDecodingStrategy = .iso8601
    }
    return decoder
}

func newJSONEncoder() -> JSONEncoder {
    let encoder = JSONEncoder()
    if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
        encoder.dateEncodingStrategy = .iso8601
    }
    return encoder
}
extension Array where Element == Shops {
    var numOfArea: Int { return self.count }
}
