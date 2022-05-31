//
//  SchoolHomeworkAPI.swift
//  Wooaham
//
//  Created by 김영인 on 2022/04/24.
//

import Alamofire

class SchoolHomeworkAPI{
    func getSchoolHomework(_ delegate: HomeworkViewController) {
        AF.request(URLConstant.schoolHW,
                   method: .get,
                   parameters: nil,
                   encoding: URLEncoding.default,
                   headers: KeyChain.getAuthorizationHeader(account: Key.KeyChainKey.accessToken))
        .validate()
        .responseDecodable(of: HomeworkResponse.self) { (response) in
            switch response.result {
            case .success(let response):
                if response.success {
                    delegate.didSuccessHomework(response.data)
                }
                print("🔥\(response)")
            case .failure(let error):
                print("🔥\(error)")
            }
        }
    }
}
