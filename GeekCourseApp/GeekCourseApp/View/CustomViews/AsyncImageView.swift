//
//  AsyncImageView.swift
//  GeekCourseApp
//
//  Created by MacMini on 14.10.2020.
//  Copyright © 2020 com.blablabla. All rights reserved.
//

import UIKit

class AsyncImageView: UIImageView {

    var lastURLUsedToLoadImage: String?
    
    private var tempImage: UIImage?
    
    override var image: UIImage? {
        get {
            return tempImage
        }
        set {
            tempImage = newValue
            layer.contents = nil
            guard let image = newValue else { return }
            DispatchQueue.global(qos: .userInitiated).async {
                let decodedImage = self.decode(image)
                DispatchQueue.main.async {
                    self.layer.contents = decodedImage
                }
            }
        }
    }
    
    private func decode(_ image: UIImage) -> CGImage? {
        guard let newImage = image.cgImage else { return nil}
        
        let colorSpace = CGColorSpaceCreateDeviceRGB()
        let context = CGContext(data: nil,
                                width: newImage.width,
                                height: newImage.height,
                                bitsPerComponent: 8,
                                bytesPerRow: newImage.width * 4,
                                space: colorSpace,
                                bitmapInfo: CGImageAlphaInfo.premultipliedFirst.rawValue )
        
        let imgRect = CGRect(x: 0, y: 0, width: newImage.width, height: newImage.height)
        context?.draw(newImage, in: imgRect)
        return context?.makeImage()
    }
    
    func loadImage(urlString: String) {
        print("Async Loading image...")
        lastURLUsedToLoadImage = urlString
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, err) in
            if let err = err {
                print("Failed to fetch post image:", err)
                return
            }
            if url.absoluteString != self.lastURLUsedToLoadImage {
                return
            }
            guard let imageData = data else { return }
            let photoImage = UIImage(data: imageData)
            
            DispatchQueue.main.async {
                self.image = photoImage
            }
            
            }.resume()
    }
}

