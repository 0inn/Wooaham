//
//  UITabBarController.swift
//  Wooaham
//
//  Created by 김영인 on 2022/04/05.
//

import UIKit

extension UITabBarController {
    
    // MARK: 탭바 위에 선
    func setupTabBarLine() {
        self.tabBar.barTintColor = .systemBackground
        self.tabBar.layer.borderWidth = 0.2
        self.tabBar.layer.borderColor = UIColor.lightGray.cgColor
    }
    
}
