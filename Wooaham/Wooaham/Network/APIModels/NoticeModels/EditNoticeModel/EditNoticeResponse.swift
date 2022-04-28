//
//  EditNoticeResponse.swift
//  Wooaham
//
//  Created by 김영인 on 2022/04/28.
//

import Foundation

struct EditNoticeResponse: Codable {
    let success: Bool
    let data: EditNoticeData
    let error: Bool?
}

struct EditNoticeData: Codable {
    let noticeId, userId: Int
    let title, contents: String
}
