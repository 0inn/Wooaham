//
//  NoticeDetailViewController.swift
//  Wooaham
//
//  Created by 김영인 on 2022/04/27.
//

import UIKit

class NoticeDetailViewController: UIViewController {
    
    lazy var noticeDetailAPI = NoticeDetailAPI()
    var noticeDetail: NoticeDetailData?
    
    lazy var readNoticeAPI = ReadNoticeAPI()
    var noticeId: CLong?
    
    lazy var noticeParentAPI = NoticeParentAPI()
    var parents: [String]?

    @IBOutlet weak var noticeContentLabel: UILabel!
    
    @IBOutlet weak var readersView: UIView!
    @IBOutlet weak var parentTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        connectAPI()
    }
    
    private func setUI() {
        setNavigationBar()
        setTableView()
    }
    
    private func connectAPI() {
        getNoticeDetailAPI()
        postReadNoticeAPI()
    }
    
    private func setNavigationBar() {
        let showParents = UIButton(type: .system)
        showParents.setImage(UIImage(systemName: "person.circle"), for: .normal)
        showParents.setImage(UIImage(systemName: "person.circle.fill"), for: .selected)
        showParents.addTarget(self, action: #selector(ParentsView(_:)), for: .touchUpInside)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: showParents)
    }
    
    @objc func ParentsView(_ btn: UIButton) {
        if btn.isSelected {
            readersView.isHidden = true
            btn.isSelected = false
        } else {
            getParentAPI()
            readersView.isHidden = false
            btn.isSelected = true
        }
    }
    
    private func setTableView() {
        parentTableView.delegate = self
        parentTableView.dataSource = self
        parentTableView.register(UINib(nibName: ParentsTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: ParentsTableViewCell.identifier)
        parentTableView.rowHeight = 50
    }

}

extension NoticeDetailViewController {
    private func getNoticeDetailAPI() {
        noticeDetailAPI.getNoticeDetail(noticeId ?? 0, self)
    }
    
    func didSuccessNoticeDetail(_ noticeDetailData: NoticeDetailData) {
        self.title = noticeDetailData.title
        noticeContentLabel.text = noticeDetailData.contents
    }
    
    private func postReadNoticeAPI() {
        readNoticeAPI.postReadNotice(noticeId ?? 0)
    }
    
    private func getParentAPI() {
        noticeParentAPI.getNoticeParent(noticeId ?? 0, self)
    }
    
    func didSuccessNoticeParent(_ parentsInfo: [String]) {
        parents = parentsInfo
        parentTableView.reloadData()
    }
}

extension NoticeDetailViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return parents?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ParentsTableViewCell.identifier, for: indexPath) as? ParentsTableViewCell else { return UITableViewCell() }
        
        cell.setData(parents?[indexPath.row] ?? "")
        
        return cell
    }
    
}
