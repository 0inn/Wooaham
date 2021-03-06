//
//  NoticeAPI.swift
//  Wooaham
//
//  Created by κΉμμΈ on 2022/04/15.
//

import Alamofire

class NoticeAPI {
    func getNotice(_ classCode: String, _ delegate: NoticeViewController) {
        URLCache.shared.removeAllCachedResponses()
        let params: [String: String] = [
            "classCode": classCode
        ]
        
        AF.request(URLConstant.notice,
                   method: .get,
                   parameters: params,
                   encoding: URLEncoding.default,
                   headers: KeyChain.getAuthorizationHeader(account: Key.KeyChainKey.accessToken))
        .validate()
        .responseDecodable(of: NoticeResponse.self) { (response) in
            switch response.result {
            case .success(let response):
                if response.success {
                    delegate.didSuccessNotice(response.data)
                }
                print("π₯\(response)")
            case .failure(let error):
                print("π₯\(error)")
            }
        }
    }
}
