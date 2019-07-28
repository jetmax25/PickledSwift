//
//  UIColor+Pallet.swift
//  PickledSwift
//
//  Created by Michael Isasi on 7/15/19.
//  Copyright © 2019 Pickled Games. All rights reserved.
//

public extension UIColor {
    
    /// Standardized color pallet for an app
    enum Pallet: String {
        case primary,
        background,
        touch,
        accent,
        text
        
        ///Fallback color of the attribute if it is not defined
        private var defaultColor : UIColor {
            switch self {
            case .primary: return UIColor.yellow
            case .background: return UIColor.lightGray
            case .accent: return UIColor.darkGray
            case .touch: return UIColor.cyan
            case .text: return UIColor.blue
            }
        }
        
        
        /// Gets the color of the attribute
        /// - Important: defaults to default color
        public var color: UIColor {
            return UIColor(named: self.rawValue) ?? self.defaultColor
        }
    }
}
