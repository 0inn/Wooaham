//
//  WriteHomeworkViewController.swift
//  Wooaham
//
//  Created by 김영인 on 2022/04/27.
//

import UIKit

class WriteHomeworkViewController: UIViewController {
    
    lazy var writeHomeworkAPI = WriteHomeworkAPI()
    lazy var editHomeworkAPI = EditHomeworkAPI()
    
    var isSchoolHW: Bool?
    var hwId: CLong?
    var isEditHW: Bool?
    var content: String?
    
    @IBOutlet weak var homeworkTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTextField()
    }
    
    @IBAction func cancelHomeworkBtnDidTap(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    @IBAction func addHomeworkBtnDidTap(_ sender: Any) {
        guard let title = homeworkTextField.text?.trim, homeworkTextField.hasText else {
            self.presentAlert(title: "숙제를 입력해주세요.")
            return
        }
        
        if isEditHW ?? false {
            editHomeworkAPI.editHomework(hwId ?? 0, homeworkTextField.text ?? "")
        } else {
        let type = isSchoolHW ?? false ? "SCHOOL" : "ACADEMY"
        let writeHomeworkInput = WriteHomeworkRequest(title: title, type: type, checked: false)
        writeHomeworkAPI.postHomework(writeHomeworkInput, self)
        }
        
        self.dismiss(animated: true)
    }
    
    private func setTextField() {
        homeworkTextField.text = content ?? ""
    }
}
