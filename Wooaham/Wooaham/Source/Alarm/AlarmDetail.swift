//
//  AlarmDetail.swift
//  Wooaham
//
//  Created by 김영인 on 2022/04/15.
//

import UIKit

// MARK: [서버] 알람 상세 페이지 조회
extension AddAlarmViewController {
    func getAlarmDetailAPI() {
        alarmDetailDataManager.getAlarmDetail(alarmId ?? 0, self)
    }
    func didSuccessAlarmDetail(_ alarmDetailData: AlarmDetailData) {
        alarmDetail = alarmDetailData
        setUI()
    }
}

// MARK: 상세 페이지 UI
extension AddAlarmViewController {
    
    func insertZero(_ number: Int) -> String {
        let str = String(format: "%02d", number)
        return str
    }
    
    private func setUI() {
        setIcon()
        setTitle()
        setTime()
        setDays()
        setTenMin()
    }
    
    private func setIcon() {
        let btn = iconBtns[alarmDetail.iconId]
        btn.isSelected = true
        iconViews[alarmDetail.iconId].backgroundColor = .mainPink.withAlphaComponent(0.5)
        iconImg.image = btn.image(for: .normal)
    }
    
    private func setTitle() {
        nameTextField.text = alarmDetail.title
    }
    
    private func setTime() {
        alarmTime = "\(alarmDetail.time)"
        let formatter = DateFormatter()
        formatter.dateFormat = "hh:mm a"
        let dateTime = formatter.date(from: alarmTime)
        datePicker.setDate(dateTime ?? Date(), animated: false)
    }
    
    private func setDays() {
        let days = alarmDetail.daysOfWeek
        for i in 0...6 {
            if days[days.index(days.startIndex, offsetBy: i)] == "1" {
                dayBtns[i].tintColor = .systemPink
                dayBtns[i].isSelected = true
            } else {
                dayBtns[i].tintColor = .systemBackground
            }
        }
    }
    
    private func setTenMin() {
        tenMinSwitch.isOn = alarmDetail.before10min
    }
    
}
