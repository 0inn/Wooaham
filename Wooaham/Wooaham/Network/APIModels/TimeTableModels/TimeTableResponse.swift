//
//  TimeTableResponse.swift
//  Wooaham
//
//  Created by 김영인 on 2022/05/06.
//

import Foundation

struct TimeTableResponse: Codable {
    let elsTimetable: [TimeTableInfo]?
}

struct TimeTableInfo: Codable {
    let head: [TimeTableHead]?
    let row: [[TimeTableRow]]?
}

struct TimeTableHead: Codable {
    let list_total_count: Int?
    let RESULT: TimeTableResult!
}

struct TimeTableResult: Codable {
    let MESSAGE, CODE: String
}

struct TimeTableRow: Codable {
    let time: String
    let grade: String
    let classNum: String
    let school: String
    let subject:  String

    enum CodingKeys: String, CodingKey {
        case time = "PERIO"
        case grade = "GRADE"
        case classNum = "CLASS_NM"
        case school = "SCHUL_NM"
        case subject = "ITRT_CNTNT"
    }
}
