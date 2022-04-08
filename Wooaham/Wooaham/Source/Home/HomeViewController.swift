//
//  HomeViewController.swift
//  Wooaham
//
//  Created by 김영인 on 2022/04/07.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var mealCollectionView: UICollectionView!
    @IBOutlet weak var timeTableCollectionView: UICollectionView!
    
    @IBOutlet weak var schoolHW: UIView!
    @IBOutlet weak var instHW: UIView!
    
    let MEAL_CELL = "MealPlannerCollectionViewCell"
    let TIME_CELL = "TimeTableCollectionViewCell"

    override func viewDidLoad() {
        super.viewDidLoad()
        setCollectionViews()
        setViews()
    }
    
    @IBAction func noticeBtnClick(_ sender: Any) {
        guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "NoticeViewController") as? NoticeViewController else { return }
        self.presentNVC(vc)
    }
    
    @IBAction func mealBtnClick(_ sender: Any) {
        guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "MealPlannerViewController") as? MealPlannerViewController else { return }
        self.presentNVC(vc)
    }
    
    @IBAction func timetableBtnClick(_ sender: Any) {
        guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "TimeTableViewController") as? TimeTableViewController else { return }
        self.presentNVC(vc)
    }
    
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    private func setCollectionViews() {
        mealCollectionView.delegate = self
        mealCollectionView.dataSource = self
        mealCollectionView.register(UINib(nibName: MEAL_CELL, bundle: nil), forCellWithReuseIdentifier: MEAL_CELL)
        
        timeTableCollectionView.delegate = self
        timeTableCollectionView.dataSource = self
        timeTableCollectionView.register(UINib(nibName: TIME_CELL, bundle: nil), forCellWithReuseIdentifier: TIME_CELL)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
        case mealCollectionView:
            return 5
        case timeTableCollectionView:
            return 7
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView {
        case mealCollectionView:
            guard let cell = mealCollectionView.dequeueReusableCell(withReuseIdentifier: MEAL_CELL, for: indexPath) as? MealPlannerCollectionViewCell else { return UICollectionViewCell()}
            return cell
        case timeTableCollectionView:
            guard let cell = timeTableCollectionView.dequeueReusableCell(withReuseIdentifier: TIME_CELL, for: indexPath) as? TimeTableCollectionViewCell else { return UICollectionViewCell()}
            return cell
        default:
            return UICollectionViewCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch collectionView {
        case mealCollectionView:
            return CGSize(width: 180, height: self.mealCollectionView.frame.height)
        case timeTableCollectionView:
            return CGSize(width: 75, height: self.timeTableCollectionView.frame.height)
        default:
            return CGSize(width: 0, height: 0)
        }
    }
    
}

extension HomeViewController {
    private func setViews() {
        schoolHW.roundCorners(cornerRadius: 10, maskedCorners: [.layerMinXMinYCorner, .layerMaxXMinYCorner])
        instHW.roundCorners(cornerRadius: 10, maskedCorners: [.layerMinXMinYCorner, .layerMaxXMinYCorner])
    }
}
