//
//  MyPageStudentViewController.swift
//  Wooaham
//
//  Created by 김영인 on 2022/05/12.
//

import UIKit

class MyPageStudentViewController: UIViewController {
    
    lazy var myStudentAPI = MyStudentAPI()
    var myStudentList: [MyStudentData]?
    
    @IBOutlet weak var studentTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getStudentAPI()
        setUI()
    }
    
    private func getStudentAPI() {
        myStudentAPI.myStudent(UserId.shared.userId ?? 0, self)
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
    
}

extension MyPageStudentViewController {
    
    func didSuccessMyStudent(_ studentInfo: [MyStudentData]) {
        myStudentList = studentInfo
        studentTableView.reloadData()
    }
    
    func failedToRequestMyStudent(_ msg: String) {
        presentAlert(title: msg)
    }
    
}
