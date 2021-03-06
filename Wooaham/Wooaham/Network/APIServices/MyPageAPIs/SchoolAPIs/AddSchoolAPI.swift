//
//  AddSchoolAPI.swift
//  Wooaham
//
//  Created by κΉμμΈ on 2022/05/13.
//

import Alamofire

class AddSchoolAPI {
    func addSchool(_ schoolInfo: SchoolData, _ delegate: SearchSchoolViewController) {
        let addSchool = "\(URLConstant.baseURL)/users/\(UserDefaults.standard.integer(forKey: Key.UserIdKey.key))/school"
        let body: [String: Any] = [
            "officeCode" : schoolInfo.officeCode ?? "",
            "schoolName" : schoolInfo.schoolName ?? "",
            "schoolCode" : schoolInfo.schoolCode ?? ""
        ]
        AF.request(addSchool,
                   method: .put,
                   parameters: body,
                   encoding: JSONEncoding.default,
                   headers: KeyChain.getAuthorizationHeaderWithLocation(account: Key.KeyChainKey.accessToken))
        .validate()
        .response { response in
            switch response.result {
            case .success:
                delegate.didSuccessAddSchool()
                print("π₯ \(response)")
            case .failure:
                let decoder = JSONDecoder()
                if let data = response.data, let error = try? decoder.decode(ErrorResponse.self, from: data) {
                    delegate.failedToRequestAddSchool(error.message ?? "νκ΅ λ±λ‘μ μ€ν¨νμμ΅λλ€.")
                }
                print("β \(response)")
            }
        }
    }
}
