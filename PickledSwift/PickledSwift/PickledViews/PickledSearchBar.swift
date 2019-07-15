//
//  PickledSearchBar.swift
//  PickledSwift
//
//  Created by Michael Isasi on 7/15/19.
//  Copyright © 2019 Pickled Games. All rights reserved.
//

class PickledSearchBar: UISearchBar {
    
    private var textField : UITextField? {
        return self.value(forKey: "searchField") as? UITextField
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setUp()
    }
    
    private func setUp() {
        self.textField?.textColor = UIColor.Pallet.text.color
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setUp()
    }
}
