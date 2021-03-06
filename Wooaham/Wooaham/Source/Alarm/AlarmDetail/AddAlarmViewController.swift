//
//  AddAlarmViewController.swift
//  Wooaham
//
//  Created by 김영인 on 2022/04/05.
//

import UIKit
import Foundation

class AddAlarmViewController: UIViewController {
    
    let userNotificationCenter = UNUserNotificationCenter.current()
    
    lazy var alarmDetailDataManager = AlarmDetailAPI()
    var alarmDetail: AlarmDetailData!
    var alarmId: CLong?
    
    lazy var addAlarmDataManager = AddAlarmAPI()
    var alarmInfo: AddAlarmRequest!
    var userId: CLong?  // 나중에 무조건 jwt 사용해 저장
    var iconNum: CLong!
    
    lazy var editAlarmDataManager = EditAlarmAPI()
    var editAlarmInfo: EditAlarmRequest!
    
    var AddFlag: Bool!
    
    var iconViews: [UIView]!
    var iconBtns: [UIButton]!
    var dayBtns: [UIButton]!
    
    var alarmTime: String!
    var postDays: String = ""
    
    @IBOutlet weak var iconImg: UIImageView!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var firstView: UIView!
    @IBOutlet weak var secondView: UIView!
    @IBOutlet weak var thirdView: UIView!
    @IBOutlet weak var fourthView: UIView!
    
    @IBOutlet weak var firstIcon: UIButton!
    @IBOutlet weak var secondIcon: UIButton!
    @IBOutlet weak var thirdIcon: UIButton!
    @IBOutlet weak var fourthIcon: UIButton!
    
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
        setTextField()
        // 저장 방식 생각하자
        if alarmId != nil {
            getAlarmDetailAPI()
        }
    }
    
    private func setData() {
        iconViews = [UIView(), firstView, secondView, thirdView, fourthView]
        iconBtns = [UIButton(), firstIcon, secondIcon, thirdIcon, fourthIcon]
        dayBtns = [sun,mon, tue, wed, thur, fri, sat]
        datePicker.locale = Locale(identifier: "ko-KR")
    }
    
    private func setTextField() {
        nameTextField.delegate = self
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
                if (btn.tag == 4) {
                    iconViews[btn.tag].backgroundColor = .mainGreen.withAlphaComponent(0.5)
                    mainView.backgroundColor = .mainGreen
                } else {
                iconViews[btn.tag].backgroundColor = .mainPink.withAlphaComponent(0.5)
                    mainView.backgroundColor = .mainPink
                }
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
        formatter.locale = Locale(identifier: "ko")
        formatter.dateFormat = "a hh:mm"
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
        guard let time = alarmTime, time != "a hh:mm" else {
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
        if AddFlag {
            alarmInfo = AddAlarmRequest(title: name,time: alarmTime, daysOfWeek: postDays, enabled: true, before10min: tenMinSwitch.isOn, iconId: iconNum + 3)
            addAlarm()
        } else {
            editAlarmInfo = EditAlarmRequest(title: name, time: alarmTime, daysOfWeek: postDays, enabled: alarmDetail.enabled, before10min: tenMinSwitch.isOn, iconId: iconNum + 3)
            editAlarm()
        }
        requestAuthorization()
        sendNotification(name, time)
        self.dismiss(animated: true)
    }
    
}

// MARK: - 알람 생성
extension AddAlarmViewController {
    private func addAlarm() {
        addAlarmDataManager.postAlarm(alarmInfo, self)
    }
    func didSuccessAddAlarm(_ alarmId: CLong) {
        print("🕰 \(alarmId)번 알람 생성 완료")
    }
}

// MARK: - 알람 수정
extension AddAlarmViewController {
    private func editAlarm() {
        editAlarmDataManager.editAlarm(alarmId ?? 0, editAlarmInfo, self)
    }
    func didSuccessEditAlarm(_ alarmId: CLong) {
        print("🕰 \(alarmId)번 알람 수정 완료")
    }
}
