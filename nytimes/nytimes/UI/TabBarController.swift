//
//  TabBarController.swift
//  nytimes
//
//  Created by iOS Weeteam on 3/11/20.
//  Copyright © 2020 Dmytro Doroshchuk. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupController()
    }
    
    private func setupController() {
        let mostEmailedVC = createController(viewController: MostEmailedView(),
                                             selectedImage: UIImage(named: "emailed"),
                                             unselectedImage: UIImage(named: "emailed-us"),
                                             title: "Most Emailed")
        let mostSharedVC = createController(viewController: MostSharedView(),
                                            selectedImage: UIImage(named: "shared"),
                                            unselectedImage: UIImage(named: "shared-us"),
                                            title: "Most Shared")
        let mostViewedVC = createController(viewController: MostViewedView(),
                                            selectedImage: UIImage(named: "viewed"),
                                            unselectedImage: UIImage(named: "viewed-us"),
                                            title: "Most Viewed")
        let favoritesVC = createController(viewController: FavoritesView(),
                                           selectedImage: UIImage(named: "star"),
                                           unselectedImage: UIImage(named: "star-us"),
                                           title: "Favorites")
        
        viewControllers = [mostEmailedVC, mostSharedVC, mostViewedVC, favoritesVC]
        tabBar.tintColor = .black
    }
    
}
