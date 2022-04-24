//
//  HomeworkViewController.swift
//  Wooaham
//
//  Created by 김영인 on 2022/04/24.
//

import UIKit

class HomeworkViewController: UIViewController {
    
    var isSchoolHW: Bool?
    
    lazy var schoolHomeworkAPI = SchoolHomeworkAPI()
    lazy var academyHomeworkAPI = AcademyHomeworkAPI()
    var homeworkList: [HomeworkData]?

    @IBOutlet weak var homeworkTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        getHomeworkAPI()
    }
    
    private func setUI() {
        setTableView()
    }
    
    private func setTableView() {
        let nib = UINib(nibName: HomeworkTableViewCell.identifier, bundle: nil)
        homeworkTableView.register(nib, forCellReuseIdentifier: HomeworkTableViewCell.identifier)
        
        homeworkTableView.delegate = self
        homeworkTableView.dataSource = self
    }
    
}

extension HomeworkViewController {
    private func getHomeworkAPI() {
        isSchoolHW ?? false ? getSchoolHomeworkAPI() : getAcemdemyHomeworkAPI()
    }
    
    private func getSchoolHomeworkAPI() {
        schoolHomeworkAPI.getSchoolHomework("3", self)
    }
    
    private func getAcemdemyHomeworkAPI() {
        academyHomeworkAPI.getAcademyHomework("3", self)
    }
    
    func didSuccessHomework(_ homeworkDatum: [HomeworkData]) {
        homeworkList = homeworkDatum
        homeworkTableView.reloadData()
    }
}

extension HomeworkViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
}

extension HomeworkViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return homeworkList?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell  = tableView.dequeueReusableCell(withIdentifier: HomeworkTableViewCell.identifier, for: indexPath) as? HomeworkTableViewCell else { return UITableViewCell() }
        
        cell.setData((homeworkList?[indexPath.row])!)
        
        return cell
    }
}
