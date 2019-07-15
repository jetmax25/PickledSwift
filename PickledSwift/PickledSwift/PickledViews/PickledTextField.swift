//
//  PickledTextField.swift
//  PickledSwift
//
//  Created by Michael Isasi on 7/15/19.
//  Copyright © 2019 Pickled Games. All rights reserved.
//

import UIKit

class PickledTextField: UITextField, Initializing {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setUp()
    }
    
    internal func setUp() {
        self.textColor = UIColor.Pallet.text.color
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setUp()
    }

}
