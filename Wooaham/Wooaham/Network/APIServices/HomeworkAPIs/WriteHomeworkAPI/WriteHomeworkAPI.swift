//
//  WriteHomeworkAPI.swift
//  Wooaham
//
//  Created by 김영인 on 2022/04/27.
//

import Alamofire

class WriteHomeworkAPI {
    
    func postHomework(_ userId: CLong, _ homeworkInfo: WriteHomeworkRequest, _ delegate: WriteHomeworkViewController) {
        
        let url = "\(Const.URL.BASE_URL)/info/hw/\(userId)"
        
        let body: [String: Any] = [
            "title": homeworkInfo.title,
            "checked": homeworkInfo.checked,
            "type": homeworkInfo.type
        ]
        
        AF.request(url,
                   method: .post,
                   parameters: body,
                   encoding: JSONEncoding.default,
                   headers: nil)
        .validate()
        .responseDecodable(of: WriteHomeworkResponse.self) { (response) in
            switch response.result {
            case .success(let response):
                if response.success {
                    //delegate.didSuccessAddHomework(response.data)
                } else {
                    //delegate.failedToRequestAddHomework("실패")
                }
                print("🔥\(response)")
            case .failure(let error):
                print("🔥\(error)")
            }
        }
        
    }
}
