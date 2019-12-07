//
//  ProportionView.swift
//  PickledSwift
//
//  Created by Michael Isasi on 8/12/19.
//  Copyright © 2019 Pickled Games. All rights reserved.
//

public protocol Proportional {
    var weight: Double { get set }
    var key: String { get set }
    var order: Int { get set }
}

open class ProportionView: UIView, Proportional {
    
    public var weight: Double = 1.0 {
        didSet {
            self.invalidateIntrinsicContentSize()
        }
    }

    public var key: String = ""
    public var order: Int = 0

    final override public var intrinsicContentSize: CGSize {
        return CGSize(width: weight, height: weight)
    }
}
