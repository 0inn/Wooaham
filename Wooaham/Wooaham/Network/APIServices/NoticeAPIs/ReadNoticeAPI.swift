//
//  ReadNoticeAPI.swift
//  Wooaham
//
//  Created by 김영인 on 2022/04/28.
//

import Alamofire

class ReadNoticeAPI {
    
    func postReadNotice(_ noticeId: CLong, _ userId: CLong) {
        
        let url = "\(Const.URL.BASE_URL)/info/notice/\(noticeId)/reading"
        
        let params: [String: Any] = [
            "userId": userId
        ]
            
        AF.request(url,
                   method: .post,
                   parameters: params,
                   encoding: URLEncoding.default,
                   headers: nil)
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
