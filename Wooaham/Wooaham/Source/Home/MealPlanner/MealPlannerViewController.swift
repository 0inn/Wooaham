//
//  MealPlannerViewController.swift
//  Wooaham
//
//  Created by 김영인 on 2022/04/07.
//

import UIKit

class MealPlannerViewController: UIViewController {
    
    lazy var mealPlannerAPI = MealPlannerAPI()

    override func viewDidLoad() {
        super.viewDidLoad()
        getMealPlannerAPI()
    }
}

extension MealPlannerViewController {
    private func getMealPlannerAPI() {
        mealPlannerAPI.getMealPlanner(MealPlannerRequest(sidoCode: "S10", schoolCode: "9111025", startDay: "20220425", endDay: "20220429"))
    }
}
