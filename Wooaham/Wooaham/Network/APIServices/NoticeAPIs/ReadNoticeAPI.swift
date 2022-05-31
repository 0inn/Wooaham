//
//  ReadNoticeAPI.swift
//  Wooaham
//
//  Created by 김영인 on 2022/04/28.
//

import Alamofire

class ReadNoticeAPI {
    func postReadNotice(_ noticeId: CLong) {
        let url = "\(Const.URL.BASE_URL)/info/notice/\(noticeId)/reading"
        AF.request(url,
                   method: .post,
                   parameters: nil,
                   encoding: URLEncoding.default,
                   headers: APIConstant.header)
        .validate()
        .responseDecodable(of: Response.self) { (response) in
            switch response.result {
            case .success(let response):
                print("🔥\(response)")
            case .failure(let error):
                print("🔥\(error)")
            }
        }
    }
}
