//
//  DeleteHomeworkAPI.swift
//  Wooaham
//
//  Created by 김영인 on 2022/04/27.
//

import Alamofire

class DeleteHomeworkAPI {
    
    func deleteHomework(_ homeworkId: CLong) {
        
        let url = "\(Const.URL.BASE_URL)/info/hw/\(homeworkId)"
    
        AF.request(url,
                   method: .delete,
                   parameters: nil,
                   encoding: JSONEncoding.default,
                   headers: nil)
        .validate()
        .responseDecodable(of: DeleteHomeworkResponse.self) { (response) in
            switch response.result {
            case .success(let response):
                print("🔥\(response)")
            case .failure(let error):
                print("🔥\(error)")
            }
        }
    }
    
}

