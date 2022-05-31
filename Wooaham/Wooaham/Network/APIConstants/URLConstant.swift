//
//  URLConstant.swift
//  Wooaham
//
//  Created by 김영인 on 2022/05/31.
//

import Foundation

struct URLConstant {
    
    // MARK: - base URL
    
    static let baseURL = "http://13.125.184.62:9000"
    
    // MARK: - login URL
    
    static let login = "\(baseURL)/users/login"
    
    // MARK: - Home URL
    
    // MARK: Notice URL
    
    static let notice = "\(baseURL)/info/notice/"
    static let writeNotice = "\(baseURL)/info/notice"
    
    // MARK: MealPlanner URL
    
    static let lunchtableOneDay = "\(baseURL)/info/lunchtable/one-day"
    static let lunchtable = "\(baseURL)/info/lunchtable"
    
    // MARK: TImeTable URL
    
    static let timeTableOneDay = "\(baseURL)/info/timetable/one-day"
    static let timeTable = "\(baseURL)/info/timetable"
    
    // MARK: Homework URL
    
    static let schoolHW = "\(baseURL)/info/hw/school/"
    static let academyHW = "\(baseURL)/info/hw/academy/"
    static let writeHW = "\(baseURL)/info/hw"
    
    // MARK: PhoneTime URL
    
    static let phoneTime = "\(baseURL)/phone-time"
    static let phoneTimeAlarm = "\(baseURL)/phone-time/alarm"
    static let addPhoneTime = "\(baseURL)/phone-time/alarm"
    
    // MARK: - Alarm URL
    
    static let alarm = "\(baseURL)/alarms"
    
    // MARK: - MyPage URL
    
    static let mypage = "\(baseURL)/users/\(Key.UserIdKey.userId ?? "")"
    static let quit = "\(baseURL)/users/\(Key.UserIdKey.userId ?? "")"
    static let addSchool = "\(baseURL)/users/\(Key.UserIdKey.userId ?? "")/school"
    static let addClass = "\(baseURL)/users/\(Key.UserIdKey.userId ?? "")/class"
    static let children = "\(baseURL)/users/\(Key.UserIdKey.userId ?? "")/children"
    static let changeChild = "\(baseURL)/users/\(Key.UserIdKey.userId ?? "")/link/change"
    static let addParent = "\(baseURL)/users/\(Key.UserIdKey.userId ?? "")/link"
}
