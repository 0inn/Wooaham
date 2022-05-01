//
//  MealPlannerAPI.swift
//  Wooaham
//
//  Created by 김영인 on 2022/04/29.
//

import Alamofire

class MealPlannerAPI{
    
    func getMealPlanner(_ info: MealPlannerRequest) {
        
        let url = "\(Const.URL.BASE_URL)/info/lunchtable"
        
        print(info)
        
        let body: [String: String] = [
            "sidoCode": info.sidoCode,
            "schoolCode": info.schoolCode,
            "startDay": info.startDay,
            "endDay": info.endDay
        ]
        
        AF.request(url,
                   method: .get,
                   parameters: body,
                   encoding: URLEncoding.default,
                   headers: nil)
        .validate()
        .responseDecodable(of: MealPlannerResponse.self) { (responseObject) -> Void in
            switch responseObject.result {
            case .success(let response):
                print("🔥\(response)")
            case .failure(let error):
                print("🔥\(error)")
            }
        }
    }
    
}
