//
//  MyStudentAPI.swift
//  Wooaham
//
//  Created by 김영인 on 2022/05/13.
//

import Alamofire

class MyStudentAPI {
    
    func myStudent(_ userId: CLong, _ delegate: MyPageStudentViewController) {
        
        let url = "\(Const.URL.BASE_URL)/users/\(userId)/children"
        
        let token = TokenUtils()
        guard let header = token.getAuthorizationHeader(accessToken: JWT.shared.jwt ?? "") else {
            return
        }
        
        AF.request(url,
                   method: .get,
                   parameters: nil,
                   encoding: URLEncoding.default,
                   headers: header)
        .validate()
        .responseDecodable(of: MyStudentResponse.self) { response in
            switch response.result {
            case .success(let response):
                delegate.didSuccessMyStudent(response.data)
            case .failure:
                let decoder = JSONDecoder()
                if let data = response.data, let error = try? decoder.decode(ErrorResponse.self, from: data) {
                    delegate.failedToRequestMyStudent(error.message ?? "자녀 조회에 실패하였습니다.")
                }
            }
            
        }
    }
    
}
