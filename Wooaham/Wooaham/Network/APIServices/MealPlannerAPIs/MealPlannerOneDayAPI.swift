//
//  MealPlannerOneDayAPI.swift
//  Wooaham
//
//  Created by κΉμμΈ on 2022/05/03.
//

import Alamofire

class MealPlannerOneDayAPI{
    func getMealPlannerOneDay(_ startDay: String, _ delegate: HomeViewController) {
        let body: [String: Any] = [
            "startDay": startDay
        ]
        AF.request(URLConstant.lunchtableOneDay,
                   method: .get,
                   parameters: body,
                   encoding: URLEncoding.queryString,
                   headers: KeyChain.getAuthorizationHeader(account: Key.KeyChainKey.accessToken))
        .validate()
        .responseDecodable(of: MealPlannerResponse.self) { (response) in
            switch response.result {
            case .success(let response):
                delegate.didSuccessMealPlannerOneDay(response.mealServiceDietInfo[1].row[0])
                print("π₯\(response)")
            case .failure(let error):
                delegate.didFailMealPlannerOneDay()
                print("π₯\(error)")
            }
        }
    }
}
