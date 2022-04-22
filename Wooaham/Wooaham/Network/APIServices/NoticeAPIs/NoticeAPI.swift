//
//  NoticeAPI.swift
//  Wooaham
//
//  Created by 김영인 on 2022/04/15.
//

import Alamofire

class NoticeAPI{
    
    func getNotice(_ classCode: String, _ delegate: NoticeViewController) {
        
        let url = "\(Const.URL.BASE_URL)/info/notice/"
        
        let params: [String: String] = [
            "classCode": classCode
        ]
        
        AF.request(url,
                   method: .get,
                   parameters: params,
                   encoding: URLEncoding.default,
                   headers: nil)
        .validate()
        .responseDecodable(of: NoticeResponse.self) { (response) in
            switch response.result {
            case .success(let response):
                if response.success {
                    delegate.didSuccessNotice(response.data)
                } else {
                    //delegate.failedToRequestAlarm("실패")
                }
                print("🔥\(response)")
            case .failure(let error):
                print("🔥\(error)")
            }
        }
    }
    
}
