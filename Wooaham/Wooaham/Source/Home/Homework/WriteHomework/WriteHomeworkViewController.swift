//
//  WriteHomeworkViewController.swift
//  Wooaham
//
//  Created by 김영인 on 2022/04/27.
//

import UIKit

class WriteHomeworkViewController: UIViewController {
    
    lazy var writeHomeworkAPI = WriteHomeworkAPI()
    var isSchoolHW: Bool?
    
    @IBOutlet weak var homeworkTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func cancelHomeworkBtnDidTap(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    @IBAction func addHomeworkBtnDidTap(_ sender: Any) {
        guard let title = homeworkTextField.text?.trim, homeworkTextField.hasText else {
            self.presentAlert(title: "숙제를 입력해주세요.")
            return
        }
        
        let type = isSchoolHW ?? false ? "SCHOOL" : "ACADEMY"
        let writeHomeworkInput = WriteHomeworkRequest(title: title, type: type, checked: false)
        writeHomeworkAPI.postHomework(3, writeHomeworkInput, self)
        self.dismiss(animated: true)
    }
}
