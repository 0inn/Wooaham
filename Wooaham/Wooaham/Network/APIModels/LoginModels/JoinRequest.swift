//
//  JoinRequest.swift
//  Wooaham
//
//  Created by 김영인 on 2022/05/05.
//

import Foundation

struct JoinRequest: Codable {
    let email, password: String
    let name, birth: String
    let role: String
}
