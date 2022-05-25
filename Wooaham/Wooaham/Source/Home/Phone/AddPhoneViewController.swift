//
//  AddPhoneViewController.swift
//  Wooaham
//
//  Created by 김영인 on 2022/05/11.
//

import UIKit

class AddPhoneViewController: UIViewController {
    
    lazy var addPhoneTimeAPI = AddPhoneTimeAPI()
    var hour: CLong = 0
    var minute: CLong = 0
    
    @IBOutlet weak var hourLabel: UILabel!
    @IBOutlet weak var minuteLabel: UILabel!
    @IBOutlet weak var timeLimitPickerView: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setPickerView()
    }

    @IBAction func cancelBtnDidTap(_ sender: Any) {
        dismiss(animated: true)
    }
    
    @IBAction func addBtnDidTap(_ sender: Any) {
        addPhoneTimeAPI.addPhoneTime(hour, minute, self)
        dismiss(animated: true)
    }
    
    private func setPickerView() {
        timeLimitPickerView.delegate = self
        timeLimitPickerView.dataSource = self
    }
}

extension AddPhoneViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch (component) {
        case 0:
            return 24
        case 1:
            return 61
        default:
            return 0
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "\(row)"
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch (component) {
        case 0:
            hour = row
            hourLabel.text = "\(row)"
        case 1:
            minute = row
            minuteLabel.text = "\(row)"
        default:
            print("시간 제한 에러")
        }
    }
}
