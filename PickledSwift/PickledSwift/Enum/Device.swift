//
//  Device.swift
//  PickledSwift
//
//  Created by Michael Isasi on 7/15/19.
//  Copyright © 2019 Pickled Games. All rights reserved.
//

public extension UIDevice {
    
    /// Device model types
    ///
    /// - iphone: <#iphone description#>
    /// - ipad: <#ipad description#>
    enum Model:String {
        case iPhone, iPad
    }
    
    
    /// The Model of the user device
    var ModelType: Model {
        guard let device = UIDevice.Model(rawValue: self.model) else { fatalError() }
        return device
    }
}
