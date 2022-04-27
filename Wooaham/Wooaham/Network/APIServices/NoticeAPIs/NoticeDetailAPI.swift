//
//  NoticeDetailAPI.swift
//  Wooaham
//
//  Created by 김영인 on 2022/04/27.
//

import Alamofire

class NoticeDetailAPI{
    
    func getNoticeDetail(_ noticeId: CLong, _ delegate: NoticeDetailViewController) {
        
        let url = "\(Const.URL.BASE_URL)/info/notice/\(noticeId)"
        
        AF.request(url,
                   method: .get,
                   parameters: nil,
                   encoding: URLEncoding.default,
                   headers: nil)
        .validate()
        .responseDecodable(of: NoticeDetailResponse.self) { (response) in
            switch response.result {
            case .success(let response):
                if response.success {
                    delegate.didSuccessNoticeDetail(response.data)
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

