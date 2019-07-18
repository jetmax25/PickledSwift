//
//  PickledSegmentedControl.swift
//  PickledSwift
//
//  Created by Michael Isasi on 7/15/19.
//  Copyright © 2019 Pickled Games. All rights reserved.
//

import UIKit

open class PickledSegmentedControl: UISegmentedControl, Initializing {

    override open var isEnabled: Bool {
        didSet {
            self.alpha = self.isEnabled ? 1.0 : 0.3
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setUp()
    }
    
    internal func setUp() {
        self.backgroundColor = UIColor.Pallet.accent.color
        self.tintColor = UIColor.Pallet.touch.color
        let font = UIFont.systemFont(ofSize: 16)
        self.setTitleTextAttributes([NSAttributedString.Key.font: font, NSAttributedString.Key.foregroundColor : UIColor.Pallet.text.color], for: .normal)
        
        self.setTitleTextAttributes([NSAttributedString.Key.font: font.withSize(18), NSAttributedString.Key.foregroundColor : UIColor.Pallet.text.color], for: .selected)
    }
}
