//
//  AddAlarmViewController+Extension.swift
//  Wooaham
//
//  Created by 김영인 on 2022/05/29.
//

import UserNotifications

extension AddAlarmViewController {
    
    func requestAuthorization() {
        let options = UNAuthorizationOptions(arrayLiteral: .alert, .badge, .sound)
        userNotificationCenter.requestAuthorization(options: options) { success, error in
            if let error = error {
                print(error)
            }
        }
    }
    
    func sendNotification(_ name: String, _ time: String) {
        let notiContent = UNMutableNotificationContent()
        let date = Date()
        notiContent.title = name
        notiContent.body = time
        
        let ampmStart = time.index(time.startIndex, offsetBy: 0)
        let ampmEnd = time.index(time.startIndex, offsetBy: 2)
        let ampm = time[ampmStart ..< ampmEnd]
        
        let hourStart = time.index(time.startIndex, offsetBy: 3)
        let hourEnd = time.index(time.startIndex, offsetBy: 5)
        var hour = Int(time[hourStart ..< hourEnd]) ?? 0
        if (ampm == "오후" || ampm == "PM") { hour += 12 }
        
        let minStart = time.index(time.startIndex, offsetBy: 6)
        let minEnd = time.index(time.startIndex, offsetBy: 8)
        let minute = Int(time[minStart ..< minEnd]) ?? 0

        var dateComponents = Calendar.current.dateComponents([.year, .month, .day], from: date)
        dateComponents.hour = hour
        dateComponents.minute = minute
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
        let request = UNNotificationRequest(identifier: "LocalNoti", content: notiContent, trigger: trigger)

        userNotificationCenter.add(request) { error in
            if let error = error {
                print(error)
            }
        }
    }
    
}
