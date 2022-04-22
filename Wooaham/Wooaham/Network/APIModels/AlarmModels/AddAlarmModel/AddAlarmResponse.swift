//
//  AddAlarmResponse.swift
//  Wooaham
//
//  Created by 김영인 on 2022/04/15.
//

import Foundation

// MARK: - AddAlarmResponse
struct AddAlarmResponse: Codable {
    let success: Bool
    let data: CLong
    let error: Bool?
}
