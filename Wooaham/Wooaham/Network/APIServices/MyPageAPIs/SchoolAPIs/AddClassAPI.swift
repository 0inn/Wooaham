//
//  AddClassAPI.swift
//  Wooaham
//
//  Created by κΉμμΈ on 2022/05/13.
//

import Alamofire

class AddClassAPI {
    func addClass(_ grade: Int, _ classNum: Int, _ delegate: AddSchoolViewController) {
        let addClass = "\(URLConstant.baseURL)/users/\(UserDefaults.standard.integer(forKey: Key.UserIdKey.key))/class"
        let body: [String: Any] = [
            "grade" : grade,
            "classNum" : classNum
        ]
        AF.request(addClass,
                   method: .put,
                   parameters: body,
                   encoding: JSONEncoding.default,
                   headers: KeyChain.getAuthorizationHeaderWithLocation(account: Key.KeyChainKey.accessToken))
        .validate()
        .response { response in
            switch response.result {
            case .success:
                delegate.didSuccessAddClass()
                print("π₯ \(response)")
            case .failure:
                let decoder = JSONDecoder()
                if let data = response.data, let error = try? decoder.decode(ErrorResponse.self, from: data) {
                    delegate.failedToRequestAddClass(error.message ?? "νλ/ λ° λ±λ‘μ μ€ν¨νμμ΅λλ€.")
                }
                print("β \(response)")
            }
        }
    }
}
