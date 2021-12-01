//
//  DropDownListDemo.swift
//  LoginScreenAuth
//
//  Created by Gaditek on 25/11/2021.
//

import UIKit


class ProtocolListVC: UIViewController {
    
    var viewModel = ProtocolListVM()
    weak var delegate: ProtocolListDelegate?
    
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var doneBtn: UIButton!
    @IBOutlet weak var LabelView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pickerView.delegate = self
        pickerView.dataSource = self
        pickerView.reloadAllComponents()
        viewModel.checkDuplicate()
    }
    //this code in animation of picker view
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        pickerView.transform = .identity.translatedBy(x: 0, y: 600)
        doneBtn.transform = .identity.translatedBy(x: 0, y: 600)
        LabelView.transform = .identity.translatedBy(x: 0, y: 600)
        
        UIView.animate(withDuration: 0.5, delay: 0, options: [.allowAnimatedContent, .preferredFramesPerSecond60]) {
            self.pickerView.transform = .identity
            self.doneBtn.transform = .identity
            self.LabelView.transform = .identity
        } completion: { _ in
            print("Completed")
        }
    }
    
    //animation end
    //dissmiss controller button
    @IBAction func buttonTap(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func doneButton(_ sender: Any) {
        if let n = viewModel.name{
            dismiss(animated: true) {
                self.delegate?.doneButtonAction(name: n)
            }
        }
        viewModel.selectedProtoData()
    }
}

extension ProtocolListVC: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return viewModel.data.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return viewModel.data[row].proto
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        viewModel.name = viewModel.data[row].proto
    }
}
