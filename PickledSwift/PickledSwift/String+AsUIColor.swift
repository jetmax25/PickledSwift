//
//  String+AsUIColor.swift
//  PickledSwift
//
//  Created by Michael Isasi on 7/16/19.
//  Copyright © 2019 Pickled Games. All rights reserved.
//

public extension String {
    var asUIColor: UIColor? {
        return UIColor(hexString: self)
    }
}
