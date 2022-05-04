//
//  LoginViewController.swift
//  Wooaham
//
//  Created by 김영인 on 2022/05/04.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        resetTextField()
    }
    
    // MARK: - 가입하기 버튼 클릭
    @IBAction func joinBtnDidTap(_ sender: Any) {
        guard let vc = UIStoryboard(name: Const.Storyboard.Name.joinSB, bundle: nil).instantiateViewController(withIdentifier: Const.ViewController.Identifier.authSelectVC) as? AuthSelectViewController else { return }
        presentNVC(vc)
    }
    
    // MARK: - 로그인 버튼 클릭
    @IBAction func loginBtnDidTap(_ sender: Any) {
    }

    private func setUI() {
        setButton()
        setTextField()
    }
    
    private func resetTextField() {
        [nameTextField, passwordTextField].forEach {
            $0?.text?.removeAll()
        }
    }
    
    private func setButton() {
        setLoginBtn()
    }
    
    private func setLoginBtn() {
        loginBtn.layer.cornerRadius = 5
        loginBtn.backgroundColor = .mainPink.withAlphaComponent(0.5)
    }
    
    private func setTextField() {
        nameTextField.clearButtonMode = .whileEditing
        [nameTextField, passwordTextField].forEach {
            $0?.addTarget(self, action: #selector(editingChanged(_:)), for: .editingChanged)
        }
    }
    
    @objc func editingChanged(_ textField: UITextField) {
        if (nameTextField.hasText && passwordTextField.hasText) {
            loginBtn.backgroundColor = .mainPink
            loginBtn.isEnabled = true
        } else {
            loginBtn.backgroundColor = .mainPink.withAlphaComponent(0.5)
            loginBtn.isEnabled = false
        }
    }
    
}
