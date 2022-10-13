//
//  FilterCell.swift
//  Guidomia-iOS
//
//  Created by chaouki bencherif on 13/10/2022.
//

import UIKit

protocol FilterCellProtocol: AnyObject {
    func onSelectMake()
    func onSelectModel()
}

class FilterCell: UITableViewCell {

    // MARK: - Constants

    static let identifier = "FilterCell"

    // MARK: - Outlets

    @IBOutlet weak var makeBtn: UIButton!
    @IBOutlet weak var modelBtn: UIButton!

    // MARK: Properties

    var item: FilterViewModelItem? {
        didSet {
            guard let item = item else {
                return
            }
            makeBtn.setTitle(item.makeFilter, for: .normal)
            modelBtn.setTitle(item.modelFilter, for: .normal)
        }
    }
    weak var delegate: FilterCellProtocol?

    // MARK: - Actions

    @IBAction func onSelectMake(_ sender: UIButton) {
        delegate?.onSelectMake()
    }

    @IBAction func onSelectModel(_ sender: UIButton) {
        delegate?.onSelectModel()
    }
}

class FilterViewModelItem: HomeViewModelItem {

    var type: HomeViewModelItemType {
        return .filter
    }

    // MARK: Properties

    var makeFilter: String
    var modelFilter: String

    // MARK: Initializer

    init(makeFilter: String, modelFilter: String) {
        self.makeFilter = makeFilter
        self.modelFilter = modelFilter
    }
}
