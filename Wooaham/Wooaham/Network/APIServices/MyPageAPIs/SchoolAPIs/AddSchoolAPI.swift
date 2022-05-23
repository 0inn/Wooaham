//
//  AddSchoolAPI.swift
//  Wooaham
//
//  Created by 김영인 on 2022/05/13.
//

import Alamofire

class AddSchoolAPI {
    
    func addSchool(_ userId: CLong, _ schoolInfo: SchoolData, _ delegate: SearchSchoolViewController) {
        
        let url = "\(Const.URL.BASE_URL)/users/\(userId)/school"
        
        let token = TokenUtils()
        guard let header = token.getAuthorizationHeader(accessToken: JWT.shared.jwt ?? "") else {
            return
        }
        
        let body: [String: Any] = [
            "officeCode" : schoolInfo.officeCode ?? "",
            "schoolName" : schoolInfo.schoolName ?? "",
            "schoolCode" : schoolInfo.schoolCode ?? ""
        ]
        
        AF.request(url,
                   method: .put,
                   parameters: body,
                   encoding: JSONEncoding.default,
                   headers: header)
        .validate()
        .response { response in
            switch response.result {
            case .success:
                delegate.didSuccessAddSchool()
                print("🔥 \(response)")
            case .failure:
                let decoder = JSONDecoder()
                if let data = response.data, let error = try? decoder.decode(ErrorResponse.self, from: data) {
                    delegate.failedToRequestAddSchool(error.message ?? "학교 등록에 실패하였습니다.")
                }
                print("❌ \(response)")
            }
        }
        
    }
}
