//
//  JoinErrorResponse.swift
//  Wooaham
//
//  Created by 김영인 on 2022/05/08.
//

import Foundation

struct JoinErrorResponse: Codable {
    let status: Int?
    let code, message, timestamp: String?
}
