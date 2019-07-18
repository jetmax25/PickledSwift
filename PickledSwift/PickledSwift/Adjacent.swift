//
//  Adjacent.swift
//  PickledSwift
//
//  Created by Michael Isasi on 7/16/19.
//  Copyright © 2019 Pickled Games. All rights reserved.
//

import Foundation
public enum Adjacent: Int {
    case next = 1,
    previous = -1,
    currrent = 0
}

public extension Array {
    
    /// Get an adjacent object in an array given the currentIndex
    ///
    /// - Parameters:
    ///   - adjacent: direction of element
    ///   - currentIndex: current index
    ///   - shouldWrap: if the array should be considered continues end-beggining
    /// - Returns: position and element returned, nil if not found
    func get(_ adjacent: Adjacent, currentIndex: Int, shouldWrap: Bool = false) -> (Pos: Int, Element: Element)? {
        guard let pos = self.getPos(adjacent, to: currentIndex, shouldWrap: shouldWrap) else { return nil }
        return (Pos:pos, self[pos])
    }
    
    
    /// Returns the position of the adjacent element
    ///
    /// - Parameters:
    ///   - adjacent: direction of the position
    ///   - currentIndex: current position
    ///   - shouldWrap: if the begining and end position are considered next to each other
    /// - Returns: the position adjacent to the index, nil if there is none
    func getPos(_ adjacent: Adjacent, to currentIndex: Int, shouldWrap: Bool = false ) -> Int? {
        guard !self.isEmpty else { return nil }
        guard self.count > 1 else { return 0 }
        
        let newIndex = currentIndex + adjacent.rawValue
        //if the index is within range then wrapping will not have an effect
        if (0..<self.count).contains(newIndex) || shouldWrap {
           return (newIndex + self.count) % self.count
        } else {
            //only an issue if outside and no wrapping
            return nil
        }
    }
}
