//
//  WriteHomeworkAPI.swift
//  Wooaham
//
//  Created by 김영인 on 2022/04/27.
//

import Alamofire

class WriteHomeworkAPI {
    func postHomework(_ homeworkInfo: WriteHomeworkRequest, _ delegate: WriteHomeworkViewController) {
        let body: [String: Any] = [
            "title": homeworkInfo.title,
            "checked": homeworkInfo.checked,
            "type": homeworkInfo.type
        ]
        
        AF.request(URLConstant.writeHW,
                   method: .post,
                   parameters: body,
                   encoding: JSONEncoding.default,
                   headers: KeyChain.getAuthorizationHeader(account: Key.KeyChainKey.accessToken))
        .validate()
        .responseDecodable(of: WriteHomeworkResponse.self) { (response) in
            switch response.result {
            case .success(let response):
                print("🔥\(response)")
            case .failure(let error):
                print("🔥\(error)")
            }
        }
    }
}
