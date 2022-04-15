//
//  AddAlarmViewController.swift
//  Wooaham
//
//  Created by 김영인 on 2022/04/05.
//

import UIKit
import Foundation

class AddAlarmViewController: UIViewController {
    
    lazy var alarmDetailDataManager = AlarmDetailDataManager()
    var alarmDetail: AlarmDetailData!
    var alarmId: CLong?
    
    lazy var addAlarmDataManager = AddAlarmDataManager()
    var alarmInfo: AddAlarmRequest!
    var userId: CLong?  // 나중에 무조건 jwt 사용해 저장
    var iconNum: CLong!
    
    var iconViews: [UIView]!
    var iconBtns: [UIButton]!
    var dayBtns: [UIButton]!
    
    var alarmTime: String!
    var postDays: String = ""
    
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
    
    @IBOutlet weak var tenMinSwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setData()
        // 저장 방식 생각하자
        if alarmId != nil {
            getAlarmDetailAPI()
        }
    }
    
    private func setData() {
        iconViews = [firstView, secondView, thirdView]
        iconBtns = [firstIcon, secondIcon, thirdIcon]
        dayBtns = [sun,mon, tue, wed, thur, fri, sat]
    }
    
    // 취소 버튼
    @IBAction func cancelBtnDidTap(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    @IBAction func IconDidTap(_ sender: UIButton) {
        setBtnToggle(sender)
    }
    
    private func setBtnToggle(_ sender: UIButton) {
        for btn in iconBtns {
            if btn == sender {
                btn.isSelected = true
                iconViews[btn.tag].backgroundColor = .mainPink.withAlphaComponent(0.5)
                iconImg.image = btn.image(for: .normal)
                iconNum = CLong(btn.tag)
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
        alarmTime = formatter.string(from: datePicker.date)
    }
    
    // 요일 설정 버튼 (일 - 토)
    @IBAction func daysBtnDidTap(_ sender: UIButton) {
        selectDay(sender)
    }
    
    // 요일 선택 - 리팩토링 필요
    func selectDay(_ btn: UIButton) {
        if btn.isSelected {
            dayBtns[btn.tag].backgroundColor = .systemBackground
            dayBtns[btn.tag].isSelected = false
        } else {
            dayBtns[btn.tag].tintColor = .systemPink
            dayBtns[btn.tag].isSelected = true
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
        guard let time = alarmTime, time != "hh:mm a" else {
            self.presentAlert(title: "알람 시간을 설정해주세요.")
            return
        }
        // 방식은 나중에 구체화
        for i in 0...6 {
            if dayBtns[i].isSelected {
                postDays += "1"
            } else {
                postDays += "0"
            }
        }
        print("✨ 알람 이름: \(name), 시간: \(self.alarmTime!) 선택한 요일: \(postDays)")
        alarmInfo = AddAlarmRequest(title: name, time: alarmTime, daysOfWeek: postDays, enabled: true, before10min: tenMinSwitch.isOn, iconId: iconNum)
        addAlarm()
        self.dismiss(animated: true)
    }
    
}

extension AddAlarmViewController {
    private func addAlarm() {
        addAlarmDataManager.postAlarm(1, alarmInfo, self)
    }
    func didSuccessAddAlarm(_ alarmId: CLong) {
        print("🕰 \(alarmId)번 알람 생성 완료")
    }
}
