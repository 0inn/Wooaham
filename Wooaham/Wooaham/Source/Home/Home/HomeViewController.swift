//
//  HomeViewController.swift
//  Wooaham
//
//  Created by 김영인 on 2022/04/07.
//

import UIKit

class HomeViewController: UIViewController {
    
    lazy var mealPlannerOneDayAPI = MealPlannerOneDayAPI()
    
    @IBOutlet weak var mealTopView: UIView!
    @IBOutlet weak var mealBelowView: UIView!
    
    @IBOutlet weak var mealPlannerDateLabel: UILabel!
    @IBOutlet weak var mealPlannerFood: UITextView!
    
    @IBOutlet weak var timeTableCollectionView: UICollectionView!
    
    @IBOutlet weak var schoolHomeworkView: UIView!
    @IBOutlet weak var academyHomeworkView: UIView!
    
    let TIME_CELL = "TimeTableCollectionViewCell"

    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        getMealPlannerOneDayAPI()
    }
    
    private func setUI() {
        setCollectionView()
        setView()
        setViewEvent()
    }
    
    @IBAction func noticeBtnClick(_ sender: Any) {
        guard let vc = UIStoryboard(name: "Notice", bundle: nil).instantiateViewController(withIdentifier: "NoticeViewController") as? NoticeViewController else { return }
        self.presentNVC(vc)
    }
    
    @IBAction func mealBtnClick(_ sender: Any) {
        guard let vc = UIStoryboard(name: "MealPlanner", bundle: nil).instantiateViewController(withIdentifier: "MealPlannerViewController") as? MealPlannerViewController else { return }
        self.presentNVC(vc)
    }
    
    @IBAction func timetableBtnClick(_ sender: Any) {
        guard let vc = UIStoryboard(name: "TimeTable", bundle: nil).instantiateViewController(withIdentifier: "TimeTableViewController") as? TimeTableViewController else { return }
        self.presentNVC(vc)
    }
    
    @objc func schoolHomeworkVC(_ sender: Any) {
        guard let vc = UIStoryboard(name: Const.Storyboard.Name.homeworkSB, bundle: nil).instantiateViewController(withIdentifier: Const.ViewController.Identifier.homeworkVC) as? HomeworkViewController else { return }
        vc.isSchoolHW = true
        self.presentNVC(vc)
    }
    
    @objc func academyHomeworkVC(_ sender: Any) {
        guard let vc = UIStoryboard(name: Const.Storyboard.Name.homeworkSB, bundle: nil).instantiateViewController(withIdentifier: Const.ViewController.Identifier.homeworkVC) as? HomeworkViewController else { return }
        vc.isSchoolHW = false
        self.presentNVC(vc)
    }
    
}

// MARK: - 홈 화면 급식표 API 호출
extension HomeViewController {
    private func getMealPlannerOneDayAPI() {
        mealPlannerDateLabel.text = getTodaymmdd()
        mealPlannerOneDayAPI.getMealPlannerOneDay(1, getToday(), self)
    }
    
    func didSuccessMealPlannerOneDay(_ mealInfo: MealPlannerRow) {
        mealPlannerFood.text = mealInfo.DDISH_NM
    }
    
    func didFailMealPlannerOneDay() {
        mealPlannerFood.text = "오늘은 급식이 없습니다. 😢"
    }
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    private func setCollectionView() {
        timeTableCollectionView.delegate = self
        timeTableCollectionView.dataSource = self
        timeTableCollectionView.register(UINib(nibName: TIME_CELL, bundle: nil), forCellWithReuseIdentifier: TIME_CELL)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
        case timeTableCollectionView:
            return 7
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView {
        case timeTableCollectionView:
            guard let cell = timeTableCollectionView.dequeueReusableCell(withReuseIdentifier: TIME_CELL, for: indexPath) as? TimeTableCollectionViewCell else { return UICollectionViewCell()}
            return cell
        default:
            return UICollectionViewCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch collectionView {
        case timeTableCollectionView:
            return CGSize(width: 70, height: self.timeTableCollectionView.frame.height)
        default:
            return CGSize(width: 0, height: 0)
        }
    }
    
}

extension HomeViewController {
    private func setView() {
        mealTopView.roundCorners(cornerRadius: 10, maskedCorners: [.layerMinXMinYCorner, .layerMaxXMinYCorner])
        mealBelowView.roundCorners(cornerRadius: 10, maskedCorners: [.layerMinXMaxYCorner, .layerMaxXMaxYCorner])
        schoolHomeworkView.roundCorners(cornerRadius: 10, maskedCorners: [.layerMinXMinYCorner, .layerMaxXMinYCorner])
        academyHomeworkView.roundCorners(cornerRadius: 10, maskedCorners: [.layerMinXMinYCorner, .layerMaxXMinYCorner])
    }
    private func setViewEvent() {
        let schoolGesture = UITapGestureRecognizer(target: self, action: #selector(schoolHomeworkVC(_:)))
        schoolHomeworkView.addGestureRecognizer(schoolGesture)
        let academyGesture = UITapGestureRecognizer(target: self, action: #selector(academyHomeworkVC(_:)))
        academyHomeworkView.addGestureRecognizer(academyGesture)
    }
}
