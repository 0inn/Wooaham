//
//  ProfileEditViewController.swift
//  Wooaham
//
//  Created by 김영인 on 2022/04/03.
//

import UIKit

class ProfileEditViewController: UIViewController {

    @IBOutlet weak var schoolView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "프로필 변경"
        setupSchool()
    }
    
    // 학교 등록 페이지로 이동
    @objc func addSchool(_ sender: Any) {
        guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "AddSchoolViewController") else { return }
        self.presentNVC(vc)
    }

}

extension ProfileEditViewController {
    private func setupSchool() {
        let gesture = UITapGestureRecognizer(target: self, action: #selector(addSchool(_:)))
        self.schoolView.addGestureRecognizer(gesture)
    }
}
