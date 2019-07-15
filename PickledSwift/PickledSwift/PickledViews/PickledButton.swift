//
//  PickledButton.swift
//  PickledSwift
//
//  Created by Michael Isasi on 7/15/19.
//  Copyright © 2019 Pickled Games. All rights reserved.
//

import UIKit

class PickledButton: UIButton, Initializing {

    override var isEnabled: Bool {
        didSet {
            self.alpha = self.isEnabled ? 1.0 : 0.3
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setUp()
    }
    
    internal func setUp() {
        self.layer.borderColor = UIColor.black.cgColor

        self.setTitleShadowColor(UIColor.black, for: .normal)
        self.titleLabel?.shadowOffset = CGSize(width: 1.0, height: 1.0)
        self.setTitleColor(UIColor.Pallet.text.color, for: .normal)
        self.backgroundColor = UIColor.Pallet.touch.color
        
        self.titleLabel?.numberOfLines = 0
        self.titleLabel?.textAlignment = .center
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setUp()
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        self.isSelected.toggle()
    }
}
