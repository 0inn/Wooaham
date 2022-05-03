//
//  Functions.swift
//  Wooaham
//
//  Created by 김영인 on 2022/04/14.
//

import UIKit

// 이미지 설정
func setIcon(_ imgId: Int) -> UIImage {
    switch imgId {
    case 4:
        return UIImage(named: "house")!
    case 5:
        return UIImage(named: "school")!
    case 6:
        return UIImage(named: "bus")!
    default:
        return UIImage()
    }
}

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
