//
//  MostEmailedView.swift
//  nytimes
//
//  Created by iOS Weeteam on 3/11/20.
//  Copyright © 2020 Dmytro Doroshchuk. All rights reserved.
//

import UIKit

class MostEmailedView: BaseView {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
    
    private func setupView() {
        setupTableView()
        downloadArticles(type: ArticleType.mostEmailed(days: 30))
    }
    
}
