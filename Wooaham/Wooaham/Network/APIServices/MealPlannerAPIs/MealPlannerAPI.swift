//
//  MealPlannerAPI.swift
//  Wooaham
//
//  Created by κΉμμΈ on 2022/04/29.
//

import Alamofire

class MealPlannerAPI{
    func getMealPlanner(_ startDay: String, _ delegate: MealPlannerViewController) {
        let body: [String: Any] = [
            "startDay": startDay
        ]
        AF.request(URLConstant.lunchtable,
                   method: .get,
                   parameters: body,
                   encoding: URLEncoding.queryString,
                   headers: KeyChain.getAuthorizationHeader(account: Key.KeyChainKey.accessToken))
        .validate()
        .responseDecodable(of: MealPlannerResponse.self) { (response) in
            switch response.result {
            case .success(let response):
                delegate.didSuccessMealPlanner(response.mealServiceDietInfo[1].row)
                print("π₯\(response)")
            case .failure(let error):
                print("π₯\(error)")
            }
        }
    }
}
