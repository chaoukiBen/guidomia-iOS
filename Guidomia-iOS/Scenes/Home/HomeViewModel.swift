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
    var selectedMakeFilter = "Any Make"
    var selectedModelFilter = "Any Model"
    var filterType: HomeFilterType = .make

    // MARK: Init

    func refreshViewModel() {
        items = [HomeViewModelItem]()

        // Load header
        let headerItem = HeaderViewModelItem()
        items.append(headerItem)

        // Load filter
        let filterItem = FilterViewModelItem(makeFilter: selectedMakeFilter, modelFilter: selectedModelFilter)
        items.append(filterItem)

        // Load cars
        fetchLocalCars() { result in
            if result {
                self.cars?.forEach({ car in
                    let carItem = CarViewModelItem(car: car)

                    if self.selectedMakeFilter == "Any Make" && self.selectedModelFilter == "Any Model" {
                        self.items.append(carItem)
                    } else if self.selectedMakeFilter != "Any Make" && self.selectedModelFilter != "Any Model" {
                        if car.make == self.selectedMakeFilter && car.model == self.selectedModelFilter {
                            self.items.append(carItem)
                        }
                    } else if self.selectedMakeFilter != "Any Make" {
                        if car.make == self.selectedMakeFilter {
                            self.items.append(carItem)
                        }
                    } else if self.selectedModelFilter != "Any Model" {
                        if car.model == self.selectedModelFilter {
                            self.items.append(carItem)
                        }
                    }
                })
            }
        }
    }

    // MARK: - Fetch data

    private func fetchLocalCars(completion: @escaping (Bool) -> Void ) {
        cars = []
        if let _cars = NetworkService.loadJson(filename: "car_list"), _cars.count > 0 {
            cars = _cars
            completion(true)
        }
        completion(false)
    }

    func getValuesFrom(property: String) -> [String] {
        var makes = [String]()
        self.cars?.forEach({ car in
            makes.append(car[property] as! String)
        })
        return makes
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

enum HomeFilterType {
    case make
    case model
}

