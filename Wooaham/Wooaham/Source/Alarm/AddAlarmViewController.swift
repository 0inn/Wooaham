//
//  AddAlarmViewController.swift
//  Wooaham
//
//  Created by 김영인 on 2022/04/05.
//

import UIKit
import Foundation

class AddAlarmViewController: UIViewController {
    
    @IBOutlet weak var iconImg: UIImageView!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var firstView: UIView!
    @IBOutlet weak var secondView: UIView!
    @IBOutlet weak var thirdView: UIView!
    
    @IBOutlet weak var firstIcon: UIButton!
    @IBOutlet weak var secondIcon: UIButton!
    @IBOutlet weak var thirdIcon: UIButton!
    
    @IBOutlet weak var sun: UIButton!
    @IBOutlet weak var mon: UIButton!
    @IBOutlet weak var tue: UIButton!
    @IBOutlet weak var wed: UIButton!
    @IBOutlet weak var thur: UIButton!
    @IBOutlet weak var fri: UIButton!
    @IBOutlet weak var sat: UIButton!
    
    var iconViews: [UIView]!
    var iconBtns: [UIButton]!
    
    var alarmTime: String!
    var setDays: [Bool] = [false, false, false, false, false, false, false]
    var postDays: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setData()
    }
    
    private func setData() {
        iconViews = [firstView, secondView, thirdView]
        iconBtns = [firstIcon, secondIcon, thirdIcon]
    }
    
    // 취소 버튼
    @IBAction func cancelBtnDidTap(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    @IBAction func firstIconDidTap(_ sender: UIButton) {
        setBtnToggle(sender)
    }
    
    @IBAction func secondIconDidTap(_ sender: UIButton) {
        setBtnToggle(sender)
    }
    
    @IBAction func thirdIconDidTap(_ sender: UIButton) {
        setBtnToggle(sender)
    }
    
    private func setBtnToggle(_ sender: UIButton) {
        for btn in iconBtns {
            if btn == sender {
                btn.isSelected = true
                iconViews[btn.tag].backgroundColor = .mainPink.withAlphaComponent(0.5)
                iconImg.image = btn.image(for: .normal)
            } else {
                btn.isSelected = false
                iconViews[btn.tag].backgroundColor = .systemBackground
            }
        }
    }
    
    // 알람 시간 설정
    @IBAction func changeAlarmTime(_ sender: UIDatePicker) {
        let formatter = DateFormatter()
        formatter.dateFormat = "hh:mm a"
        self.alarmTime = formatter.string(from: datePicker.date)
    }
    
    // 요일 설정 버튼 (일 - 토)
    @IBAction func sunDidTap(_ sender: UIButton) {
        selectDay(sender)
    }
    @IBAction func monDidTap(_ sender: UIButton) {
        selectDay(sender)
    }
    @IBAction func tueDidTap(_ sender: UIButton) {
        selectDay(sender)
    }
    @IBAction func wedDidTap(_ sender: UIButton) {
        selectDay(sender)
    }
    @IBAction func thurDidTap(_ sender: UIButton) {
        selectDay(sender)
    }
    @IBAction func friDidTap(_ sender: UIButton) {
        selectDay(sender)
    }
    @IBAction func satDidTap(_ sender: UIButton) {
        selectDay(sender)
    }
    
    private func selectDay(_ btn: UIButton) {
        if btn.isSelected {
            btn.backgroundColor = .systemBackground
            btn.isSelected = false
            self.setDays[btn.tag] = false
        } else {
            btn.tintColor = .systemPink
            btn.isSelected = true
            self.setDays[btn.tag] = true
        }
    }
    
    // 삭제하기 버튼
    @IBAction func deleteBtnDidTap(_ sender: Any) {
        print("❌ 삭제")
        self.dismiss(animated: true)
    }
    
    // 완료 버튼
    @IBAction func successBtnDidTap(_ sender: Any) {
        guard let icon = iconImg, icon.image != nil else {
            self.presentAlert(title: "아이콘을 선택해주세요.")
            return
        }
        guard let name = nameTextField.text, name.isExists else {
            self.presentAlert(title: "알람 이름을 입력해주세요.")
            return
        }
        guard let time = self.alarmTime, time != "" else {
            self.presentAlert(title: "알람 시간을 설정해주세요.")
            return
        }
        // 방식은 나중에 구체화
        for i in 0...6 {
            if self.setDays[i] == true {
                self.postDays += "1"
            } else {
                self.postDays += "0"
            }
        }
        print("✨ 알람 이름: \(name), 시간: \(self.alarmTime!) 선택한 요일: \(self.postDays)")
        self.dismiss(animated: true)
    }
    
}
