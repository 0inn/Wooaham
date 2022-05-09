//
//  MyPageResponse.swift
//  Wooaham
//
//  Created by 김영인 on 2022/05/08.
//

import Foundation

struct MyPageResponse: Codable {
    let success: Bool?
    let data: MyPageData?
    let error: Bool?
}

struct MyPageData: Codable {
    let userId: Int?
    let icon: Icon?
    let name, email, birth, role: String?
}

struct Icon: Codable {
    let iconId: Int?
}
