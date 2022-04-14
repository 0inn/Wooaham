//
//  AlarmViewController.swift
//  Wooaham
//
//  Created by 김영인 on 2022/04/05.
//

import UIKit

class AlarmViewController: UIViewController {
    
    lazy var alarmDataManager = AlarmDataManager()
    var alarmList: [AlarmData]?
    @IBOutlet weak var alarmTableView: UITableView!
    let ALARM_CELL = "AlarmTableViewCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getAlarmAPI()
        setAlarmTableView()
        setNavigationBar()
        setRefresh()
    }
}

extension AlarmViewController {
    private func getAlarmAPI() {
        alarmDataManager.getAlarm(self)
    }
    func didSuccessAlarm(_ alarmDatum: [AlarmData]) {
        alarmList = alarmDatum
        alarmTableView.reloadData()
    }
}

extension AlarmViewController {
    
    // MARK: 네비게이션바
    private func setNavigationBar() {
        // 네비게이션 바에 알람 추가 버튼
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addAlarm(_:)))
    }
    
    // 알람 추가 페이지로 이동
    @objc func addAlarm(_ sender: Any) {
        guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "AddAlarmViewController") else { return }
        self.present(vc, animated: true)
    }
    
    // MARK: 새로고침
    private func setRefresh() {
        let refresh = UIRefreshControl()
        refresh.addTarget(self, action: #selector(updateUI(refresh:)), for: .valueChanged)
        refresh.tintColor = .lightGray
        alarmTableView.addSubview(refresh)
    }
    
    @objc func updateUI(refresh: UIRefreshControl) {
        refresh.endRefreshing() // 종료
        alarmTableView.reloadData()  // 테이블 뷰 로드
    }
    
}

// MARK: 알람 전체 목록
extension AlarmViewController: UITableViewDelegate, UITableViewDataSource {
    
    private func setAlarmTableView() {
        alarmTableView.delegate = self
        alarmTableView.dataSource = self
        alarmTableView.register(UINib(nibName: ALARM_CELL, bundle: nil), forCellReuseIdentifier: ALARM_CELL)
        alarmTableView.rowHeight = 150
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return alarmList?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = alarmTableView.dequeueReusableCell(withIdentifier: ALARM_CELL, for: indexPath) as? AlarmTableViewCell else { return UITableViewCell() }
        cell.setAlarmData((alarmList?[indexPath.row])!)
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            alarmList?.remove(at: indexPath.row)
            alarmTableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "AddAlarmViewController") else { return }
        // 데이터 날려야 됨
        self.present(vc, animated: true)
    }
    
}
