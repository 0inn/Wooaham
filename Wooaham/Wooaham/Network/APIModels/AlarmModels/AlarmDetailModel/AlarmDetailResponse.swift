//
//  AlarmDetailResponse.swift
//  Wooaham
//
//  Created by 김영인 on 2022/04/15.
//

import Foundation

// MARK: - AlarmDetailResponse
struct AlarmDetailResponse: Codable {
    let success: Bool
    let data: AlarmDetailData
    let error: Bool?
}

// MARK: - AlarmDetailData
struct AlarmDetailData: Codable {
    var alarmId, userId, iconId: Int
    let title: String
    let time, daysOfWeek: String
    let enabled, before10min: Bool
}
