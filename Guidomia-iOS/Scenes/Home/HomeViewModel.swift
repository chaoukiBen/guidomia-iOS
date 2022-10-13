//
//  HomeViewModel.swift
//  Guidomia-iOS
//
//  Created by chaouki bencherif on 13/10/2022.
//

import Foundation

class HomeViewModel {

    func fetchLocalCars() -> [Car]? {
       return NetworkService.loadJson(filename: "car_list")
    }
}
