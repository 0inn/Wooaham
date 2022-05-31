//
//  AddPhoneTimeAlarmAPI.swift
//  Wooaham
//
//  Created by 김영인 on 2022/05/25.
//

import Alamofire

class AddPhoneTimeAPI {
    func addPhoneTime(_ hour: CLong, _ minute: CLong, _ delegate: AddPhoneViewController) {
        let body: [String: Any] = [
            "hour": hour,
            "minute": minute
        ]
        
        AF.request(URLConstant.addPhoneTime,
                   method: .put,
                   parameters: body,
                   encoding: JSONEncoding.default,
                   headers: KeyChain.getAuthorizationHeader(account: Key.KeyChainKey.accessToken))
        .validate()
        .response { (response) in
            print("🔥 \(response)")
        }
    }
}
