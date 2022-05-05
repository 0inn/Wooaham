//
//  JoinAPI.swift
//  Wooaham
//
//  Created by 김영인 on 2022/05/05.
//

import Alamofire

class JoinAPI {
    
    func postJoin(_ joinInfo: JoinRequest, _ delegate: JoinViewController) {
        
        let url = "\(Const.URL.BASE_URL)/users"
        
        let body: [String: Any] = [
            "email": joinInfo.email,
            "password": joinInfo.password,
            "birth": joinInfo.birth,
            "name": joinInfo.name,
            "role": joinInfo.role
        ]
        
        AF.request(url,
                   method: .post,
                   parameters: body,
                   encoding: JSONEncoding.default,
                   headers: nil)
        .validate()
        
    }
}
