//
//  AddPhoneTimeAlarmAPI.swift
//  Wooaham
//
//  Created by 김영인 on 2022/05/25.
//

import Alamofire

class AddPhoneTimeAPI {
    
    func addPhoneTime(_ hour: CLong, _ minute: CLong, _ delegate: AddPhoneViewController) {
        
        let url = "\(Const.URL.BASE_URL)/phone-time/alarm"
        
        let token = TokenUtils()
        guard let header = token.getAuthorizationHeader(accessToken: JWT.shared.jwt ?? "") else {
            return
        }
        
        let body: [String: Any] = [
            "hour": hour,
            "minute": minute
        ]
        
        AF.request(url,
                   method: .put,
                   parameters: body,
                   encoding: JSONEncoding.default,
                   headers: header)
        .validate()
        .response { (response) in
            print("🔥 \(response)")
        }
    }
    
}
