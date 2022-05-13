//
//  SearchSchoolViewController.swift
//  Wooaham
//
//  Created by 김영인 on 2022/05/08.
//

import UIKit

class SearchSchoolViewController: UIViewController {
    
    lazy var schoolAPI = SchoolAPI()
    lazy var addSchoolAPI = AddSchoolAPI()
    var schoolList: [SchoolRow]?
    var schoolTitle: String?

    @IBOutlet weak var schoolTextField: UITextField!
    @IBOutlet weak var schoolTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setTableView()
    }
    
    @IBAction func searchBtnDidTap(_ sender: Any) {
        let schoolText = schoolTextField.text
        schoolAPI.searchSchool(schoolText ?? "", self)
    }
    
    private func setUI() {
        self.navigationItem.backButtonTitle = ""
    }
    
    private func setTableView() {
        schoolTableView.delegate = self
        schoolTableView.dataSource = self
        schoolTableView.register(UINib(nibName: SchoolTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: SchoolTableViewCell.identifier)
        schoolTableView.rowHeight = 50
    }
    
}

extension SearchSchoolViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return schoolList?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SchoolTableViewCell.identifier, for: indexPath) as? SchoolTableViewCell else { return UITableViewCell() }
        cell.setData(schoolList?[indexPath.row].schoolName ?? "검색 결과 없음")
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let selectedSchool = schoolList?[indexPath.row] else { return }
        addSchoolAPI.addSchool(UserId.shared.userId ?? 0, selectedSchool, self)
        schoolTitle = selectedSchool.schoolName
    }
    
}

extension SearchSchoolViewController {
    
    // 학교 조회 API 결과
    func didSuccessSearchSchool(_ schoolInfo: [SchoolRow]) {
        schoolList = schoolInfo
        schoolTableView.reloadData()
    }
    
    func failedToRequestSearchSchool(_ msg: String) {
        presentAlert(title: msg)
    }
    
    // 학교 등록 API 결과
    func didSuccessAddSchool() {
        guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "AddSchoolViewController") as? AddSchoolViewController else { return }
        vc.title = schoolTitle
        presentNVC(vc)
    }
    
    func failedToRequestAddSchool(_ msg: String) {
        presentAlert(title: msg)
    }
    
}
