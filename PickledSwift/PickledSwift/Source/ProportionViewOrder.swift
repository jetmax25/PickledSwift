//
//  ProportionViewOrder.swift
//  PickledSwift
//
//  Created by Michael Isasi on 8/12/19.
//  Copyright © 2019 Pickled Games. All rights reserved.
//

///Order in which prop views are displayed
public enum ProportionViewOrder {
    case smallToLarge
    case largeToSmall
    case order

    public var sortFunc: (ProportionView, ProportionView) -> Bool {
        switch self {
        case .smallToLarge: return { $0.weight < $1.weight}
        case .largeToSmall: return { $1.weight < $0.weight}
        case .order: return { $0.order < $1.order }
        }
    }
}
