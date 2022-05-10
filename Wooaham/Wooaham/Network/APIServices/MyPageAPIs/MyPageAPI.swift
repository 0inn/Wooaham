//
//  MyPageAPI.swift
//  Wooaham
//
//  Created by 김영인 on 2022/05/08.
//

import Alamofire

class MyPageAPI {
    
    func getMyPage(_ userId: CLong, _ delegate: MyPageViewController) {
        URLCache.shared.removeAllCachedResponses()
        
        let url = "\(Const.URL.BASE_URL)/users/\(userId)"
        
        let token = TokenUtils()
        guard let header = token.getAuthorizationHeader(accessToken: JWT.shared.jwt ?? "") else {
            return
        }
        
        AF.request(url,
                   method: .get,
                   parameters: nil,
                   encoding: JSONEncoding.default,
                   headers: header)
        .validate()
        .responseDecodable(of: MyPageResponse.self) { (response) in
            switch response.result {
            case .success(let response):
                if response.success ?? false {
                    guard let myPageInfo = response.data else { return }
                    delegate.didSuccessMyPage(myPageInfo)
                }
                print("🔥\(response)")
            case .failure(let error):
                print("🔥\(error)")
            }
        }
    }
    
}
