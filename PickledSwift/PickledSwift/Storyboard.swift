//
//  ViewController.swift
//  PickledSwift
//
//  Created by Michael Isasi on 7/20/19.
//  Copyright © 2019 Pickled Games. All rights reserved.
//

/// Enum of all possible storyboards for easy initialization
public enum Storyboard : String {
    case Main
    
    func launch() {
        guard let storyboard = storyboard else {
            return
        }
        UIApplication.shared.delegate?.window??.rootViewController = storyboard
    }
    
    private var storyboard : UIViewController? {
        let storyboard = UIStoryboard(name: self.rawValue, bundle: nil)
        return storyboard.instantiateInitialViewController()
    }
}
