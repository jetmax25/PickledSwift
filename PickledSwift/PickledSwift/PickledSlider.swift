//
//  PickledSlider.swift
//  PickledSwift
//
//  Created by Michael Isasi on 7/15/19.
//  Copyright © 2019 Pickled Games. All rights reserved.
//

import UIKit

class PickledSlider: UISlider, Initializing {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setUp()
    }
    
    func setUp() {
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setUp()
    }

}
