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
    let alarmId, userId, iconId: Int
    let title: String
    let hour, minute: Int
    let ampm, daysOfWeek: String
    let enabled, before10min: Bool
}
