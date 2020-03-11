//
//  UIFactory.swift
//  nytimes
//
//  Created by iOS Weeteam on 3/11/20.
//  Copyright © 2020 Dmytro Doroshchuk. All rights reserved.
//

import UIKit

struct UIFactory {
    
    static func button(title: String = "Button",
                       alpha: CGFloat = Constants.Dimensions.opaque,
                       backgroundColor: UIColor = .white) -> UIButton {
        let view = UIButton()
        view.alpha = alpha
        view.backgroundColor = backgroundColor
        view.setTitleColor(.black, for: .normal)
        view.setTitle(title, for: .normal)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }
    
    struct TableView {
        static func tableView() -> UITableView {
            let view = UITableView()
            view.translatesAutoresizingMaskIntoConstraints = false
            view.showsVerticalScrollIndicator = false
            view.separatorStyle = .singleLine
            view.tableFooterView = UIView()
            view.backgroundColor = .clear
            return view
        }
    }
}
