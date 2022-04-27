//
//  WriteHomeworkResponse.swift
//  Wooaham
//
//  Created by 김영인 on 2022/04/27.
//

import Foundation

struct WriteHomeworkResponse: Codable {
    let success: Bool
    let data: Int
    let error: Bool?
}
