//
//  TabViewController.swift
//  Weather_MVVM.UIKit
//
//  Created by Igor on 21.10.2023.
//

import UIKit

private enum tabBarConstants {
    static let weather = "Weather Geo"
    static let cities = "Weather in Cities"
    static let iconWeather = "cloud.sun"
    static let iconCity = "globe"
}

final class TabViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setTabBar()
    }
    
    private func setTabBar() {
        let tab1 = WeatherViewController()
        tab1.title = tabBarConstants.weather
        
        let tab2 = CityListViewController()
        tab2.title = tabBarConstants.cities
        
        let nav1 = UINavigationController(rootViewController: tab1)
        let nav2 = UINavigationController(rootViewController: tab2)
        
        nav1.tabBarItem = UITabBarItem(
            title: tabBarConstants.weather,
            image: UIImage(systemName: tabBarConstants.iconWeather),
            tag: 1
        )
        nav2.tabBarItem = UITabBarItem(
            title: tabBarConstants.cities,
            image: UIImage(systemName: tabBarConstants.iconCity),
            tag: 2)
        
        setViewControllers(
            [nav1, nav2],
            animated: true
        )
    }
}
