//
//  QuitAPI.swift
//  Wooaham
//
//  Created by 김영인 on 2022/05/10.
//

import Alamofire

class QuitAPI {
    func quit(_ delegate: ProfileEditViewController) {
        let quit = "\(URLConstant.baseURL)/users/\(UserDefaults.standard.integer(forKey: Key.UserIdKey.key))"
        AF.request(quit,
                   method: .put,
                   parameters: nil,
                   encoding: JSONEncoding.default,
                   headers: KeyChain.getAuthorizationHeader(account: Key.KeyChainKey.accessToken))
        .validate()
        .response { response in
            switch response.result {
            case .success:
                delegate.didSuccessQuit()
            case .failure:
                let decoder = JSONDecoder()
                if let data = response.data, let error = try? decoder.decode(ErrorResponse.self, from: data) {
                    delegate.failedToRequestQuit(error.message ?? "계정탈퇴에 실패하였습니다.")
                }
            }
        }
    }
}
