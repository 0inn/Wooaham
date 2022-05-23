//
//  AddPhoneViewController.swift
//  Wooaham
//
//  Created by 김영인 on 2022/05/11.
//

import UIKit

class AddPhoneViewController: UIViewController {
    
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
        // 알림 추가 API
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
        switch (component) {
        case 0:
            return "\(row)"
        case 1:
            return "\(row)"
        default:
            return ""
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch (component) {
        case 0:
            hourLabel.text = "\(row)"
        case 1:
            minuteLabel.text = "\(row)"
        default:
            print("시간 제한 에러")
        }
    }
}
