//
//  EditHomeworkResponse.swift
//  Wooaham
//
//  Created by 김영인 on 2022/04/27.
//

import Foundation

struct EditHomeworkResponse: Codable {
    let success: Bool
    let data: EditHomeworkData
    let error: Bool?
}

struct EditHomeworkData: Codable {
    let homeworkId, userId: Int
    let title: String
    let checked: Bool
}
