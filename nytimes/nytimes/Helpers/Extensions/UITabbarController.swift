//
//  UITabbarController.swift
//  nytimes
//
//  Created by iOS Weeteam on 3/11/20.
//  Copyright © 2020 Dmytro Doroshchuk. All rights reserved.
//

import UIKit

extension UITabBarController {
    
    func createController(viewController: UIViewController,
                          selectedImage: UIImage,
                          unselectedImage: UIImage,
                          title: String) -> UINavigationController {
        let viewController = viewController
        let navigationController = UINavigationController(rootViewController: viewController)
        navigationController.tabBarItem.selectedImage = selectedImage
        navigationController.tabBarItem.image = unselectedImage
        navigationController.tabBarItem.title = title
        return navigationController
    }
}
