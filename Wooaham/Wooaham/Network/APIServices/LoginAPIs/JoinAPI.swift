//
//  JoinAPI.swift
//  Wooaham
//
//  Created by κΉμμΈ on 2022/05/05.
//

import Alamofire

class JoinAPI {
    
    func postJoin(_ joinInfo: JoinRequest, _ delegate: JoinViewController) {
        
        let url = "\(Const.URL.BASE_URL)/users"
        
        let body: [String: Any] = [
            "email": joinInfo.email,
            "password": joinInfo.password,
            "birth": joinInfo.birth,
            "name": joinInfo.name,
            "role": joinInfo.role
        ]
        
        AF.request(url,
                   method: .post,
                   parameters: body,
                   encoding: JSONEncoding.default,
                   headers: nil)
        .validate()
        .response { response in
            switch response.result {
            case .success:
                print("π₯ \(response)")
                delegate.didSuccessJoin()
            case .failure:
                print("β \(response)")
                let decoder = JSONDecoder()
                if let data = response.data, let error = try? decoder.decode(ErrorResponse.self, from: data) {
                    delegate.failedToRequestJoin(error.message ?? "νμκ°μμ μ€ν¨νμμ΅λλ€.")
                }
            }
            
        }
    }
    
}
