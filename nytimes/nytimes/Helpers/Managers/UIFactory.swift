//
//  UIFactory.swift
//  nytimes
//
//  Created by iOS Weeteam on 3/11/20.
//  Copyright © 2020 Dmytro Doroshchuk. All rights reserved.
//

import UIKit

struct UIFactory {
    
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
