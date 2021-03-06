//
//  EditNoticeAPI.swift
//  Wooaham
//
//  Created by κΉμμΈ on 2022/04/28.
//

import Alamofire

class EditNoticeAPI {
    
    func editNotice(_ noticeId: CLong, _ noticeInfo: WriteNoticeRequest) {
        
        let url = "\(Const.URL.BASE_URL)/info/notice/\(noticeId)"
        
        let body: [String: Any] = [
            "title": noticeInfo.title,
            "contents": noticeInfo.contents
        ]
        
        AF.request(url,
                   method: .put,
                   parameters: body,
                   encoding: JSONEncoding.default,
                   headers: nil)
        .validate()
        .responseDecodable(of: EditNoticeResponse.self) { (response) in
            switch response.result {
            case .success(let response):
                print("π₯\(response)")
            case .failure(let error):
                print("π₯\(error)")
            }
        }
    }
}
