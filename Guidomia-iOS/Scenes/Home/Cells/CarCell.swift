//
//  CarCell.swift
//  Guidomia-iOS
//
//  Created by chaouki bencherif on 13/10/2022.
//

import UIKit

class CarCell: UITableViewCell {

    // MARK: - Constants

    static let identifier = "CarCell"

    // MARK: Properties

    var item: CarViewModelItem?
}

class CarViewModelItem: HomeViewModelItem {

    var type: HomeViewModelItemType {
        return .car
    }
}
