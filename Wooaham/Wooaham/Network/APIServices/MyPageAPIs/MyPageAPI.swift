//
//  MyPageAPI.swift
//  Wooaham
//
//  Created by κΉμμΈ on 2022/05/08.
//

import Alamofire

class MyPageAPI {
    func getMyPage(_ delegate: MyPageViewController) {
        let mypage = "\(URLConstant.baseURL)/users/\(UserDefaults.standard.integer(forKey: Key.UserIdKey.key))"
        AF.request(mypage,
                   method: .get,
                   parameters: nil,
                   encoding: JSONEncoding.default,
                   headers: KeyChain.getAuthorizationHeaderWithLocation(account: Key.KeyChainKey.accessToken))
        .validate()
        .responseDecodable(of: MyPageResponse.self) { (response) in
            switch response.result {
            case .success(let response):
                if response.success ?? false {
                    guard let myPageInfo = response.data else { return }
                    delegate.didSuccessMyPage(myPageInfo)
                }
                print("π₯\(response)")
            case .failure(let error):
                print("π₯\(error)")
            }
        }
    }
}
