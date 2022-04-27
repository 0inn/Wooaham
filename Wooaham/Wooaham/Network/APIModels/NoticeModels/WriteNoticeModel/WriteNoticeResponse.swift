//
//  WriteNoticeResponse.swift
//  Wooaham
//
//  Created by 김영인 on 2022/04/27.
//

import Foundation

struct WriteNoticeResponse: Codable {
    let success: Bool
    let data: CLong
    let error: Bool?
}
