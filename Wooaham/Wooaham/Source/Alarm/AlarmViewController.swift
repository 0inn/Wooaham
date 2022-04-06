//
//  AlarmViewController.swift
//  Wooaham
//
//  Created by 김영인 on 2022/04/05.
//

import UIKit

class AlarmViewController: UIViewController {

    @IBOutlet weak var alarmTableView: UITableView!
    let ALARM_CELL = "AlarmTableViewCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAlarmTableView()
        setupNavigationBar()
    }
}

extension AlarmViewController {
    private func setupNavigationBar() {
        // 네비게이션 바에 알람 추가 버튼
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addAlarm(_:)))
    }
    
    // 알람 추가 페이지로 이동
    @objc func addAlarm(_ sender: Any) {
        guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "AddAlarmViewController") else { return }
        self.present(vc, animated: true)
    }
}

extension AlarmViewController: UITableViewDelegate, UITableViewDataSource {
    private func setupAlarmTableView() {
        alarmTableView.delegate = self
        alarmTableView.dataSource = self
        alarmTableView.register(UINib(nibName: ALARM_CELL, bundle: nil), forCellReuseIdentifier: ALARM_CELL)
        alarmTableView.rowHeight = 150
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = alarmTableView.dequeueReusableCell(withIdentifier: ALARM_CELL, for: indexPath) as? AlarmTableViewCell else { return UITableViewCell() }
        return cell
    }
    
}
