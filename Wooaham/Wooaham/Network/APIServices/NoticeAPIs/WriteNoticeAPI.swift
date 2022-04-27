//
//  WriteNoticeAPI.swift
//  Wooaham
//
//  Created by 김영인 on 2022/04/27.
//

import Alamofire

class WriteNoticeAPI {
    
    func postNotice(_ userId: CLong, _ noticeInfo: WriteNoticeRequest, _ delegate: WriteNoticeViewController) {
        
        let url = "\(Const.URL.BASE_URL)/info/notice/\(userId)"
        
        let body: [String: Any] = [
            "title": noticeInfo.title,
            "contents": noticeInfo.contents
        ]
        
        AF.request(url,
                   method: .post,
                   parameters: body,
                   encoding: JSONEncoding.default,
                   headers: nil)
        .validate()
        .responseDecodable(of: WriteNoticeResponse.self) { (response) in
            switch response.result {
            case .success(let response):
                if response.success {
                    //delegate.didSuccessAddNotice(response.data)
                } else {
                    //delegate.failedToRequestAddAlarm("실패")
                }
                print("🔥\(response)")
            case .failure(let error):
                print("🔥\(error)")
            }
        }
        
    }
}
