//
//  AddClassAPI.swift
//  Wooaham
//
//  Created by 김영인 on 2022/05/13.
//

import Alamofire

class AddClassAPI {
    
    func addClass(_ userId: CLong, _ grade: Int, _ classNum: Int, _ delegate: AddSchoolViewController) {
        
        let url = "\(Const.URL.BASE_URL)/users/\(userId)/class"
        
        let token = TokenUtils()
        guard let header = token.getAuthorizationHeader(accessToken: JWT.shared.jwt ?? "") else {
            return
        }
        
        let body: [String: Any] = [
            "grade" : grade,
            "classNum" : classNum
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
                delegate.didSuccessAddClass()
                print("🔥 \(response)")
            case .failure:
                let decoder = JSONDecoder()
                if let data = response.data, let error = try? decoder.decode(ErrorResponse.self, from: data) {
                    delegate.failedToRequestAddClass(error.message ?? "학년/ 반 등록에 실패하였습니다.")
                }
                print("❌ \(response)")
            }
        }
        
    }
}
