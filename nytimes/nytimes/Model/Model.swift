//
//  Model.swift
//  nytimes
//
//  Created by iOS Weeteam on 3/11/20.
//  Copyright © 2020 Dmytro Doroshchuk. All rights reserved.
//

import UIKit
import RealmSwift

struct Items: Codable {
    let results: [Article]
}

struct Article: Codable {
    let url: String
    let title: String
}

class Favorites: Object {
    @objc dynamic var title = ""
    @objc dynamic var url = ""

    override static func primaryKey() -> String? { return "title" }
}

