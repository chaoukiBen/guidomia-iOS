//
//  HeaderCell.swift
//  Guidomia-iOS
//
//  Created by chaouki bencherif on 13/10/2022.
//

import UIKit

class HeaderCell: UITableViewCell {

    // MARK: - Constants

    static let identifier = "HeaderCell"

    // MARK: Properties

    var item: HeaderViewModelItem?
}

class HeaderViewModelItem: HomeViewModelItem {

    var type: HomeViewModelItemType {
        return .header
    }
}
