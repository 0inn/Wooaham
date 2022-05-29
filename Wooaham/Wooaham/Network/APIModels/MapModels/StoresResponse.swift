//
//  StoresResponse.swift
//  Wooaham
//
//  Created by 김영인 on 2022/05/29.
//

import Foundation

struct StoresResponse: Codable {
    let success: Bool
    let data: [StoresData]
    let error: Bool?
}

struct StoresData: Codable {
    let storeId: String
    let lat, lng: Double
}
