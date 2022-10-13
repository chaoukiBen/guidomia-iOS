//
//  HomeViewController.swift
//  Guidomia-iOS
//
//  Created by chaouki bencherif on 12/10/2022.
//

import UIKit

class HomeViewController: UIViewController {

    // MARK: - Outlets

    @IBOutlet weak var tableView: UITableView!

    // MARK: - Properties

    var viewModel: HomeViewModel!

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        if viewModel == nil {
            viewModel = HomeViewModel()
            viewModel.refreshViewModel()
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupNavBar()
        registerTableView()
    }

    // MARK: - Local Helpers

    private func setupNavBar() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .orange
        appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        navigationController?.navigationBar.standardAppearance = appearance;
        navigationController?.navigationBar.scrollEdgeAppearance = navigationController?.navigationBar.standardAppearance
        self.title = "Guidomia"
    }

    private func registerTableView() {
        tableView.register(UINib(nibName: HeaderCell.identifier, bundle: nil), forCellReuseIdentifier: HeaderCell.identifier)
        tableView.register(UINib(nibName: FilterCell.identifier, bundle: nil), forCellReuseIdentifier: FilterCell.identifier)
        tableView.register(UINib(nibName: CarCell.identifier, bundle: nil), forCellReuseIdentifier: CarCell.identifier)
    }

    private func openPickerScreen(data: [String]) {
        let pickerViewController = PickerViewController.create(data: data, delegate: self)
        self.present(pickerViewController, animated: true)
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.items.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let item = viewModel.items[indexPath.row]
        switch item.type {
        case .header:
            if let cell = tableView.dequeueReusableCell(withIdentifier: HeaderCell.identifier, for: indexPath) as? HeaderCell {
                cell.item = item as? HeaderViewModelItem
                return cell
            }
        case .filter:
            if let cell = tableView.dequeueReusableCell(withIdentifier: FilterCell.identifier, for: indexPath) as? FilterCell {
                cell.item = item as? FilterViewModelItem
                cell.delegate = self
                return cell
            }
        case .car:
            if let cell = tableView.dequeueReusableCell(withIdentifier: CarCell.identifier, for: indexPath) as? CarCell {
                cell.item = item as? CarViewModelItem
                return cell
            }
        }

        return UITableViewCell()
    }
}

extension HomeViewController: FilterCellProtocol {
    func onSelectMake() {
        viewModel.filterType = .make
        var values = ["Any Make"]
        values.append(contentsOf: viewModel.getValuesFrom(property: "make"))
        openPickerScreen(data: values)
    }

    func onSelectModel() {
        viewModel.filterType = .model
        var values = ["Any Model"]
        values.append(contentsOf: viewModel.getValuesFrom(property: "model"))
        openPickerScreen(data: values)
    }
}

extension HomeViewController: PickerViewProtocol {
    func didSelect(element: String) {
        switch viewModel.filterType {
        case .make:
            viewModel.selectedMakeFilter = element
        case .model:
            viewModel.selectedModelFilter = element
        }
        viewModel.refreshViewModel()
        self.tableView.reloadData()
    }
}
