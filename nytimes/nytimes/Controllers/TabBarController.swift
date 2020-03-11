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
        let mostEmailedVC = createController(viewController: MostEmailedView(), selectedImage: UIImage(named: "emailed") ?? UIImage(), unselectedImage: UIImage(named: "emailed-us") ?? UIImage(), title: "Most Emailed")
        let mostSharedVC = createController(viewController: MostSharedView(), selectedImage: UIImage(named: "shared") ?? UIImage(), unselectedImage: UIImage(named: "shared-us") ?? UIImage(), title: "Most Shared")
        let mostViewedVC = createController(viewController: MostViewedView(), selectedImage: UIImage(named: "viewed") ?? UIImage(), unselectedImage: UIImage(named: "viewed-us") ?? UIImage(), title: "Most Viewed")
        let favoritesVC = createController(viewController: FavoritesView(), selectedImage: UIImage(named: "star") ?? UIImage(), unselectedImage: UIImage(named: "star-us") ?? UIImage(), title: "Favorites")
        
        viewControllers = [mostEmailedVC, mostSharedVC, mostViewedVC, favoritesVC]
        tabBar.tintColor = .black
    }
}
