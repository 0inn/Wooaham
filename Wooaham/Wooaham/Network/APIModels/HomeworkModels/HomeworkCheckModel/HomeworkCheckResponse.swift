//
//  HomeworkCheckResponse.swift
//  Wooaham
//
//  Created by 김영인 on 2022/04/27.
//

import Foundation

struct HomeworkCheckResponse: Codable {
    let success: Bool
    let data: HomeworkCheckData
    let error: Bool?
}

struct HomeworkCheckData: Codable {
    let homeworkId, userId: Int
    let title: String
    let checked: Bool
}
