//
//  Car.swift
//  Guidomia-iOS
//
//  Created by chaouki bencherif on 13/10/2022.
//

import Foundation

// FYI: this is used to access the property by name in the func "getValuesFrom"
@objcMembers
class Car: NSObject, Decodable {
    let consList: [String]
    let customerPrice: Float
    let make: String
    let marketPrice: Int
    let model: String
    let prosList: [String]
    let rating: Int

    subscript(key: String) -> Any? {
        return self.value(forKey: key)
    }
}
