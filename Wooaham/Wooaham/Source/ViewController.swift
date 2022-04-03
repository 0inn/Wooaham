//
//  ViewController.swift
//  Wooaham
//
//  Created by 김영인 on 2022/04/03.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func goToNextVC(_ sender: Any) {
        let vc = UIStoryboard(name: "Login", bundle: nil).instantiateViewController(withIdentifier: "LoginViewController")
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: false)
    }
}

