//
//  MealPlannerViewController.swift
//  Wooaham
//
//  Created by 김영인 on 2022/04/07.
//

import UIKit

class MealPlannerViewController: UIViewController {
    
    lazy var mealPlannerAPI = MealPlannerAPI()
    var mealPlannerList: [MealPlannerRow]?
    var foodLabels: [UILabel]?
    var startDay: String!
    var endDay: String!
    
    @IBOutlet weak var monFood: UILabel!
    @IBOutlet weak var tueFood: UILabel!
    @IBOutlet weak var wedFood: UILabel!
    @IBOutlet weak var thurFood: UILabel!
    @IBOutlet weak var friFood: UILabel!
    
    @IBOutlet weak var allergyLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        startDay = "20220425"
        endDay = "20220429"
        getMealPlannerAPI(startDay, endDay)
    }
    
    @IBAction func lastweekBtnDidTap(_ sender: Any) {
        startDay = "\((Int(startDay) ?? 0) - 7)"
        endDay = "\(Int(endDay) ?? 0 - 7)"
        getMealPlannerAPI(startDay, endDay)
    }
    
    @IBAction func nextweekBtnDidTap(_ sender: Any) {
        startDay = "\((Int(startDay) ?? 0) + 7)"
        endDay = "\(Int(endDay) ?? 0 + 7)"
        getMealPlannerAPI(startDay, endDay)

    }
    
    private func setUI() {
        tabBarController?.tabBar.isHidden = true
        allergyLabel.text = "요리명에 표시된 번호는 알레르기를 유발할수 있는 식재료입니다.\n (1.난류, 2.우유, 3.메밀, 4.땅콩, 5.대두, 6.밀, 7.고등어, 8.게, 9.새우, 10.돼지고기, 11.복숭아, 12.토마토, 13.아황산염, 14.호두, 15.닭고기, 16.쇠고기, 17.오징어, 18.조개류(굴,전복,홍합 등)"
    }
    
    private func setData() {
        foodLabels = [monFood, tueFood, wedFood, thurFood, friFood]
    }

}

extension MealPlannerViewController {
    func getMealPlannerAPI(_ start: String, _ end: String) {
        mealPlannerAPI.getMealPlanner(1, MealPlannerRequest(startDay: start, endDay: end), self)
    }
    func didSuccessMealPlanner(_ mealInfo: [MealPlannerRow]) {
        mealPlannerList = mealInfo
        self.title = mealPlannerList?[0].SCHUL_NM
        for day in 0 ... 4 {
            foodLabels?[day].text = mealPlannerList?[day].DDISH_NM
        }
    }
}

