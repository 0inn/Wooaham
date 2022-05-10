//
//  AddParentViewController.swift
//  Wooaham
//
//  Created by 김영인 on 2022/05/10.
//

import UIKit

class AddParentViewController: UIViewController {
    
    lazy var addParentAPI = AddParentAPI()

    @IBOutlet weak var parentEmailTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func dismissBtnDidTap(_ sender: Any) {
        dismiss(animated: true)
    }
    
    @IBAction func addParentBtnDidTap(_ sender: Any) {
        print("hi")
        addParentAPI.addParent(UserId.shared.userId ?? 0, parentEmailTextField.text ?? "", self)
    }
}

extension AddParentViewController {
    func didSuccessAddParent() {
        dismissAlert(title: "부모등록이 완료되었습니다.")
    }
    
    func failedToRequestAddParent(_ msg: String) {
        presentAlert(title: msg)
    }
}
