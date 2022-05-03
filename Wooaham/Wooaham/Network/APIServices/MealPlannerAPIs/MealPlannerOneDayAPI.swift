//
//  MealPlannerOneDayAPI.swift
//  Wooaham
//
//  Created by 김영인 on 2022/05/03.
//

import Alamofire

class MealPlannerOneDayAPI{
    
    func getMealPlannerOneDay(_ userId: CLong, _ startDay: String, _ delegate: HomeViewController) {
        
        let url = "\(Const.URL.BASE_URL)/info/lunchtable/one-day/\(userId)"
        
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
                delegate.didSuccessMealPlannerOneDay(response.mealServiceDietInfo[1].row[0])
                print("🔥\(response)")
            case .failure(let error):
                delegate.didFailMealPlannerOneDay()
                print("🔥\(error)")
            }
        }
    }
    
}
