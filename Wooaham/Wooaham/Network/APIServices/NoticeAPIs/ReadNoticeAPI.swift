//
//  ReadNoticeAPI.swift
//  Wooaham
//
//  Created by κΉμμΈ on 2022/04/28.
//

import Alamofire

class ReadNoticeAPI {
    func postReadNotice(_ noticeId: CLong) {
        let url = "\(Const.URL.BASE_URL)/info/notice/\(noticeId)/reading"
        AF.request(url,
                   method: .post,
                   parameters: nil,
                   encoding: URLEncoding.default,
                   headers: KeyChain.getAuthorizationHeader(account: Key.KeyChainKey.accessToken))
        .validate()
        .responseDecodable(of: Response.self) { (response) in
            switch response.result {
            case .success(let response):
                print("π₯\(response)")
            case .failure(let error):
                print("π₯\(error)")
            }
        }
    }
}
