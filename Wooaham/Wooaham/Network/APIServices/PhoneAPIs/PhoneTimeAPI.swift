//
//  PhoneTimeAPI.swift
//  Wooaham
//
//  Created by 김영인 on 2022/05/25.
//

import Alamofire

class PhoneTimeAPI {
    func getPhoneTime(_ delegate: HomeViewController) {
        AF.request(URLConstant.phoneTime,
                   method: .get,
                   parameters: nil,
                   encoding: JSONEncoding.default,
                   headers: KeyChain.getAuthorizationHeader(account: Key.KeyChainKey.accessToken))
        .validate()
        .responseDecodable(of: PhoneTimeResponse.self) { (response) in
            switch response.result {
            case .success(let response):
                guard let phoneTimeInfo = response.data else { return }
                delegate.didSuccessPhoneTime(phoneTimeInfo)
                print("🔥\(response)")
            case .failure(let error):
                print("🔥\(error)")
            }
        }
    }
}
