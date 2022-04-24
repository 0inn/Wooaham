//
//  SchoolHomeworkResponse.swift
//  Wooaham
//
//  Created by 김영인 on 2022/04/24.
//

import Foundation

// MARK: - SchoolHomeworkResponse
struct SchoolHomeworkResponse: Codable {
    let success: Bool
    let data: [SchoolHomeworkData]
    let error: Bool?
}

// MARK: - SchoolData
struct SchoolHomeworkData: Codable {
    let homeworkId, userId: Int
    let title: String
    let checked: Bool
}
