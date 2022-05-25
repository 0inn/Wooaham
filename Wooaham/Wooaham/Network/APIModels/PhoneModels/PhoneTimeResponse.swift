//
//  PhoneTimeResponse.swift
//  Wooaham
//
//  Created by 김영인 on 2022/05/23.
//

import Foundation

struct PhoneTimeResponse: Codable {
    let success: Bool
    let data: PhoneTimeData?
    let error: Bool?
}

struct PhoneTimeData: Codable {
    let hour, minute: Int?
}
