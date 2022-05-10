//
//  ProfileEditViewController.swift
//  Wooaham
//
//  Created by 김영인 on 2022/04/03.
//

import UIKit

class ProfileEditViewController: UIViewController {
    
    var mypageInfo: MyPageData?
    
    @IBOutlet weak var schoolView: UIView!
    
    @IBOutlet weak var profileImgLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var roleLabel: UILabel!
    @IBOutlet weak var schoolLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
    
    // 학교 등록 페이지로 이동
    @objc func addSchool(_ sender: Any) {
        guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "SearchSchoolViewController") else { return }
        self.presentNVC(vc)
    }
    
    private func setUI() {
        setNavigationBar()
        setSchool()
        setProfile()
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
    }
}
