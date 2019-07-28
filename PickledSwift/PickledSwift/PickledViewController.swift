//
//  PickledViewController.swift
//  PickledSwift
//
//  Created by Michael Isasi on 7/16/19.
//  Copyright © 2019 Pickled Games. All rights reserved.
//

import Foundation

open class PickledViewController: UIViewController, Initializing {
    
    func setUp() {
        self.hideKeyboardWhenTappedAround()
    }
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        self.setUp()
    }
    
    /// Sets up a gesture recognizer to remove first responder when VC is tapped
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(PickledViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
