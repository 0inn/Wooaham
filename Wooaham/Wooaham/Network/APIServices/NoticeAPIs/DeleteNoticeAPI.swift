//
//  DeleteNoticeAPI.swift
//  Wooaham
//
//  Created by 김영인 on 2022/04/28.
//

import Alamofire

class DeleteNoticeAPI {
    
    func deleteNotice(_ noticeId: CLong) {
        print(noticeId)
        
        let url = "\(Const.URL.BASE_URL)/info/notice/\(noticeId)"

        AF.request(url,
                   method: .delete,
                   parameters: nil,
                   encoding: JSONEncoding.default,
                   headers: nil)
        .validate()
        .responseDecodable(of: DeleteHomeworkResponse.self) { (response) in
            switch response.result {
            case .success(let response):
                print("🔥\(response)")
            case .failure(let error):
                print("🔥\(error)")
            }
        }
    }
    
}
