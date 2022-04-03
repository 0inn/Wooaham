//
//  UIViewController.swift
//  Wooaham
//
//  Created by 김영인 on 2022/04/03.
//

import UIKit

extension UIViewController {
    
    // MARK: 네비게이션 포함 화면 전환
    func presentNVC( _ vc: UIViewController) {
        vc.modalPresentationStyle = .fullScreen
        self.navigationController?.pushViewController(vc, animated: false)
    }
    
    // MARK: 그냥 화면 전환
    func presentVC( _ vc: UIViewController) {
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: false)
    }
    
    // MARK: 취소와 확인이 뜨는 UIAlertController
    func presentAlert(title: String, message: String? = nil,
                      isCancelActionIncluded: Bool = false,
                      preferredStyle style: UIAlertController.Style = .alert,
                      handler: ((UIAlertAction) -> Void)? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: style)
        let actionDone = UIAlertAction(title: "확인", style: .default, handler: handler)
        alert.addAction(actionDone)
        if isCancelActionIncluded {
            let actionCancel = UIAlertAction(title: "취소", style: .cancel, handler: nil)
            alert.addAction(actionCancel)
        }
        self.present(alert, animated: true, completion: nil)
    }
    
}
