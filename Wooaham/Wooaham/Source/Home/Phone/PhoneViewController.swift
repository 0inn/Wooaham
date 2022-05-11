//
//  PhoneViewController.swift
//  Wooaham
//
//  Created by 김영인 on 2022/05/10.
//

import UIKit

class PhoneViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }

    @IBAction func timeLimitBtnDidTap(_ sender: Any) {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "AddPhoneViewController") else { return }
        presentVC(vc)
    }
    
    private func setUI() {
        self.title = "휴대폰 사용시간"
    }
}
