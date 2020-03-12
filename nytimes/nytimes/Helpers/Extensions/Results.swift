//
//  Results.swift
//  nytimes
//
//  Created by iOS Weeteam on 3/11/20.
//  Copyright © 2020 Dmytro Doroshchuk. All rights reserved.
//

import RealmSwift

extension Results {
    
    func toArray() -> [Element] {
        return compactMap { $0 }
    }
    
}
