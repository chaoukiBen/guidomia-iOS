//
//  FilterCell.swift
//  Guidomia-iOS
//
//  Created by chaouki bencherif on 13/10/2022.
//

import UIKit

class FilterCell: UITableViewCell {

    // MARK: - Constants

    static let identifier = "FilterCell"

    // MARK: Properties

    var item: FilterViewModelItem?
}

class FilterViewModelItem: HomeViewModelItem {

    var type: HomeViewModelItemType {
        return .filter
    }
}
