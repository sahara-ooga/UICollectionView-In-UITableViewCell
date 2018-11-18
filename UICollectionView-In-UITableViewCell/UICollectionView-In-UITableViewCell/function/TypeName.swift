//
//  TypeName.swift
//  UICollectionView-In-UITableViewCell
//
//  Created by ogasawara_dev on 2018/11/17.
//  Copyright © 2018 ogasawara_dev. All rights reserved.
//
//: https://ez-net.jp/article/40/LspZyDVH/Q4bXi1rgZJmR/

/// return type name of Type Object
///
/// let ty = SomeStruct.self
/// Name(of: ty) //"SomeStruct"
///
/// - Parameter type: describe Type
/// - Returns: String of Type name
func Name(of type: Any.Type) -> String {
    return String(describing: type)
}

/// return type name of Some Instance
///
/// TypeName(of: SomeStruct()) // "SomeStruct"
///
/// - Parameter instance: some instance
/// - Returns: Type name of some instance
func TypeName<T>(of instance: T) -> String {
    return Name(of: type(of: instance))
}
