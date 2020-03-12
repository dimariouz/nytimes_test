//
//  ViewModel.swift
//  nytimes
//
//  Created by iOS Weeteam on 3/11/20.
//  Copyright © 2020 Dmytro Doroshchuk. All rights reserved.
//

import UIKit
import RealmSwift

class ViewModel {
    
    private let networkService: NetworkServiceProtocol = NetworkService()
    private let storageService: StorageServiceProtocol = StorageService()
    
    private var items: Items?
    private var favorites: Results<Favorites>?
    
    var articleList: [Article] {
        return items?.results ?? []
    }
    
    var favoritesList: [Favorites] {
        return favorites?.toArray() ?? []
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
    
    func addToFavorite(article: Article) {
        storageService.addToFavotite(article: article)
    }
    
    func readFavorites(completion: @escaping (Results<Favorites>?) -> Void) {
        storageService.readFavorites { favorites in
            self.favorites = favorites
            completion(favorites)
        }
    }
    
    func removeFavorites(article: Favorites, completion: @escaping () -> Void) {
        storageService.removeFavotite(article: article)
        completion()
    }
    
}
