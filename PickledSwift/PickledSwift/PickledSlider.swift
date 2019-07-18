//
//  PickledSlider.swift
//  PickledSwift
//
//  Created by Michael Isasi on 7/15/19.
//  Copyright © 2019 Pickled Games. All rights reserved.
//

import UIKit

open class PickledSlider: UISlider, Initializing {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setUp()
    }
    
    func setUp() {
    }
    
    override open func layoutSubviews() {
        super.layoutSubviews()
        setUp()
    }

}
