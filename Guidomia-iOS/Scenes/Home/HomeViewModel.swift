//
//  HomeViewModel.swift
//  Guidomia-iOS
//
//  Created by chaouki bencherif on 13/10/2022.
//

import Foundation

class HomeViewModel {

    // MARK: - Properties

    var items = [HomeViewModelItem]()
    var cars: [Car]?

    // MARK: Init

    init() {
        items = [HomeViewModelItem]()

        // Load header
        let headerItem = HeaderViewModelItem()
        items.append(headerItem)

        // Load filter
        let filterItem = FilterViewModelItem()
        items.append(filterItem)

        // Load cars
        fetchLocalCars() { result in
            if result {
                self.cars?.forEach({ car in
                    let carItem = CarViewModelItem(car: car)
                    self.items.append(carItem)
                })
            }
        }
    }

    // MARK: - Fetch data

    func fetchLocalCars(completion: @escaping (Bool) -> Void ) {
        cars = []
        if let _cars = NetworkService.loadJson(filename: "car_list"), _cars.count > 0 {
            cars = _cars
            completion(true)
        }
        completion(false)
    }
}

protocol HomeViewModelItem {
    var type: HomeViewModelItemType { get }
}

enum HomeViewModelItemType {
    case header
    case filter
    case car
}
