//
//  MainTabBarViewController.swift
//  GymCompanion
//
//  Created by Fernando Brito on 29/08/23.
//

import UIKit

class MainTabBarViewController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()

        tabBar.tintColor = UIColor(named: "Charcoal")

        // My Routines
        let vc1 = UINavigationController(rootViewController: MyRoutinesViewController())
        vc1.tabBarItem.title = K.MyRoutines.title
        vc1.tabBarItem.image = UIImage(systemName: "list.bullet.clipboard")

        // Explore
        let vc2 = UINavigationController(rootViewController: ExploreViewController())
        vc2.tabBarItem.title = K.Explore.title
        vc2.tabBarItem.image = UIImage(systemName: "magnifyingglass")

        // Settings
        let vc3 = UINavigationController(rootViewController: SettingsViewController())
        vc3.tabBarItem.title = K.Settings.title
        vc3.tabBarItem.image = UIImage(systemName: "slider.horizontal.3")

        setViewControllers([vc1, vc2, vc3], animated: true)
    }
}
