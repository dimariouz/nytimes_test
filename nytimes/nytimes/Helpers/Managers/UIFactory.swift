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
        view.isHidden = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }
    
    static func label(text: String = "",
                      textColor: UIColor = .black,
                      backgroundColor: UIColor = .clear,
                      textAlignment: NSTextAlignment = .center,
                      adjustsFontSizeToFitWidth: Bool = true,
                      alpha: CGFloat = Constants.Dimensions.opaque,
                      font: UIFont = .systemFont(ofSize: 30),
                      numberOfLines: Int = 1) -> UILabel {
        let view = UILabel()
        view.text = text
        view.textColor = textColor
        view.backgroundColor = backgroundColor
        view.textAlignment = textAlignment
        view.adjustsFontSizeToFitWidth = adjustsFontSizeToFitWidth
        view.font = font
        view.minimumScaleFactor = 0.5
        view.numberOfLines = numberOfLines
        view.alpha = alpha
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
