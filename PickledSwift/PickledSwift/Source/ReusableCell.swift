//
//  ReusableCell.swift
//  PickledSwift
//
//  Created by Michael Isasi on 7/20/19.
//  Copyright © 2019 Pickled Games. All rights reserved.
//

///Allows a cell to be registerd by the table easily
protocol ReusableCell where Self : UIView {
    static var name : String { get }
    static var nib: UINib  { get }
}

extension ReusableCell {
    static var name : String {
        return String(describing: self)
    }
    
    static var nib : UINib {
        return UINib(nibName: name, bundle: nil)
    }
}

extension UITableView {
    func register( cell : ReusableCell.Type ) {
        self.register(cell.nib, forCellReuseIdentifier: cell.name)
    }
}

extension UICollectionView {
    func register( cell : ReusableCell.Type ) {
        self.register(cell.nib, forCellWithReuseIdentifier: cell.name)
    }
}
