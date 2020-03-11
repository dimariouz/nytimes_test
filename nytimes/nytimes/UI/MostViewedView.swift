//
//  MostViewedView.swift
//  nytimes
//
//  Created by iOS Weeteam on 3/11/20.
//  Copyright © 2020 Dmytro Doroshchuk. All rights reserved.
//

import UIKit

class MostViewedView: BaseView {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
    
    private func setupView() {
        setupTableView()
        downloadArticles(type: ArticleType.mostViewed(days: 30))
        setupButton() {
            self.downloadArticles(type: ArticleType.mostViewed(days: 30))
        }
    }

}
