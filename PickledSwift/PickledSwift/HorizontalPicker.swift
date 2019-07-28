//
//  HorizontalPicker.swift
//  PickledSwift
//
//  Created by Michael Isasi on 7/15/19.
//  Copyright © 2019 Pickled Games. All rights reserved.
//

import UIKit


/// Picker view that rotates horizontally
class HorizontalPicker: UIPickerView {

    /// UIPickerview but horizontal
    class HorizontalPicker: UIPickerView {
        override init(frame: CGRect) {
            super.init(frame: frame)
            setUp()
        }
        
        required init?(coder aDecoder: NSCoder) {
            super.init(coder: aDecoder)
            setUp()
        }
        
        var oldFrame : CGRect?
        var newFrame : CGRect?
        var oldBounds : CGRect?
        var newBounds : CGRect?
        
        let rotationAngle = 90 * (Double.pi / 180)
        private func setUp() {
            self.translatesAutoresizingMaskIntoConstraints = true
            self.oldFrame = self.frame
            self.oldBounds = self.bounds
            let frame = self.frame
            print(self.frame)
            self.transform = CGAffineTransform(rotationAngle: CGFloat(rotationAngle))
            self.frame = frame
            self.newFrame = self.frame
            self.newBounds = self.bounds
        }
        
        override func layoutSubviews() {
            super.layoutSubviews()
            //    setUp()
        }
    }

}
