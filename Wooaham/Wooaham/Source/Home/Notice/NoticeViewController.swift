//
//  NoticeViewController.swift
//  Wooaham
//
//  Created by 김영인 on 2022/04/07.
//

import UIKit

import SwipeCellKit
import Pageboy

class NoticeViewController: UIViewController {
    
    lazy var noticeAPI = NoticeAPI()
    var noticeList: [NoticeData]?
    
    lazy var deleteNoticeAPI = DeleteNoticeAPI()

    @IBOutlet weak var noticeCollectionView: UICollectionView!
    let NOTICE_CELL = "NoticeCollectionViewCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBar()
        setNoticeCollectionView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        getNoticeAPI()
    }
    
    private func setNavigationBar() {
        self.title = "공지 및 알림사항"
        self.navigationItem.backButtonTitle = " "
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(writeNotice(_:)))
    }
    
    @objc func writeNotice(_ sender: Any) {
        guard let vc = UIStoryboard(name: Const.Storyboard.Name.wrtieNoticeSB, bundle: nil).instantiateViewController(withIdentifier: Const.ViewController.Identifier.writeNoticeVC) as? WriteNoticeViewController else { return }
        self.presentVC(vc)
    }
}

// MARK: - 공지사항 API 연동
extension NoticeViewController {
    private func getNoticeAPI() {
        noticeAPI.getNotice("123123", self)
    }
    func didSuccessNotice(_ noticeDatum: [NoticeData]) {
        noticeList = noticeDatum
        noticeCollectionView.reloadData()
    }
}

// MARK: - 공지사항 리스트 collectionView
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
        cell.delegate = self
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

// MARK: - SwipeCellKit 적용하여 공지사항 삭제 및 수정
extension NoticeViewController: SwipeCollectionViewCellDelegate {
    func collectionView(_ collectionView: UICollectionView, editActionsForItemAt indexPath: IndexPath, for orientation: SwipeActionsOrientation) -> [SwipeAction]? {
        switch orientation {
        case .right:
            let deleteAction = SwipeAction(style: .destructive, title: "Delete") { action, indexPath in
                // 공지사항 삭제
                self.deleteNoticeAPI.deleteNotice(self.noticeList?[indexPath.row].noticeId ?? 0)
            }
            deleteAction.backgroundColor = .systemBackground
            deleteAction.textColor = .systemRed
            return [deleteAction]
        case .left:
            let editAction = SwipeAction(style: .destructive, title: "Edit") { action, indexPath in
                // 공지사항 편집
                guard let vc = UIStoryboard(name: Const.Storyboard.Name.wrtieNoticeSB, bundle: nil).instantiateViewController(withIdentifier: Const.ViewController.Identifier.writeNoticeVC) as? WriteNoticeViewController else { return }
                vc.isEdit = true
                vc.noticeId = self.noticeList?[indexPath.row].noticeId
                vc.noticeTitle = self.noticeList?[indexPath.row].title
                vc.noticeContent = self.noticeList?[indexPath.row].contents
                self.presentVC(vc)
            }
            editAction.backgroundColor = .systemBackground
            editAction.textColor = .systemBlue
            return [editAction]
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, editActionsOptionsForItemAt indexPath: IndexPath, for orientation: SwipeActionsOrientation) -> SwipeOptions {
        var options = SwipeOptions()
        options.expansionStyle = .destructive
        options.transitionStyle = .border
        return options
    }
}
