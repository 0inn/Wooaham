//
//  AddParentAPI.swift
//  Wooaham
//
//  Created by 김영인 on 2022/05/10.
//

import Alamofire

class AddParentAPI {
    func addParent(_ email: String,_ delegate: AddParentViewController) {
        let addParent = "\(URLConstant.baseURL)/users/\(UserDefaults.standard.integer(forKey: Key.UserIdKey.key))/link"
        let body: [String: Any] = [
            "email": email
        ]
        AF.request(addParent,
                   method: .put,
                   parameters: body,
                   encoding: JSONEncoding.default,
                   headers: KeyChain.getAuthorizationHeaderWithLocation(account: Key.KeyChainKey.accessToken))
        .validate()
        .response { response in
            switch response.result {
            case .success:
                delegate.didSuccessAddParent()
            case .failure:
                let decoder = JSONDecoder()
                if let data = response.data, let error = try? decoder.decode(ErrorResponse.self, from: data) {
                    delegate.failedToRequestAddParent(error.message ?? "부모등록에 실패하였습니다.")
                }
            }
            
        }
    }
    
}
