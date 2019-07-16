//
//  UIImage+ContentClippingRect.swift
//  PickledSwift
//
//  Created by Michael Isasi on 7/15/19.
//  Copyright © 2019 Pickled Games. All rights reserved.
//

extension UIImageView {
    
    /** Get the bounds of the image view that the image is visible in
     - Important: Only works for aspect fit imageviews
     */
    var contentClippingRect: CGRect {
        guard let image = image else { return bounds }
        guard contentMode == .scaleAspectFit else { return bounds }
        guard image.size.width > 0 && image.size.height > 0 else { return bounds }
        
        let widthScale = bounds.width / image.size.width
        let heightScale = bounds.height / image.size.height
        
        let scale = min(widthScale, heightScale)
        
        let size = CGSize(width: image.size.width * scale, height: image.size.height * scale)
        let x = (bounds.width - size.width) / 2.0
        let y = (bounds.height - size.height) / 2.0
        
        return CGRect(x: x, y: y, width: size.width, height: size.height)
    }
}
