//
//  AddSchoolViewController.swift
//  Wooaham
//
//  Created by 김영인 on 2022/04/04.
//

import UIKit

class AddSchoolViewController: UIViewController {
    
    lazy var addClassAPI = AddClassAPI()
    
    @IBOutlet weak var gradeTextField: UITextField!
    @IBOutlet weak var classTextField: UITextField!
    
    @IBOutlet weak var addBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
    
    private func setUI() {
        setButton()
        setTextField()
    }
    
    private func setButton() {
        addBtn.layer.cornerRadius = 5
        addBtn.backgroundColor = .mainGreen.withAlphaComponent(0.5)
    }

    
    private func setTextField() {
        [gradeTextField, classTextField].forEach {
            $0?.delegate = self
            $0?.addTarget(self, action: #selector(editingChanged(_:)), for: .editingChanged)
        }
    }
    
    @objc func editingChanged(_ textField: UITextField) {
        if (gradeTextField.hasText && classTextField.hasText) {
            addBtn.backgroundColor = .mainGreen
            addBtn.isEnabled = true
        } else {
            addBtn.backgroundColor = .mainGreen.withAlphaComponent(0.5)
            addBtn.isEnabled = false
        }
    }
    
    @IBAction func addBtnDidTap(_ sender: Any) {
        guard let grade = Int(gradeTextField.text ?? "error"),
              let classNum = Int(classTextField.text ?? "error")
        else { return }
        addClassAPI.addClass(grade, classNum, self)
    }
    
    
}

extension AddSchoolViewController {
    
    func didSuccessAddClass() {
        guard let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "TabBarController") as? TabBarController else { return }
        changeRootViewController(vc)
    }
    
    func failedToRequestAddClass(_ msg: String) {
        presentAlert(title: msg)
    }
    
}
