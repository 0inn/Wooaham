//
//  SchoolResponse.swift
//  Wooaham
//
//  Created by 김영인 on 2022/05/13.
//

import Foundation

struct SchoolResponse: Codable {
    let schoolInfo: [SchoolInfo]!
}

struct SchoolInfo: Codable {
    let head: [SchoolHead]!
    let row: [SchoolRow]!
}

struct SchoolHead: Codable {
    let list_total_count: Int?
    let RESULT: SchoolResult!
}

struct SchoolResult: Codable {
    let MESSAGE, CODE: String
}

struct SchoolRow: Codable {
    let schoolName: String
    let officeCode: String
    let schoolCode: String

    enum CodingKeys: String, CodingKey {
        case schoolName = "SCHUL_NM"
        case officeCode = "ATPT_OFCDC_SC_CODE"
        case schoolCode = "SD_SCHUL_CODE"
    }
}
