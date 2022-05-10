//
//  AddParentAPI.swift
//  Wooaham
//
//  Created by 김영인 on 2022/05/10.
//

import Alamofire

class AddParentAPI {
    
    func addParent(_ userId: CLong , _ email: String,_ delegate: AddParentViewController) {
        
        let url = "\(Const.URL.BASE_URL)/users/\(userId)/link"
        
        let token = TokenUtils()
        guard let header = token.getAuthorizationHeader(accessToken: JWT.shared.jwt ?? "") else {
            return
        }
        
        let body: [String: Any] = [
            "email": email
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
