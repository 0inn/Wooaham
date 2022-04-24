//
//  AcademyHomeworkAPI.swift
//  Wooaham
//
//  Created by 김영인 on 2022/04/24.
//

import Alamofire

class AcademyHomeworkAPI{
    
    func getAcademyHomework(_ userId: String, _ delegate: HomeworkViewController) {
        
        let url = "\(Const.URL.BASE_URL)/info/hw/academy/"
        
        let params: [String: String] = [
            "userId": userId
        ]
        
        AF.request(url,
                   method: .get,
                   parameters: params,
                   encoding: URLEncoding.default,
                   headers: nil)
        .validate()
        .responseDecodable(of: HomeworkResponse.self) { (response) in
            switch response.result {
            case .success(let response):
                if response.success {
                    delegate.didSuccessHomework(response.data)
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
