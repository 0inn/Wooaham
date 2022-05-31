//
//  MyPageStudentViewController.swift
//  Wooaham
//
//  Created by 김영인 on 2022/05/12.
//

import UIKit

class MyPageStudentViewController: UIViewController {
    
    lazy var myStudentAPI = MyStudentAPI()
    lazy var changeStudentAPI = ChangeStudentAPI()

    var myStudentList: [MyStudentData]?
    
    @IBOutlet weak var studentTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getStudentAPI()
        setUI()
    }
    
    private func getStudentAPI() {
        myStudentAPI.myStudent(self)
    }
    
    private func setUI() {
        self.title = "나의 자녀 목록"
        setTableView()
    }
    
    private func setTableView() {
        studentTableView.delegate = self
        studentTableView.dataSource = self
        studentTableView.register(UINib(nibName: MyStudentTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: MyStudentTableViewCell.identifier)
        studentTableView.rowHeight = 60
    }
    
}

extension MyPageStudentViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myStudentList?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MyStudentTableViewCell.identifier, for: indexPath) as? MyStudentTableViewCell else { return UITableViewCell() }
        cell.setData(myStudentList?[indexPath.row].name ?? "")
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        changeStudentAPI.changeStudent(myStudentList?[indexPath.row].studentId ?? 0, self)
    }
}

extension MyPageStudentViewController {
    
    // 나의 자녀 목록 조회 API 결과
    func didSuccessMyStudent(_ studentInfo: [MyStudentData]) {
        myStudentList = studentInfo
        studentTableView.reloadData()
    }
    
    func failedToRequestMyStudent(_ msg: String) {
        presentAlert(title: msg)
    }
    
    // 나의 자녀 변경 API 결과
    func didSuccessChangeStudent() {
        presentAlert(title: "자녀 변경에 성공하였습니다.")
    }
    
    func failedToRequestChangeStudent(_ msg: String) {
        presentAlert(title: msg)
    }


}
