//
//  ChangeStudentAPI.swift
//  Wooaham
//
//  Created by 김영인 on 2022/05/13.
//

import Alamofire

class ChangeStudentAPI {
    
    func changeStudent(_ userId: CLong, _ studentId: CLong, _ delegate: MyPageStudentViewController) {
        
        let url = "\(Const.URL.BASE_URL)/users/\(userId)/link/change"
        
        let token = TokenUtils()
        guard let header = token.getAuthorizationHeader(accessToken: JWT.shared.jwt ?? "") else {
            return
        }
        
        let body: [String: Any] = [
            "studentId": studentId
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
