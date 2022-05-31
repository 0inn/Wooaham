//
//  NoticeParentAPI.swift
//  Wooaham
//
//  Created by 김영인 on 2022/05/20.
//

import Alamofire

class NoticeParentAPI{
    func getNoticeParent(_ noticeId: CLong, _ delegate: NoticeDetailViewController) {
        let url = "\(Const.URL.BASE_URL)/info/notice/\(noticeId)/reading"
        
        AF.request(url,
                   method: .get,
                   parameters: nil,
                   encoding: URLEncoding.default,
                   headers:  KeyChain.getAuthorizationHeader(account: Key.KeyChainKey.accessToken))
        .validate()
        .responseDecodable(of: NoticeParentResponse.self) { (response) in
            switch response.result {
            case .success(let response):
                if response.success {
                    delegate.didSuccessNoticeParent(response.data)
                }
                print("🔥\(response)")
            case .failure(let error):
                print("🔥\(error)")
            }
        }
    }
}
