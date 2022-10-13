//
//  PickerViewController.swift
//  Guidomia-iOS
//
//  Created by chaouki bencherif on 13/10/2022.
//

import UIKit

protocol PickerViewProtocol: AnyObject {
    func didSelect(element: String)
}

class PickerViewController: UIViewController {

    // MARK: Outlets

    @IBOutlet weak var pickerView: UIPickerView!

    // MARK: Properties

    var data = [String]()
    var selectedElement = ""
    weak var delegate: PickerViewProtocol?

    // MARK: Init

    static func create(data: [String], delegate: PickerViewProtocol) -> UIViewController {

        let uiStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = uiStoryboard.instantiateViewController(withIdentifier: String(describing: PickerViewController.self)) as! PickerViewController
        viewController.data = data
        viewController.delegate = delegate
        viewController.selectedElement = data[0]
        return viewController
    }

    // MARK: Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: Actions

    @IBAction func onDone(_ sender: UIBarButtonItem) {
        dismiss(animated: true) {
            self.delegate?.didSelect(element: self.selectedElement)
        }
    }

    @IBAction func onCancel(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
}

extension PickerViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return self.data.count
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return self.data[row]
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.selectedElement = self.data[row]
    }
}
