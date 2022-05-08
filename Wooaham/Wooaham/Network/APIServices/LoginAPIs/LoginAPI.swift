//
//  LoginAPI.swift
//  Wooaham
//
//  Created by 김영인 on 2022/05/05.
//

import Alamofire

class LoginAPI {
    
    func postlogin(email: String, password: String, _ delegate: LoginViewController) {
        
        let url = "\(Const.URL.BASE_URL)/users/login"
        
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
        .responseDecodable(of: LoginResponse.self) { response in
            switch response.result {
            case .success(let response):
                let accessToken = response.data?.jwt
                let token = TokenUtils()
                token.create(url, account: "accessToken", value: accessToken ?? "")
                delegate.didSuccessLogin()
            case .failure:
                let decoder = JSONDecoder()
                if let data = response.data, let error = try? decoder.decode(ErrorResponse.self, from: data) {
                    delegate.failedToRequestLogin(error.message ?? "로그인에 실패하였습니다.")
                }
            }
            
        }
        
    }
}
