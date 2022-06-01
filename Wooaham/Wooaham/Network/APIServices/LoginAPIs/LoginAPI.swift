//
//  LoginAPI.swift
//  Wooaham
//
//  Created by 김영인 on 2022/05/05.
//

import Alamofire

class LoginAPI {
    func postlogin(email: String, password: String, _ delegate: LoginViewController) {
        let body: [String: Any] = [
            "email": email,
            "password": password
        ]
        AF.request(URLConstant.login,
                   method: .post,
                   parameters: body,
                   encoding: JSONEncoding.default,
                   headers: nil)
        .validate()
        .responseDecodable(of: LoginResponse.self) { response in
            switch response.result {
            case .success(let response):
                guard let accessToken = response.data?.jwt else { return }
                guard let userId = response.data?.userId else { return }
                guard let role = response.data?.role else { return }
                KeyChain.create(account: Key.KeyChainKey.accessToken, jwt: accessToken)
                UserDefaults.standard.set(userId, forKey: Key.UserIdKey.key)
                UserDefaults.standard.set(role, forKey: Key.RoleKey.key)
                delegate.didSuccessLogin(response.data?.role ?? "")
            case .failure:
                let decoder = JSONDecoder()
                if let data = response.data, let error = try? decoder.decode(ErrorResponse.self, from: data) {
                    delegate.failedToRequestLogin(error.message ?? "로그인에 실패하였습니다.")
                }
            }
        }
    }
}
