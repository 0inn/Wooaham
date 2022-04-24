//
//  SchoolHomeworkAPI.swift
//  Wooaham
//
//  Created by 김영인 on 2022/04/24.
//

import Alamofire

class SchoolHomeworkAPI{
    
    func getSchoolHomework(_ userId: String, _ delegate: SchoolHomeworkViewController) {
        
        let url = "\(Const.URL.BASE_URL)/info/hw/school/"
        
        let params: [String: String] = [
            "userId": userId
        ]
        
        AF.request(url,
                   method: .get,
                   parameters: params,
                   encoding: URLEncoding.default,
                   headers: nil)
        .validate()
        .responseDecodable(of: SchoolHomeworkResponse.self) { (response) in
            switch response.result {
            case .success(let response):
                if response.success {
                    delegate.didSuccessSchoolHomework(response.data)
                } else {
                    //delegate.failedToRequestAlarm("실패")
                }
                print("🔥\(response)")
            case .failure(let error):
                print("🔥\(error)")
            }
        }
    }
    
}
