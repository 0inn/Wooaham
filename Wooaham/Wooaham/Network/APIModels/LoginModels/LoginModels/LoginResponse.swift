//
//  LoginResponse.swift
//  Wooaham
//
//  Created by 김영인 on 2022/05/08.
//

import Foundation

struct LoginResponse: Codable {
    let success: Bool?
    let data: LoginData?
    let error: Bool?
}

struct LoginData: Codable {
    let userId: Int?
    let jwt: String?
}
