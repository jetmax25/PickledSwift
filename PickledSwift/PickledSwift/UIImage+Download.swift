//
//  UIImage+Download.swift
//  PickledSwift
//
//  Created by Michael Isasi on 7/15/19.
//  Copyright © 2019 Pickled Games. All rights reserved.
//

public extension UIImage {
    
    /// Local cache storage of downloaded images
    static var ImageCache = NSCache<NSString, UIImage>()
    
    /// Downloads an image async using a background thread and sends it to a completion handler
    /// Caches locally once downloaded
    /// - Parameters:
    ///   - urlString: the string url of the image
    ///   - completion: action on successsful donwload of the image
    static func download( from urlString: String, completion: ((UIImage?) -> Void)? = nil) {
        let nsString = urlString as NSString
        UIImage.download(from: nsString) { image in
            completion?(image)
        }
    }
    
    /// Downloads an image async using a background thread and sends it to a completion handler
    /// Caches locally once downloaded
    /// - Parameters:
    ///   - urlString: the NSString url of the image
    ///   - completion: action on successsful donwload of the image
    static func download( from urlString: NSString, completion: ((UIImage?) -> Void)? = nil) {
        if let image = UIImage.ImageCache.object(forKey: urlString) {
            completion?(image)
            return
        }
        
        guard let url = URL(string: urlString as String) else { return }
        
        DispatchQueue.global(qos: .background).async {
            guard let data = try? Data(contentsOf: url), let image = UIImage(data: data) else { return }
            UIImage.ImageCache.setObject(image, forKey: urlString)
            completion?(image)
        }
    }
}

