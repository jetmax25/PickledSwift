//
//  StoredProperty.swift
//  PickledSwift
//
//  Created by Michael Isasi on 7/13/19.
//  Copyright © 2019 Pickled Games. All rights reserved.
//

import Foundation
enum StoredProperty: String {
    case login
    
    
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
        let logins = (StoredProperty.login.get() ?? 0)
        StoredProperty.login.set(value: logins + 1)
        return logins == 2 || ( logins > 0 && logins % 5 == 0)
    }
}
