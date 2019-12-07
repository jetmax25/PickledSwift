////
////  ProportionalStackView.swift
////  PickledSwift
////
////  Created by Michael Isasi on 8/12/19.
////  Copyright © 2019 Pickled Games. All rights reserved.
////
//
//
/////Datasourace for prop view
//public protocol ProportionViewDataSource {
//    var propViews: [ProportionView] { get }
//}
//
/////Holds multiple views and displays them proportionally
//public class ProportionStackView: UIView {
//    var isOutOf100: Bool = false
//    var viewOrder: ProportionViewOrder = .order
//    
//    let stack = UIStackView()
//    
//    var dataSource: ProportionViewDataSource? {
//        didSet {
//            self.reload()
//        }
//    }
//    
//    public func reload() {
//        OperationQueue.main.addOperation {
//            self.stack.removeAllArrangedSubviews()
//            self.dataSource?.propViews.forEach { view in
//                self.stack.addArrangedSubview(view)
//            }
//        }
//    }
//    
//    public override init(frame: CGRect) {
//        super.init(frame: frame)
//        self.setUp()
//    }
//    
//    public required init?(coder aDecoder: NSCoder) {
//        super.init(coder: aDecoder)
//        self.setUp()
//    }
//    
//    private func setUp() {
//        
//        self.addSubview(stack)
//        stack.frame = self.bounds
//        
//        stack.alignment = .fill
//        stack.distribution = .fillProportionally
//    }
//    
//}
