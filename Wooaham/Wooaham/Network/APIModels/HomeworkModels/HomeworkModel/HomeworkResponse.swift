//
//  HomeworkResponse.swift
//  Wooaham
//
//  Created by 김영인 on 2022/04/24.
//

import Foundation

struct HomeworkResponse: Codable {
    let success: Bool
    let data: [HomeworkData]
    let error: Bool?
}

struct HomeworkData: Codable {
    let homeworkId, userId: Int
    let title: String
    let checked: Bool
}
