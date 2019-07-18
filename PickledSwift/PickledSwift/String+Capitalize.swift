//
//  String+Capitalize.swift
//  PickledSwift
//
//  Created by Michael Isasi on 7/18/19.
//  Copyright © 2019 Pickled Games. All rights reserved.
//

public extension String {
    func capitalizingFirstLetter() -> String {
        return prefix(1).uppercased() + dropFirst()
    }
    
    mutating func capitalizeFirstLetter() {
        self = self.capitalizingFirstLetter()
    }
}

