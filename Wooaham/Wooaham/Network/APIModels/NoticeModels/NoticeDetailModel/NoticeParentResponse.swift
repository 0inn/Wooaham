//
//  NoticeParentResponse.swift
//  Wooaham
//
//  Created by 김영인 on 2022/05/20.
//

import Foundation

struct NoticeParentResponse: Codable {
    let success: Bool
    let data: [String]
    let error: Bool?
}
