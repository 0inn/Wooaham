//
//  WriteHomeworkRequest.swift
//  Wooaham
//
//  Created by 김영인 on 2022/04/27.
//

import Foundation

struct WriteHomeworkRequest: Codable {
    let title, type: String
    let checked: Bool
}
