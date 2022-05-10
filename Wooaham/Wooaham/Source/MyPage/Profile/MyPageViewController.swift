//
//  MyPageViewController.swift
//  Wooaham
//
//  Created by 김영인 on 2022/04/03.
//

import UIKit

class MyPageViewController: UIViewController {
    
    lazy var myPageAPI = MyPageAPI()
    var myPageInfo: MyPageData?
    var sendMyPageInfo: ((MyPageData) -> (MyPageData))?
    
    @IBOutlet weak var profileView: UIView!
    @IBOutlet weak var schoolView: UIView!
    
    @IBOutlet weak var profileImgLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getMyPageAPI()
        setGesture()
    }
    
    // 프로필 수정 페이지로 이동
    @objc func profileEdit(_ sender: Any) {
        guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "ProfileEditViewController") as? ProfileEditViewController else { return }
        vc.mypageInfo = myPageInfo
        self.presentNVC(vc)
    }
    
    // 학교 등록 페이지로 이동
    @objc func addSchool(_ sender: Any) {
        guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "AddSchoolViewController") else { return }
        self.presentNVC(vc)
    }
    
    private func setGesture() {
        setupProfile()
        setupSchool()
    }

    
}

extension MyPageViewController {
    private func setupProfile() {
        let gesture = UITapGestureRecognizer(target: self, action: #selector(profileEdit(_:)))
        self.profileView.addGestureRecognizer(gesture)
    }
    private func setupSchool() {
        let gesture = UITapGestureRecognizer(target: self, action: #selector(addSchool(_:)))
        self.schoolView.addGestureRecognizer(gesture)
    }
}

extension MyPageViewController {
    private func getMyPageAPI() {
        myPageAPI.getMyPage(UserId.shared.userId ?? 0, self)
    }
    
    func didSuccessMyPage(_ profileInfo: MyPageData) {
        myPageInfo = profileInfo
        nameLabel.text = (profileInfo.name ?? "") +  " " + setRole(profileInfo.role ?? "")
        emailLabel.text = profileInfo.email
    }
}
