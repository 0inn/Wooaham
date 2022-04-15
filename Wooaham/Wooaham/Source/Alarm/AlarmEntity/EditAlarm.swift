//
//  EditAlarm.swift
//  Wooaham
//
//  Created by 김영인 on 2022/04/15.
//

import Foundation

// MARK: - EditAlarmRequest
struct EditAlarmRequest: Codable {
    var title: String
    var time: String
    var daysOfWeek: String?
    var enabled: Bool?
    var before10min: Bool?
    var iconId: CLong
}

// MARK: - EditAlarmResponse
struct EditAlarmResponse: Codable {
    let success: Bool
    let data: EditAlarmData
    let error: Bool?
}

// MARK: - EditAlarmData
struct EditAlarmData: Codable {
    let alarmId, userId, iconId: Int
    let title: String
    let time, daysOfWeek: String
    let enabled, before10min: Bool
}
