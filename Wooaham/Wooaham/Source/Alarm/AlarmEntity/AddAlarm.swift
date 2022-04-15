//
//  AddAlarm.swift
//  Wooaham
//
//  Created by 김영인 on 2022/04/15.
//

import Foundation

// MARK: - AddAlarmRequest
struct AddAlarmRequest: Codable {
    var title: String
    var time: String
    var daysOfWeek: String?
    var enabled: Bool?
    var before10min: Bool?
    var iconId: CLong
}

// MARK: - AddAlarmResponse
struct AddAlarmResponse: Codable {
    let success: Bool
    let data: CLong
    let error: Bool?
}
