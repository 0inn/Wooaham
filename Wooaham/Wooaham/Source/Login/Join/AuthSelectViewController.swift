//
//  AuthSelectViewController.swift
//  Wooaham
//
//  Created by 김영인 on 2022/04/03.
//

import UIKit

class AuthSelectViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = ""
    }
    
    @IBAction func studentBtnDidTap(_ sender: Any) {
        goToJoinVC("STUDENT")
    }
    
    @IBAction func parentBtnDidTap(_ sender: Any) {
        goToJoinVC("PARENT")
    }
    
    @IBAction func teacherBtnDidTap(_ sender: Any) {
        goToJoinVC("TEACHER")
    }
    
    private func goToJoinVC(_ auth: String) {
        guard let vc = UIStoryboard(name: Const.Storyboard.Name.joinSB, bundle: nil).instantiateViewController(withIdentifier: Const.ViewController.Identifier.joinVC) as? JoinViewController else { return }
        vc.auth = auth
        presentNVC(vc)
    }
}
