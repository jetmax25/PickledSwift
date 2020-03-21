//
//  DismissableViewController.swift
//  PickledSwift
//
//  Created by Michael Isasi on 3/20/20.
//  Copyright © 2020 Pickled Games. All rights reserved.
//

import UIKit

class DismissableViewController: PickledViewController {
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        self.dismiss(animated: true, completion: nil)
    }
}
