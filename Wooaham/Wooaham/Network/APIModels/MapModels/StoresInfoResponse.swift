//
//  StoresInfoResponse.swift
//  Wooaham
//
//  Created by 김영인 on 2022/06/01.
//

import Foundation

struct StoresInfoResponse: Codable {
    let success: Bool
    let data: StoresInfoData
    let error: Bool?
}

struct StoresInfoData: Codable {
    let storeId: String
    let lat, lng: Double
    let name, phoneNum, oldAddress, newAddress: String
    let categoryName: String
}
