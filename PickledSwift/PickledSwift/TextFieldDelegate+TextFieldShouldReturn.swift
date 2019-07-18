//
//  File.swift
//  PickledSwift
//
//  Created by Michael Isasi on 7/16/19.
//  Copyright © 2019 Pickled Games. All rights reserved.
//

import Foundation


extension UITextFieldDelegate {
    public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
