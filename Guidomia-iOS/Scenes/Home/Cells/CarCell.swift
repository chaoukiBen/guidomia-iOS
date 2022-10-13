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

    // MARK: - Outlets
    
    @IBOutlet weak var carImage: UIImageView!
    @IBOutlet weak var carName: UILabel!
    @IBOutlet weak var carPrice: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    
    // MARK: Properties

    var item: CarViewModelItem? {
        didSet {
            guard let item = item else {
                return
            }
            carName.text = item.car.make
            carPrice.text = Utilities.priceFormatter(price: item.car.marketPrice)
            carImage.image = UIImage(named: item.car.make)
            ratingLabel.attributedText = Utilities.displayRating(rating: item.car.rating)
        }
    }
}

class CarViewModelItem: HomeViewModelItem {

    var type: HomeViewModelItemType {
        return .car
    }

    // MARK: Properties

    var car: Car

    // MARK: Initializer

    init(car: Car) {
        self.car = car
    }
}
