//
//  ViewController+ShowAlert.swift
//  PickledSwift
//
//  Created by Michael Isasi on 7/28/19.
//  Copyright © 2019 Pickled Games. All rights reserved.
//


public extension UIViewController {
    
    /// Send out a simple alert from the view controller
    ///
    /// - Parameters:
    ///   - title: Title of the alert
    ///   - message: Message of the alert
    func messageAlert( title : String = "", message : String = "" ) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true)
    }
}
