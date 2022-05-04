//
//  JoinViewController.swift
//  Wooaham
//
//  Created by 김영인 on 2022/05/04.
//

import UIKit

class JoinViewController: UIViewController {
    
    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var birthTextField: UITextField!
    @IBOutlet weak var joinBtn: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }

    @IBAction func joinBtnDidTap(_ sender: Any) {
        guard let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "TabBarController") as? TabBarController else { return }
        changeRootViewController(vc)
    }
    
    private func setUI() {
        setLoginBtn()
        setTextField()
        navigationController?.navigationBar.topItem?.backButtonTitle = " "
    }
    
    private func setLoginBtn() {
        joinBtn.layer.cornerRadius = 5
        joinBtn.backgroundColor = .mainPink.withAlphaComponent(0.5)
    }
    
    private func setTextField() {
        [idTextField, passwordTextField, nameTextField, birthTextField].forEach {
            $0?.addTarget(self, action: #selector(editingChanged(_:)), for: .editingChanged)
        }
    }

    @objc func editingChanged(_ textField: UITextField) {
        if (idTextField.hasText && passwordTextField.hasText && nameTextField.hasText && birthTextField.hasText) {
            joinBtn.backgroundColor = .mainPink
            joinBtn.isEnabled = true
        } else {
            joinBtn.backgroundColor = .mainPink.withAlphaComponent(0.5)
            joinBtn.isEnabled = false
        }
    }

}
