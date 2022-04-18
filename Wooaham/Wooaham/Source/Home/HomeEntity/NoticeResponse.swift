//
//  NoticeResponse.swift
//  Wooaham
//
//  Created by 김영인 on 2022/04/15.
//

import Foundation

// MARK: - NoticeResponse
struct NoticeResponse: Codable {
    let success: Bool
    let data: [NoticeData]
    let error: Bool?
}

// MARK: - Datum
struct NoticeData: Codable {
    let noticeId, userId: Int
    let title, contents: String
}
