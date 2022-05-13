//
//  MyStudentResponse.swift
//  Wooaham
//
//  Created by 김영인 on 2022/05/13.
//

import Foundation

struct MyStudentResponse: Codable {
    let success: Bool?
    let data: [MyStudentData]
    let error: Bool?
}

struct MyStudentData: Codable {
    let userId, studentId: Int
    let name: String
}
