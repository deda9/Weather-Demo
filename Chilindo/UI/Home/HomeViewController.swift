//
//  HomeViewController.swift
//  Chilindo
//
//  Created by Bassem Qoulta on 9/8/17.
//  Copyright © 2017 Bassem Qoulta. All rights reserved.
//

import UIKit
/**
 * Home view which setup the menu and the view inside it
 *
 */
class HomeViewController: MenuContainerViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let navigationMenuViewController = NavigationMenuViewController(nibName: "MenuNavigationView", bundle: nil)
        navigationMenuViewController.menuItems = getMenuItem()
        menuViewController = navigationMenuViewController as MenuViewController
        contentViewControllers = contentControllers()
        selectContentViewController(contentViewControllers.first!, title: "Current Weather")
        addMenuIconOnNavigationBar()
    }

    /**
     * return the menus item + the user profile header
     *
     */
    private func  getMenuItem() -> [MenuItem]{
        var menuItemArray = [MenuItem]()
        
        var profileHeader = ProfileHeaderMenuItem()
        profileHeader.email = UserDefaultsUtils.getUserEmail()
        profileHeader.userName = UserDefaultsUtils.getUserName()
        profileHeader.profileImageUrl = UserDefaultsUtils.getUserProfileUrl()
        profileHeader.backgroundImageUrl = UserDefaultsUtils.getUserCoverUrl()
        profileHeader.type = MenuItemType.ProfileHeader
        menuItemArray.append(profileHeader)
        
        var currentWeather = TitledMenuItem()
        currentWeather.type = MenuItemType.TitledItem
        currentWeather.title = "Current Weather"
        currentWeather.iconImageViewName  = "CurrentWeather"
        menuItemArray.append(currentWeather)
        
        var forecast = TitledMenuItem()
        forecast.type = MenuItemType.TitledItem
        forecast.title = "Forecast"
        forecast.iconImageViewName = "Forecast"
        menuItemArray.append(forecast)
        
        return menuItemArray
    }
    
    /**
     * return all the controllers will be on the menus
     *
     */
    private func contentControllers() -> [UIViewController] {
        var contentList = [UIViewController]()
        contentList.append(CurrentWeatherViewController(nibName: "BaseWeatherView", bundle: nil))
        contentList.append(ForecastTabsViewController(nibName: "ForecastView", bundle: nil))
        return contentList
    }
}
