//
//  MealPlannerResponse.swift
//  Wooaham
//
//  Created by 김영인 on 2022/04/29.
//

import Foundation

struct MealPlannerResponse: Codable {
    let mealServiceDietInfo: [MealPlannerInfo]!
}

struct MealPlannerInfo: Codable {
    let head: [MealPlannerHead]!
    let row: [MealPlannerRow]!
}

struct MealPlannerHead: Codable {
    let list_total_count: Int?
    let RESULT: MealPlannerResult!
}

struct MealPlannerResult: Codable {
    let MESSAGE, CODE: String
}

struct MealPlannerRow: Codable {
    let MLSV_YMD: String
    let CAL_INFO: String
    let DDISH_NM: String
    let SCHUL_NM: String

//    enum CodingKeys: String, CodingKey {
//        case MLSV_YMD = "date"
//        case CAL_INFO = "kcal"
//        case ORPLC_INFO = "origin"
//        case DDISH_NM = "dishName"
//        case SCHUL_NM = "schoolName"
//    }
}
