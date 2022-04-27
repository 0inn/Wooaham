//
//  EditHomeworkAPI.swift
//  Wooaham
//
//  Created by 김영인 on 2022/04/27.
//

import Alamofire

class EditHomeworkAPI {
    
    func editHomework(_ homeworkId: CLong, _ homeworkContent: String) {

        let url = "\(Const.URL.BASE_URL)/info/hw/\(homeworkId)"
        
        let body: [String: Any] = [
            "title": homeworkContent
        ]
        
        AF.request(url,
                   method: .put,
                   parameters: body,
                   encoding: JSONEncoding.default,
                   headers: nil)
        .validate()
        .responseDecodable(of: EditHomeworkResponse.self) { (response) in
            switch response.result {
            case .success(let response):
                if response.success {
                    //delegate.didSuccessEditHomework(response.data)
                } else {
                    //delegate.failedToRequestEditHomework("실패")
                }
                print("🔥\(response)")
            case .failure(let error):
                print("🔥\(error)")
            }
        }
        
    }
}
