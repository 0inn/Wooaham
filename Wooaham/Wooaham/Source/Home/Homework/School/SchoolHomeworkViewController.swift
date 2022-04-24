//
//  SchoolHomeworkViewController.swift
//  Wooaham
//
//  Created by 김영인 on 2022/04/24.
//

import UIKit

class SchoolHomeworkViewController: UIViewController {
    
    lazy var schoolHomeworkAPI = SchoolHomeworkAPI()
    var schoolhHomeworkList: [SchoolHomeworkData]?

    @IBOutlet weak var schoolHomeworkTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "학교 숙제"
        setUI()
        getSchoolHomeworkAPI()
    }
    
    private func setUI() {
        setTableView()
    }
    
    private func setTableView() {
        let nib = UINib(nibName: SchoolHomeworkTableViewCell.identifier, bundle: nil)
        schoolHomeworkTableView.register(nib, forCellReuseIdentifier: SchoolHomeworkTableViewCell.identifier)
        
        schoolHomeworkTableView.delegate = self
        schoolHomeworkTableView.dataSource = self
    }
    
}

extension SchoolHomeworkViewController {
    private func getSchoolHomeworkAPI() {
        schoolHomeworkAPI.getSchoolHomework("3", self)
    }
    func didSuccessSchoolHomework(_ schoolHomeworkDatum: [SchoolHomeworkData]) {
        schoolhHomeworkList = schoolHomeworkDatum
        schoolHomeworkTableView.reloadData()
    }
}

extension SchoolHomeworkViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
}

extension SchoolHomeworkViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return schoolhHomeworkList?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell  = tableView.dequeueReusableCell(withIdentifier: SchoolHomeworkTableViewCell.identifier, for: indexPath) as? SchoolHomeworkTableViewCell else { return UITableViewCell() }
        
        cell.setData((schoolhHomeworkList?[indexPath.row])!)
        
        return cell
    }
}
