//
//  AlarmResponse.swift
//  Wooaham
//
//  Created by 김영인 on 2022/04/10.
//

import Foundation

// MARK: - AlarmResponse
struct AlarmResponse: Codable {
    let success: Bool
    let data: [AlarmData]
    let error: Bool?
}

// MARK: - AlarmData
struct AlarmData: Codable {
    let alarmId, userId, iconId: Int
    let title: String
    let hour, minute: Int
    let ampm, daysOfWeek: String
    let enabled, before10min: Bool
}
