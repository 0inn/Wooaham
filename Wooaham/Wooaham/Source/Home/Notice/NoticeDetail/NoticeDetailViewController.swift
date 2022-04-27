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
    var noticeId: CLong?

    @IBOutlet weak var noticeContentLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getNoticeDetailAPI()
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
}
