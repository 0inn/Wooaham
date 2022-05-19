//
//  SchoolHomeworkAPI.swift
//  Wooaham
//
//  Created by 김영인 on 2022/04/24.
//

import Alamofire

class SchoolHomeworkAPI{
    
    func getSchoolHomework(_ delegate: HomeworkViewController) {
        
        let url = "\(Const.URL.BASE_URL)/info/hw/school/"
        
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
        .responseDecodable(of: HomeworkResponse.self) { (response) in
            switch response.result {
            case .success(let response):
                if response.success {
                    delegate.didSuccessHomework(response.data)
                }
                print("🔥\(response)")
            case .failure(let error):
                print("🔥\(error)")
            }
        }
    }
    
}
