//
//  StoredProperty.swift
//  PickledSwift
//
//  Created by Michael Isasi on 7/13/19.
//  Copyright © 2019 Pickled Games. All rights reserved.
//

import Foundation
enum StoredProperty: String {
    case numLogins
    case isAdFree
    
    func get<T>() -> T? {
        return UserDefaults.standard.value(forKey: self.rawValue) as? T
    }
    
    func set<T>( value: T) {
        UserDefaults.standard.set(value, forKey: self.rawValue)
    }
}

extension StoredProperty {
    
    /// Checks if the app should send a user review, also increases login count
    static var shouldRequestReview: Bool {
        let numLogins = (StoredProperty.numLogins.get() ?? 0)
        StoredProperty.numLogins.set(value: numLogins + 1)
        return numLogins == 2 || ( numLogins > 0 && numLogins % 5 == 0)
    }
}
