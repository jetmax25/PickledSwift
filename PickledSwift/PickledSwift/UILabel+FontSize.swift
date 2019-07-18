//
//  UIFont+SetFont.swift
//  PickledSwift
//
//  Created by Michael Isasi on 7/15/19.
//  Copyright © 2019 Pickled Games. All rights reserved.
//

public extension UILabel {
    
    /// Gets and sets the standard font size of the label
    var fontSize: CGFloat {
        get {
            return self.font.pointSize
        }
        set {
            self.font = self.font.withSize(newValue)
        }
    }
}
