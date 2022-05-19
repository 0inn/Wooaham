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
    
    lazy var deleteHomeworkAPI = DeleteHomeworkAPI()
    lazy var homeworkCheckAPI = HomeworkCheckAPI()
    
    @IBOutlet weak var homeworkTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        getHomeworkAPI()
    }
    
    private func setUI() {
        setNavigationBar()
        setTableView()
        setRefresh()
    }
    
    private func setNavigationBar() {
        self.title = isSchoolHW ?? false ? "학교 숙제" : "학원 숙제"
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addHomework(_:)))
    }
    
    @objc func addHomework(_ sender: Any) {
        guard let vc = UIStoryboard(name: Const.Storyboard.Name.writeHomeworkSB, bundle: nil).instantiateViewController(withIdentifier: Const.ViewController.Identifier.writeHomeworkVC) as? WriteHomeworkViewController else { return }
        vc.isSchoolHW = isSchoolHW
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true)
    }
    
    private func setTableView() {
        let nib = UINib(nibName: HomeworkTableViewCell.identifier, bundle: nil)
        homeworkTableView.register(nib, forCellReuseIdentifier: HomeworkTableViewCell.identifier)
        
        let smallNib = UINib(nibName: SmallHomeworkTableViewCell.identifier, bundle: nil)
        homeworkTableView.register(smallNib, forCellReuseIdentifier: SmallHomeworkTableViewCell.identifier)
        
        homeworkTableView.delegate = self
        homeworkTableView.dataSource = self
        
        homeworkTableView.rowHeight = UITableView.automaticDimension
        homeworkTableView.estimatedRowHeight = 50
    }
    
}

extension HomeworkViewController {
    private func getHomeworkAPI() {
        if (isSchoolHW ?? false || homeworkTableView.tag == 1) { getSchoolHomeworkAPI()
        } else {
            getAcemdemyHomeworkAPI()
        }
    }
    
    private func getSchoolHomeworkAPI() {
        schoolHomeworkAPI.getSchoolHomework(self)
    }
    
    private func getAcemdemyHomeworkAPI() {
        academyHomeworkAPI.getAcademyHomework(self)
    }
    
    func didSuccessHomework(_ homeworkDatum: [HomeworkData]) {
        homeworkList = homeworkDatum
        homeworkTableView.reloadData()
    }
}

extension HomeworkViewController {
    // MARK: 새로고침
    private func setRefresh() {
        let refresh = UIRefreshControl()
        refresh.addTarget(self, action: #selector(updateUI(refresh:)), for: .valueChanged)
        refresh.tintColor = .lightGray
        homeworkTableView.addSubview(refresh)
    }
    
    @objc func updateUI(refresh: UIRefreshControl) {
        refresh.endRefreshing() // 종료
        getHomeworkAPI()
    }
}

extension HomeworkViewController: UITableViewDelegate {
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        switch homeworkTableView.tag {
//        case 0:
//            return 50
//        default:
//            return 20
//        }
//    }
}

extension HomeworkViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return homeworkList?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch homeworkTableView.tag {
        case 0:
            guard let cell  = homeworkTableView.dequeueReusableCell(withIdentifier: HomeworkTableViewCell.identifier, for: indexPath) as? HomeworkTableViewCell else { return UITableViewCell() }
            cell.setData((homeworkList?[indexPath.row])!)
            cell.delegate = self
            return cell
        default:
            guard let cell  = homeworkTableView.dequeueReusableCell(withIdentifier: SmallHomeworkTableViewCell.identifier, for: indexPath) as? SmallHomeworkTableViewCell else { return UITableViewCell() }
            cell.setData((homeworkList?[indexPath.row])!)
            cell.delegate = self
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            deleteHomeworkAPI.deleteHomework(homeworkList?[indexPath.row].homeworkId ?? 0)
            homeworkList?.remove(at: indexPath.row)
            homeworkTableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let vc = UIStoryboard(name: Const.Storyboard.Name.writeHomeworkSB, bundle: nil).instantiateViewController(withIdentifier: Const.ViewController.Identifier.writeHomeworkVC) as? WriteHomeworkViewController else { return }
        vc.isEditHW = true
        vc.hwId = homeworkList?[indexPath.row].homeworkId
        vc.content = homeworkList?[indexPath.row].title
        presentVC(vc)
    }
}

extension HomeworkViewController: HomeworkDelegate {
    func checkHomework(_ homeworkId: CLong) {
        homeworkCheckAPI.postHomeworkCheck(homeworkId)
    }
}
