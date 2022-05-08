//
//  JoinResponse.swift
//  Wooaham
//
//  Created by 김영인 on 2022/05/08.
//

import Foundation

struct JoinResponse: Codable {
    let success: Bool
    let data: CLong
    let error: Bool?
}
