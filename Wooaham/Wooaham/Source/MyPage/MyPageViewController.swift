//
//  MyPageViewController.swift
//  Wooaham
//
//  Created by 김영인 on 2022/04/03.
//

import UIKit

class MyPageViewController: UIViewController {
    
    @IBOutlet weak var profileView: UIView!
    @IBOutlet weak var schoolView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupProfile()
        setupSchool()
    }
    
    // 프로필 수정 페이지로 이동
    @objc func profileEdit(_ sender: Any) {
        guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "ProfileEditViewController") else { return }
        self.presentNVC(vc)
    }
    
    // 학교 등록 페이지로 이동
    @objc func addSchool(_ sender: Any) {
        guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "AddSchoolViewController") else { return }
        self.presentNVC(vc)
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
