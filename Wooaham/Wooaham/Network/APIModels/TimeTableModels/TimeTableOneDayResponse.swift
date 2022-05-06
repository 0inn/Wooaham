//
//  TimeTableOneDayResponse.swift
//  Wooaham
//
//  Created by 김영인 on 2022/05/05.
//

import Foundation

struct TimeTableOneDayResponse: Codable {
    let elsTimetable: [TimeTableOneDayInfo]!
}

struct TimeTableOneDayInfo: Codable {
    let head: [TimeTableOneDayHead]!
    let row: [TimeTableOneDayRow]!
}

struct TimeTableOneDayHead: Codable {
    let list_total_count: Int?
    let RESULT: TimeTableOneDayResult!
}

struct TimeTableOneDayResult: Codable {
    let MESSAGE, CODE: String
}

struct TimeTableOneDayRow: Codable {
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
