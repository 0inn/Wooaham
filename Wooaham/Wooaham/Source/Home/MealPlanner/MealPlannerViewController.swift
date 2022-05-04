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
    var weekdays: [UILabel]?
    var startDay: String!
    var endDay: String!
    
    @IBOutlet weak var leftBtn: UIButton!
    @IBOutlet weak var rightBtn: UIButton!
    @IBOutlet weak var todayLabel: UILabel!
    
    @IBOutlet weak var mon: UILabel!
    @IBOutlet weak var tue: UILabel!
    @IBOutlet weak var wed: UILabel!
    @IBOutlet weak var thur: UILabel!
    @IBOutlet weak var fri: UILabel!
    
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
        getTodayMealAPI()
    }
    
    @IBAction func lastweekBtnDidTap(_ sender: Any) {
        getMealPlannerAPI(startDay)
    }
    
    @IBAction func nextweekBtnDidTap(_ sender: Any) {
        getMealPlannerAPI(startDay)
    }
    
    // MARK: - 오늘 날짜 보내서 급식표 호출
    private func getTodayMealAPI() {
        getMealPlannerAPI(getToday())
        todayLabel.text = getTodayTitle()
    }
    
    private func setUI() {
        setHidden()
        setLabel()
        setData()
    }
    
    private func setHidden() {
        leftBtn.isHidden = true
        rightBtn.isHidden = true
        tabBarController?.tabBar.isHidden = true
    }
    
    private func setLabel() {
        allergyLabel.text = "요리명에 표시된 번호는 알레르기를 유발할수 있는 식재료입니다.\n (1.난류, 2.우유, 3.메밀, 4.땅콩, 5.대두, 6.밀, 7.고등어, 8.게, 9.새우, 10.돼지고기, 11.복숭아, 12.토마토, 13.아황산염, 14.호두, 15.닭고기, 16.쇠고기, 17.오징어, 18.조개류(굴,전복,홍합 등)"
    }
    
    private func setData() {
        foodLabels = [monFood, tueFood, wedFood, thurFood, friFood]
        weekdays = [mon, tue, wed, thur, fri]
    }

}

extension MealPlannerViewController {
    func getMealPlannerAPI(_ start: String) {
        mealPlannerAPI.getMealPlanner(1, start, self)
    }
    func didSuccessMealPlanner(_ mealInfo: [MealPlannerRow]) {
        mealPlannerList = mealInfo
        self.title = mealPlannerList?[0].SCHUL_NM
        for day in 0 ... (mealInfo.count - 1) {
            foodLabels?[day].text = mealPlannerList?[day].DDISH_NM
            let month = mealPlannerList?[day].MLSV_YMD.subString(from: 4, to: 5)
            let date = mealPlannerList?[day].MLSV_YMD.subString(from: 6, to: 7)
            weekdays?[day].text = "(\(month ?? "")/\(date ?? ""))"
        }
    }
}

