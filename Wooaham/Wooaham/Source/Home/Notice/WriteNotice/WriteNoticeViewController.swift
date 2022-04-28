//
//  WriteNoticeViewController.swift
//  Wooaham
//
//  Created by 김영인 on 2022/04/27.
//

import UIKit

class WriteNoticeViewController: UIViewController {
    
    lazy var writeNoticeAPI = WriteNoticeAPI()
    lazy var editNoticeAPI = EditNoticeAPI()
    
    var noticeId: CLong?
    var isEdit: Bool?
    var noticeTitle: String?
    var noticeContent: String?
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var contentTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTextField()
    }
    
    private func setTextField() {
        titleTextField.text = noticeTitle ?? ""
        contentTextView.text = noticeContent ?? ""
    }
    
    @IBAction func cancelNoticeBtnDidTap(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    @IBAction func addNoticeBtnDidTap(_ sender: Any) {
        guard let title = titleTextField.text?.trim, titleTextField.hasText else {
            self.presentAlert(title: "제목을 입력해주세요.")
            return
        }
        
        guard let content = contentTextView.text?.trim, contentTextView.hasText else {
            self.presentAlert(title: "내용을 입력해주세요")
            return
        }
        
        let writeNoticeInput = WriteNoticeRequest(title: title, contents: content)
        
        if isEdit ?? false {
            editNoticeAPI.editNotice(noticeId ?? 0, writeNoticeInput)
        } else {
            writeNoticeAPI.postNotice(1, writeNoticeInput, self)
        }
        
        self.dismiss(animated: true)
    }
}
