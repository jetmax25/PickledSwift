//
//  Device.swift
//  Tilter
//
//  Created by Michael Isasi on 7/11/19.
//  Copyright © 2019 Pickled Games. All rights reserved.
//

import UIKit
enum Device: String {
    case x,
    plus,
    standard,
    se,
    ipad = "iPad"
    
    static var Current: Device {
        let modelString = UIDevice.current.model
        return Device(rawValue: modelString) ?? Device.standard
    }
    
    static var isIpad: Bool {
        return Device.Current == .ipad
    }
}
