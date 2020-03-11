//
//  ViewModel.swift
//  nytimes
//
//  Created by iOS Weeteam on 3/11/20.
//  Copyright © 2020 Dmytro Doroshchuk. All rights reserved.
//

import UIKit

class ViewModel {
    
    private let networkService: NetworkServiceProtocol = NetworkService()
    
    private var items: Items?
    
    var articleList: [Article] {
        return items?.results ?? []
    }
    
    func getArticles(type: ArticleType,
                     completion: @escaping (Result<Bool, String>) -> Void) {
        networkService.getArticles(url: type.url) { result in
            switch result {
            case .success(let list):
                self.items = list
                completion(.success(true))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
}
