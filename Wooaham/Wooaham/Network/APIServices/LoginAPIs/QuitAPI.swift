//
//  QuitAPI.swift
//  Wooaham
//
//  Created by 김영인 on 2022/05/10.
//

import Alamofire

class QuitAPI {
    
    func quit(_ userId: CLong , _ delegate: ProfileEditViewController) {
        
        let url = "\(Const.URL.BASE_URL)/users/\(userId)"
        
        let token = TokenUtils()
        guard let header = token.getAuthorizationHeader(accessToken: JWT.shared.jwt ?? "") else {
            return
        }

        AF.request(url,
                   method: .put,
                   parameters: nil,
                   encoding: JSONEncoding.default,
                   headers: header)
        .validate()
        .response { response in
            switch response.result {
            case .success:
                delegate.didSuccessQuit()
            case .failure:
                let decoder = JSONDecoder()
                if let data = response.data, let error = try? decoder.decode(ErrorResponse.self, from: data) {
                    delegate.failedToRequestQuit(error.message ?? "계정탈퇴에 실패하였습니다.")
                }
            }
            
        }
    }
    
}
