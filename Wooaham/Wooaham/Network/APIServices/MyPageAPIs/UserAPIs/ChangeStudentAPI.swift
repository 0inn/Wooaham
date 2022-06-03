//
//  ChangeStudentAPI.swift
//  Wooaham
//
//  Created by 김영인 on 2022/05/13.
//

import Alamofire

class ChangeStudentAPI {
    func changeStudent(_ studentId: CLong, _ delegate: MyPageStudentViewController) {
        let changeChild = "\(URLConstant.baseURL)/users/\(UserDefaults.standard.integer(forKey: Key.UserIdKey.key))/link/change"
        let body: [String: Any] = [
            "studentId": studentId
        ]
        AF.request(changeChild,
                   method: .put,
                   parameters: body,
                   encoding: JSONEncoding.default,
                   headers: KeyChain.getAuthorizationHeaderWithLocation(account: Key.KeyChainKey.accessToken))
        .validate()
        .response { response in
            switch response.result {
            case .success:
                delegate.didSuccessChangeStudent()
            case .failure:
                let decoder = JSONDecoder()
                if let data = response.data, let error = try? decoder.decode(ErrorResponse.self, from: data) {
                    delegate.failedToRequestChangeStudent(error.message ?? "자녀 변경에 실패하였습니다.")
                }
            }
        }
    }
}
