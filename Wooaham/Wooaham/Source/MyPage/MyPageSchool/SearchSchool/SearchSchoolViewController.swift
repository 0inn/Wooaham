//
//  SearchSchoolViewController.swift
//  Wooaham
//
//  Created by 김영인 on 2022/05/08.
//

import UIKit

class SearchSchoolViewController: UIViewController {
    
    lazy var schoolAPI = SchoolAPI()
    var schoolList: [SchoolRow]?

    @IBOutlet weak var schoolTextField: UITextField!
    @IBOutlet weak var schoolTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTableView()
    }
    
    @IBAction func searchBtnDidTap(_ sender: Any) {
        let schoolText = schoolTextField.text
        schoolAPI.searchSchool(schoolText ?? "", self)
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
    
}

extension SearchSchoolViewController {
    
    func didSuccessSearchSchool(_ schoolInfo: [SchoolRow]) {
        schoolList = schoolInfo
        schoolTableView.reloadData()
    }
    
    func failedToRequestSearchSchool(_ msg: String) {
        presentAlert(title: msg)
    }
    
}
