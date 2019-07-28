//
//  UICircleButton.swift
//  PickledSwift
//
//  Created by Michael Isasi on 7/16/19.
//  Copyright © 2019 Pickled Games. All rights reserved.
//

import UIKit


/// A button that is a perfect circle
class UICircleButton: PickledButton {
    
    override func setUp() {
        super.setUp()
        self.updateCornerRadius()
    }
    
    
    /// updates the corner radius to be half of the width
    private func updateCornerRadius() {
        OperationQueue.main.addOperation {
            self.layer.cornerRadius = self.bounds.width / 2
        }
    }
    
    /// change the radius whenever the view size changes
    override func layoutSubviews() {
        super.layoutSubviews()
        self.updateCornerRadius()
    }
}
