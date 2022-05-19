//
//  MealPlannerAPI.swift
//  Wooaham
//
//  Created by 김영인 on 2022/04/29.
//

import Alamofire

class MealPlannerAPI{
    
    func getMealPlanner(_ startDay: String, _ delegate: MealPlannerViewController) {
        
        let url = "\(Const.URL.BASE_URL)/info/lunchtable"
        
        let token = TokenUtils()
        guard let header = token.getAuthorizationHeader(accessToken: JWT.shared.jwt ?? "") else {
            return
        }
        
        let body: [String: Any] = [
            "startDay": startDay
        ]
        
        AF.request(url,
                   method: .get,
                   parameters: body,
                   encoding: URLEncoding.queryString,
                   headers: header)
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
