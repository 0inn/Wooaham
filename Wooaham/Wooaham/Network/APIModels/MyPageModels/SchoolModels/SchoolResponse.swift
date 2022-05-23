//
//  SchoolResponse.swift
//  Wooaham
//
//  Created by 김영인 on 2022/05/13.
//

import Foundation

struct SchoolResponse: Codable {
    let success: Bool
    let data: [SchoolData]?
    let error: Bool?
}

struct SchoolData: Codable {
    let schoolCode, schoolName, officeCode, region: String?
}
