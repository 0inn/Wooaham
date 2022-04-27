//
//  NoticeViewController.swift
//  Wooaham
//
//  Created by 김영인 on 2022/04/07.
//

import UIKit

class NoticeViewController: UIViewController {
    
    lazy var noticeAPI = NoticeAPI()
    var noticeList: [NoticeData]?

    @IBOutlet weak var noticeCollectionView: UICollectionView!
    let NOTICE_CELL = "NoticeCollectionViewCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBar()
        setNoticeCollectionView()
        getNoticeAPI()
    }
    
    private func setNavigationBar() {
        self.title = "공지 및 알림사항"
        self.navigationItem.backButtonTitle = " "
    }

}

extension NoticeViewController {
    private func getNoticeAPI() {
        noticeAPI.getNotice("123123", self)
    }
    func didSuccessNotice(_ noticeDatum: [NoticeData]) {
        noticeList = noticeDatum
        noticeCollectionView.reloadData()
    }
}

extension NoticeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    private func setNoticeCollectionView() {
        noticeCollectionView.delegate = self
        noticeCollectionView.dataSource = self
        noticeCollectionView.register(UINib(nibName: NOTICE_CELL, bundle: nil), forCellWithReuseIdentifier: NOTICE_CELL)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return noticeList?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = noticeCollectionView.dequeueReusableCell(withReuseIdentifier: NOTICE_CELL, for: indexPath) as! NoticeCollectionViewCell
        cell.setNotice((noticeList?[indexPath.row])!)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let noticeId = noticeList?[indexPath.row].noticeId
        guard let vc = UIStoryboard(name: Const.Storyboard.Name.noticeDetailSB, bundle: nil).instantiateViewController(withIdentifier: Const.ViewController.Identifier.noticeDetailVC) as? NoticeDetailViewController else { return }
        vc.noticeId = noticeId
        self.presentNVC(vc)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.noticeCollectionView.frame.width - 30, height: 50)
    }
}
