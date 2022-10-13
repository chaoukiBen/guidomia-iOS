//
//  Car.swift
//  Guidomia-iOS
//
//  Created by chaouki bencherif on 13/10/2022.
//

import Foundation

struct Car: Decodable {
    let consList: [String]
    let customerPrice: Float
    let make: String
    let marketPrice: Float
    let model: String
    let prosList: [String]
    let rating: Int
}
