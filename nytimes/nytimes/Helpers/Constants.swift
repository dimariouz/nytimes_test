//
//  Constants.swift
//  nytimes
//
//  Created by iOS Weeteam on 3/11/20.
//  Copyright © 2020 Dmytro Doroshchuk. All rights reserved.
//

import UIKit

enum ArticleType {
    case mostEmailed(days: Int)
    case mostShared(days: Int)
    case mostViewed(days: Int)
    
    var url: String {
        switch self {
        case .mostEmailed(let days):
            return Constants.Api.host + Constants.Api.path + "emailed/\(days).json"
        case .mostShared(let days):
            return Constants.Api.host + Constants.Api.path + "emailed/\(days).json"
        case .mostViewed(let days):
            return Constants.Api.host + Constants.Api.path + "emailed/\(days).json"
        }
    }
}

struct Constants {
    
    struct Api {
        static let apiKey = "qCenlUuluvIGr3G6UJ3jqmKskqhpitaQ"
        static let host = "https://api.nytimes.com/"
        static let path = "svc/mostpopular/v2/"
    }

}
