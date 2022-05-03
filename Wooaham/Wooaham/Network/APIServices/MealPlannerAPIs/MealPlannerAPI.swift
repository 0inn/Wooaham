//
//  MealPlannerAPI.swift
//  Wooaham
//
//  Created by 김영인 on 2022/04/29.
//

import Alamofire

class MealPlannerAPI{
    
    func getMealPlanner(_ userId: CLong, _ startDay: String, _ delegate: MealPlannerViewController) {
        
        let url = "\(Const.URL.BASE_URL)/info/lunchtable/\(userId)"
        
        let body: [String: Any] = [
            "startDay": startDay
        ]
        
        AF.request(url,
                   method: .get,
                   parameters: body,
                   encoding: URLEncoding.queryString,
                   headers: nil)
        .validate()
        .responseDecodable(of: MealPlannerResponse.self) { (response) in
            switch response.result {
            case .success(let response):
                delegate.didSuccessMealPlanner(response.mealServiceDietInfo[1].row)
                print("🔥\(response)")
            case .failure(let error):
                print("🔥\(error)")
            }
        }
    }
    
}
