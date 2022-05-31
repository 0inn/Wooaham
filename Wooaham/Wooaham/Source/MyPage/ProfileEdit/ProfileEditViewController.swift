//
//  ProfileEditViewController.swift
//  Wooaham
//
//  Created by 김영인 on 2022/04/03.
//

import UIKit

class ProfileEditViewController: UIViewController {
    
    var quitAPI = QuitAPI()
    var mypageInfo: MyPageData?
    
    @IBOutlet weak var schoolView: UIView!
    
    @IBOutlet weak var profileImgLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var roleLabel: UILabel!
    @IBOutlet weak var schoolLabel: UILabel!
    
    @IBOutlet weak var lineView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
    
    // 학교 등록 페이지로 이동
    @objc func addSchool(_ sender: Any) {
        guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "SearchSchoolViewController") else { return }
        self.presentNVC(vc)
    }
    
    @IBAction func quitBtnDidTap(_ sender: Any) {
        let alert = UIAlertController(title: "계정탈퇴", message: "정말 탈퇴를 진행하시겠습니까?", preferredStyle: .alert)
        let actionDone = UIAlertAction(title: "확인", style: .default, handler: { action in
            self.quitAPI.quit(self)
        })
        alert.addAction(actionDone)
        self.present(alert, animated: true, completion: nil)
    }
    
    private func setUI() {
        setAuth()
        setNavigationBar()
        setSchool()
        setProfile()
    }
    
    private func setAuth() {
        if (Role.shared.role == "PARENT") {
            schoolView.isHidden = true
            lineView.isHidden = false
        }
    }
    
    private func setNavigationBar() {
        self.title = "프로필 변경"
        self.navigationItem.backButtonTitle = " "
    }
    
    private func setSchool() {
        let gesture = UITapGestureRecognizer(target: self, action: #selector(addSchool(_:)))
        self.schoolView.addGestureRecognizer(gesture)
    }
    
    private func setProfile() {
        profileImgLabel.text = setProfileIcon(mypageInfo?.role ?? "")
        nameLabel.text = mypageInfo?.name
        emailLabel.text = mypageInfo?.email
        roleLabel.text = setRole(mypageInfo?.role ?? "")
        schoolLabel.text = mypageInfo?.schoolName
    }
}

extension ProfileEditViewController {
    func didSuccessQuit() {
        presentAlert(title: "성공적으로 탈퇴되었습니다.")
        guard let vc = UIStoryboard(name: "Login", bundle: nil).instantiateViewController(withIdentifier: "LoginViewController") as? LoginViewController else { return }
        changeRootViewController(vc)
    }
    
    func failedToRequestQuit(_ msg: String) {
        presentAlert(title: msg)
    }
}
