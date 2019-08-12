//
//  PickledViewController.swift
//  PickledSwift
//
//  Created by Michael Isasi on 7/16/19.
//  Copyright © 2019 Pickled Games. All rights reserved.
//

import Foundation

open class PickledViewController: UIViewController, Initializing {
    
    private static var KeyboardConstraintID = "KeyboardConstraintID"
    
    open func setUp() {
        addKeyboardObserver()
        self.hideKeyboardWhenTappedAround()
    }
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        self.setUp()
    }
    
    open override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        NotificationCenter.default.removeObserver(self)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    /// Sets up a gesture recognizer to remove first responder when VC is tapped
    private func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(PickledViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}


//Mark: keyboard extensions
extension PickledViewController {
    public func avoidKeyboard(viewToAvoid: UIView?) {
        print(self.view.constraints)
        guard let viewToAvoid = viewToAvoid, let vcView = self.view else { return }
        
        let constraint = NSLayoutConstraint(item: vcView, attribute: NSLayoutConstraint.Attribute.bottom, relatedBy: NSLayoutConstraint.Relation.greaterThanOrEqual, toItem: viewToAvoid, attribute: NSLayoutConstraint.Attribute.bottom, multiplier: 1.0, constant: 0)
        constraint.priority = UILayoutPriority(rawValue: 1000)
        constraint.identifier = PickledViewController.KeyboardConstraintID
        self.view.addConstraint(constraint)
        print(self.view.constraints)
    }
    
    private func addKeyboardObserver() {
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardNotification(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardNotification(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc private func keyboardNotification(notification: NSNotification) {
        
        let isHiding = notification.name == UIResponder.keyboardWillHideNotification
        
        let constraints = self.view.constraints.filter { $0.identifier == PickledViewController.KeyboardConstraintID }
        guard !constraints.isEmpty else { return }
        
        guard let keyboardFrame: NSValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else { return }
        let keyboardHeight = keyboardFrame.cgRectValue.height
        
        let height = isHiding ? 0.0 : keyboardHeight
        
        UIView.animate(withDuration: 1.0) {
            constraints.forEach { $0.constant = height }
            self.view.layoutIfNeeded()
        }
    }
}
