//
//  LoginAPI.swift
//  Wooaham
//
//  Created by 김영인 on 2022/05/05.
//

import Alamofire

class LoginAPI {
    
    func postJoin(email: String, password: String, _ delegate: LoginViewController) {
        
        let url = "\(Const.URL.BASE_URL)/users"
        
        let body: [String: Any] = [
            "email": email,
            "password": password
        ]
        
        AF.request(url,
                   method: .post,
                   parameters: body,
                   encoding: JSONEncoding.default,
                   headers: nil)
        .validate()
        
    }
}
