//
//  TabBarController.swift
//  Moony Journey
//
//  Created by Ravil on 20.09.2023.
//

import UIKit

final class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setupTabBar()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    // MARK: - setupTabBar
    
    private func setupTabBar() {
        let gameVC =         UINavigationController(rootViewController: GamesViewController())
        let dictionaryVC = UINavigationController(rootViewController: DictionaryViewController())
        let menuVC = UINavigationController(rootViewController: MenuViewController())
        
        self.tabBar.layer.cornerRadius = 24
        self.tabBar.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        self.tabBar.isTranslucent = true
        
        tabBar.backgroundColor = UIColor(named: "tabbarCust")

        gameVC.tabBarItem = UITabBarItem(
            title: "Games", image: UIImage(named: "tab1"),
            selectedImage: UIImage(named: "tab1Active")
        )
                
        dictionaryVC.tabBarItem = UITabBarItem(
            title: "Dictionary", image: UIImage(named: "tab2"),
            selectedImage: UIImage(named: "tab2Active")
        )
        
        menuVC.tabBarItem = UITabBarItem(
            title: "Menu", image: UIImage(named: "tab3"),
            selectedImage: UIImage(named: "tab3Active")
        )
            
        viewControllers = [gameVC, dictionaryVC, menuVC]
    }
}
