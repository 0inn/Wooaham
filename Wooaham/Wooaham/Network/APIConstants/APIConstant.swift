//
//  APIConstant.swift
//  Wooaham
//
//  Created by 김영인 on 2022/05/31.
//

import Foundation

struct APIConstant {
    static let header = KeyChain.getAuthorizationHeader(account: Key.KeyChainKey.accessToken)
}
