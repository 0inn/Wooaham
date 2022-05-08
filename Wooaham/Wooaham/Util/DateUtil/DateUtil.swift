//
//  DateUtil.swift
//  Wooaham
//
//  Created by 김영인 on 2022/04/14.
//

import UIKit

func getToday() -> String {
    let today = NSDate()
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyyMMdd"
    let todayString = dateFormatter.string(from: today as Date)
    return todayString
}

func getTodayTitle() -> String {
    let today = NSDate()
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "M월 W주"
    let todayString = dateFormatter.string(from: today as Date)
    return todayString
}

func getTodaymmdd() -> String {
    let today = NSDate()
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "M월 d일 (EEEE)"
    let todayString = dateFormatter.string(from: today as Date)
    return todayString
}
