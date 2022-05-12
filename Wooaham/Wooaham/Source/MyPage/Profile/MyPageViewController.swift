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
    @IBOutlet weak var parentView: UIView!
    @IBOutlet weak var studentView: UIView!
    
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
        guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "SearchSchoolViewController") else { return }
        self.presentNVC(vc)
    }
    
    // 부모님 등록 페이지로 이동
    @objc func addParent(_ sender: Any) {
        guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "AddParentViewController") else { return }
        self.presentVC(vc)
    }
    
    // 나의 자녀 페이지로 이동
    @objc func myStudent(_ sender: Any) {
        guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "MyPageStudentViewController") else { return }
        self.presentNVC(vc)
    }

    
    private func setGesture() {
        setProfile()
        setSchool()
        setParent()
        setStudent()
    }

    
}

extension MyPageViewController {
    private func setProfile() {
        let gesture = UITapGestureRecognizer(target: self, action: #selector(profileEdit(_:)))
        self.profileView.addGestureRecognizer(gesture)
    }
    private func setSchool() {
        let gesture = UITapGestureRecognizer(target: self, action: #selector(addSchool(_:)))
        self.schoolView.addGestureRecognizer(gesture)
    }
    private func setParent() {
        let gesture = UITapGestureRecognizer(target: self, action: #selector(addParent(_:)))
        self.parentView.addGestureRecognizer(gesture)
    }
    private func setStudent() {
        let gesture = UITapGestureRecognizer(target: self, action: #selector(myStudent(_:)))
        self.studentView.addGestureRecognizer(gesture)
    }

}

extension MyPageViewController {
    private func getMyPageAPI() {
        myPageAPI.getMyPage(UserId.shared.userId ?? 0, self)
    }
    
    func didSuccessMyPage(_ profileInfo: MyPageData) {
        myPageInfo = profileInfo
        profileImgLabel.text = setProfileIcon(profileInfo.role ?? "")
        nameLabel.text = (profileInfo.name ?? "") +  " " + setRole(profileInfo.role ?? "")
        emailLabel.text = profileInfo.email
    }
}
