//
//  UIStackView+removeAllArrangedSubviews.swift
//  PickledSwift
//
//  Created by Michael Isasi on 8/12/19.
//  Copyright © 2019 Pickled Games. All rights reserved.
//

public extension UIStackView {
    ///removes all subviews from a stack
    func removeAllArrangedSubviews() {
        self.arrangedSubviews.forEach {
            $0.removeFromSuperview()
        }
    }
}
