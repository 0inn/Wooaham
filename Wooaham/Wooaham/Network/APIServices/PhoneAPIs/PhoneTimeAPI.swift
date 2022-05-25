//
//  PhoneTimeAPI.swift
//  Wooaham
//
//  Created by 김영인 on 2022/05/25.
//

import Alamofire

class PhoneTimeAPI {
    
    func getPhoneTime(_ delegate: HomeViewController) {
        
        let url = "\(Const.URL.BASE_URL)/phone-time"
        
        let token = TokenUtils()
        guard let header = token.getAuthorizationHeader(accessToken: JWT.shared.jwt ?? "") else {
            return
        }
        
        AF.request(url,
                   method: .get,
                   parameters: nil,
                   encoding: JSONEncoding.default,
                   headers: header)
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
