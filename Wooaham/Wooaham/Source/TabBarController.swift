//
//  TabBarController.swift
//  Wooaham
//
//  Created by 김영인 on 2022/04/05.
//

import UIKit

class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        checkAutoLogin()
        setUI()
        setTabBarController()
    }
    
    private func checkAutoLogin() {
        if KeyChain.read(account: Key.KeyChainKey.accessToken) == nil {
            setLogin()
        }
    }
    
    private func setLogin() {
        guard let loginVC = UIStoryboard(name: "Login", bundle: nil).instantiateViewController(withIdentifier: "LoginViewController") as? LoginViewController else { return }
        let loginNVC = UINavigationController(rootViewController: loginVC)
        changeRootViewController(loginNVC)
    }
    
    
    private func setUI() {
        tabBar.barTintColor = .white
        tabBar.tintColor = .mainGreen
        tabBar.unselectedItemTintColor = .lightGray
    }
    
    private func setTabBarController() {
        let homeSB = UIStoryboard.init(name: Const.Storyboard.Name.homeSB, bundle: nil)
        let alarmSB = UIStoryboard.init(name: Const.Storyboard.Name.alarmSB, bundle: nil)
        let mapSB =  UIStoryboard.init(name: Const.Storyboard.Name.mapSB, bundle: nil)
        let mypageSB = UIStoryboard.init(name: Const.Storyboard.Name.mypageSB, bundle: nil)
        
        guard let homeVC = homeSB.instantiateViewController(withIdentifier: Const.ViewController.Identifier.homeVC) as? HomeViewController,
              let alarmVC = alarmSB.instantiateViewController(withIdentifier: Const.ViewController.Identifier.alarmVC) as? AlarmViewController,
              let mapVC = mapSB.instantiateViewController(withIdentifier: Const.ViewController.Identifier.mapVC) as? MapViewController,
              let mypageVC = mypageSB.instantiateViewController(withIdentifier: Const.ViewController.Identifier.mypageVC) as? MyPageViewController
        else { return }
        
        let homeNVC = UINavigationController(rootViewController: homeVC)
        let alarmNVC = UINavigationController(rootViewController: alarmVC)
        let mapNVC = UINavigationController(rootViewController: mapVC)
        let mypageNVC = UINavigationController(rootViewController: mypageVC)
        
        homeNVC.tabBarItem = UITabBarItem(
            title: "홈",
            image: UIImage(systemName: "house"),
            selectedImage: UIImage(systemName: "house.fill")
        )
        
        if (Role.shared.role != "TEACHER") {
            alarmNVC.tabBarItem = UITabBarItem(
                title: "시간 알림",
                image: UIImage(systemName: "alarm"),
                selectedImage: UIImage(systemName: "alarm.fill")
            )
            mapNVC.tabBarItem = UITabBarItem(
                title: "지도",
                image: UIImage(systemName: "map"),
                selectedImage: UIImage(systemName: "map.fill")
            )
        }
        
        mypageNVC.tabBarItem = UITabBarItem(
            title: "마이페이지",
            image: UIImage(systemName: "person"),
            selectedImage: UIImage(systemName: "person.fill")
        )
        
        switch Role.shared.role {
        case "TEACHER":
            setViewControllers([homeNVC, mypageNVC], animated: false)
        default:
            setViewControllers([homeNVC, alarmNVC, mapNVC, mypageNVC], animated: false)
        }
        
    }
    
}
