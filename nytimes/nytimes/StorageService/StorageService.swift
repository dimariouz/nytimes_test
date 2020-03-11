//
//  StorageService.swift
//  nytimes
//
//  Created by iOS Weeteam on 3/11/20.
//  Copyright © 2020 Dmytro Doroshchuk. All rights reserved.
//

import UIKit
import RealmSwift

protocol StorageServiceProtocol: class {
    func addToFavotite(article: Article)
    func readFavorites(completion: @escaping (Results<Favorites>?) -> Void)
}

class StorageService: StorageServiceProtocol {
    
    private let realm = try? Realm()
    
    func addToFavotite(article: Article) {
        let favoriteItem = Favorites()
        favoriteItem.title = article.title
        favoriteItem.url = article.url
        try? self.realm?.write {
            self.realm?.add(favoriteItem, update: .all)
        }
    }
    
    func readFavorites(completion: @escaping (Results<Favorites>?) -> Void) {
        completion(realm?.objects(Favorites.self))
    }
    
}
