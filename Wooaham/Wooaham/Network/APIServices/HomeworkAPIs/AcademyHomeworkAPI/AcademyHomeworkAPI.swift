//
//  AcademyHomeworkAPI.swift
//  Wooaham
//
//  Created by κΉμμΈ on 2022/04/24.
//

import Alamofire

class AcademyHomeworkAPI{
    func getAcademyHomework(_ delegate: HomeworkViewController) {
        AF.request(URLConstant.academyHW,
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
                print("π₯\(response)")
            case .failure(let error):
                print("π₯\(error)")
            }
        }
    }
}
