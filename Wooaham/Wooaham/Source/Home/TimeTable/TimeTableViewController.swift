//
//  TimeTableViewController.swift
//  Wooaham
//
//  Created by 김영인 on 2022/04/07.
//

import UIKit

class TimeTableViewController: UIViewController {

    lazy var timetableAPI = TimeTableAPI()
    var timeTable: [[TimeTableRow]]?
    var week: [[UILabel]] = [[]]
    
    @IBOutlet weak var monView: UIView!
    @IBOutlet weak var friView: UIView!
    
    @IBOutlet weak var mon1: UILabel!
    @IBOutlet weak var mon2: UILabel!
    @IBOutlet weak var mon3: UILabel!
    @IBOutlet weak var mon4: UILabel!
    @IBOutlet weak var mon5: UILabel!
    @IBOutlet weak var mon6: UILabel!
    
    @IBOutlet weak var tue1: UILabel!
    @IBOutlet weak var tue2: UILabel!
    @IBOutlet weak var tue3: UILabel!
    @IBOutlet weak var tue4: UILabel!
    @IBOutlet weak var tue5: UILabel!
    @IBOutlet weak var tue6: UILabel!
    
    @IBOutlet weak var wed1: UILabel!
    @IBOutlet weak var wed2: UILabel!
    @IBOutlet weak var wed3: UILabel!
    @IBOutlet weak var wed4: UILabel!
    @IBOutlet weak var wed5: UILabel!
    @IBOutlet weak var wed6: UILabel!
    
    @IBOutlet weak var thur1: UILabel!
    @IBOutlet weak var thur2: UILabel!
    @IBOutlet weak var thur3: UILabel!
    @IBOutlet weak var thur4: UILabel!
    @IBOutlet weak var thur5: UILabel!
    @IBOutlet weak var thur6: UILabel!
    
    @IBOutlet weak var fri1: UILabel!
    @IBOutlet weak var fri2: UILabel!
    @IBOutlet weak var fri3: UILabel!
    @IBOutlet weak var fri4: UILabel!
    @IBOutlet weak var fri5: UILabel!
    @IBOutlet weak var fri6: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setData()
        setUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        getTimeTableAPI()
    }
    
    private func setData() {
        week = [
            [mon1, mon2, mon3, mon4, mon5, mon6],
            [tue1, tue2, tue3, tue4, tue5, tue6],
            [wed1, wed2, wed3, wed4, wed5, wed6],
            [thur1, thur2, thur3, thur4, thur5, thur6],
            [fri1, fri2, fri3, fri4, fri5, fri6]
                ]
    }
    
    private func setUI() {
        setView()
        setLabel()
    }
    
    private func setView() {
        monView.roundCorners(cornerRadius: 10, maskedCorners:  [.layerMinXMinYCorner])
        friView.roundCorners(cornerRadius: 10, maskedCorners:  [.layerMaxXMinYCorner])
    }
    
    private func setLabel() {
        for i in 0...4 {
            for j in 0...5 {
                week[i][j].text = ""
                week[i][j].numberOfLines = 0
                week[i][j].font = .systemFont(ofSize: 13, weight: .regular)
            }
        }
    }
    
    private func setTimeTable() {
        for day in 0...4 {
            for time in 0...((timeTable?[day].count ?? 0) - 1) {
                week[day][time].text = timeTable?[day][time].subject
            }
        }

    }
}

// MARK: - 시간표 API 연동
extension TimeTableViewController {
    private func getTimeTableAPI() {
        timetableAPI.getTimeTable(1, self)
    }
    
    func didSuccessTimeTable(_ timeTableInfo: [[TimeTableRow]]) {
        timeTable = timeTableInfo
        let info = timeTableInfo[0][0]
        self.title = "\(info.school) \(info.grade)학년 \(info.classNum)반"
        setTimeTable()
    }
}
