//
//  WriteNoticeAPI.swift
//  Wooaham
//
//  Created by 김영인 on 2022/04/27.
//

import Alamofire

class WriteNoticeAPI {
    
    func postNotice(_ noticeInfo: WriteNoticeRequest, _ delegate: WriteNoticeViewController) {
        
        let url = "\(Const.URL.BASE_URL)/info/notice"
        
        let token = TokenUtils()
        guard let header = token.getAuthorizationHeader(accessToken: JWT.shared.jwt ?? "") else {
            return
        }
        
        let body: [String: Any] = [
            "title": noticeInfo.title,
            "contents": noticeInfo.contents
        ]
        
        AF.request(url,
                   method: .post,
                   parameters: body,
                   encoding: JSONEncoding.default,
                   headers: header)
        .validate()
        .responseDecodable(of: WriteNoticeResponse.self) { (response) in
            switch response.result {
            case .success(let response):
                print("🔥\(response)")
            case .failure(let error):
                print("🔥\(error)")
            }
        }
        
    }
}
