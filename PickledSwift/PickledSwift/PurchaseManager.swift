//
//  PurchaseManager.swift
//  PickledSwift
//
//  Created by Michael Isasi on 7/18/19.
//  Copyright © 2019 Pickled Games. All rights reserved.
//

import SwiftyStoreKit
import StoreKit
import SwiftSpinner


enum purchaseItem : String {
    case pro = "Test"

    var productId : String {
        return self.rawValue
    }
}

class PurchaseManager {
    static var shared = PurchaseManager.init()
    private init(){
        SwiftyStoreKit.completeTransactions(atomically: true) { purchases in
            for purchase in purchases {
                switch purchase.transaction.transactionState {
                case .purchased, .restored:
                    if purchase.needsFinishTransaction {
                        // Deliver content from server, then:
                        SwiftyStoreKit.finishTransaction(purchase.transaction)
                    }
                // Unlock content
                case .failed, .purchasing, .deferred:
                    break // do nothing
                @unknown default:
                    return
                }
            }
        }
    }

    private func paymentSucceded() {
        StoredProperty.isAdFree.set(value: true)
    }

    private func paymentCancelled() {
        print("payment cancelled")
    }

    private func paymentFailed(error : SKError) {
        var response : String = "N/A"
        switch error.code {
        case .paymentCancelled:
            paymentCancelled()
            return
        case .unknown: response = "Unknown error. Please contact support"
        case .clientInvalid: response = "Not allowed to make the payment"
        case .paymentInvalid: response = "The purchase identifier was invalid"
        case .paymentNotAllowed: response = "The device is not allowed to make the payment"
        case .storeProductNotAvailable: response = "The product is not available in the current storefront"
        case .cloudServicePermissionDenied: response = "Access to cloud service information is not allowed"
        case .cloudServiceNetworkConnectionFailed: response = "Could not connect to the network"
        case .cloudServiceRevoked: response = "User has revoked permission to use this cloud service"
        default: response = "Unknown error. Please contact support"
        }
    }

    func purchase(completion : (() ->())? = nil) {
        SwiftyStoreKit.purchaseProduct(purchaseItem.pro.productId, completion: {result in
            switch result {
            case .success:
                self.paymentSucceded()
            case .error(let error):
                self.paymentFailed(error: error)
            }
            completion?()
        })
    }

    func restorePurchases(completion : (() ->())? = nil) {
        SwiftyStoreKit.restorePurchases(atomically: true) { results in
            if results.restoredPurchases.count == 0 {
                return
            }
            else if results.restoredPurchases.count > 0 {
                StoredProperty.isAdFree.set(value: true)
            }
            completion?()
        }
    }
}
