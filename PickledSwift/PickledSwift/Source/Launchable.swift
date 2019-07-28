//
//  ViewController.swift
//  PickledSwift
//
//  Created by Michael Isasi on 7/20/19.
//  Copyright © 2019 Pickled Games. All rights reserved.
//


/// Protocol that allows storyboard launching
public protocol Launchable: RawRepresentable where RawValue == String {
    func launch()
}

public extension Launchable {
    
    /// Launch the storyboard
    func launch() {
        guard let storyboard = storyboard else {
            return
        }
        UIApplication.shared.delegate?.window??.rootViewController = storyboard
    }
    
    
    /// get the storyboard
    private var storyboard : UIViewController? {
        let storyboard = UIStoryboard(name: self.rawValue, bundle: nil)
        return storyboard.instantiateInitialViewController()
    }
}

