//
//  MyPageAPI.swift
//  Wooaham
//
//  Created by 김영인 on 2022/05/08.
//

import Alamofire

class MyPageAPI {
    func getMyPage(_ delegate: MyPageViewController) {
        AF.request(URLConstant.mypage,
                   method: .get,
                   parameters: nil,
                   encoding: JSONEncoding.default,
                   headers: APIConstant.header)
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
