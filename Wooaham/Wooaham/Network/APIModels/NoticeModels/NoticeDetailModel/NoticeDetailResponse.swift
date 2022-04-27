//
//  NoticeDetailResponse.swift
//  Wooaham
//
//  Created by 김영인 on 2022/04/27.
//

import Foundation

struct NoticeDetailResponse: Codable {
    let success: Bool
    let data: NoticeDetailData
    let error: Bool?
}

struct NoticeDetailData: Codable {
    let noticeId, userId: Int
    let title, contents: String
}
