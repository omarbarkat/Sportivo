//
//  LoadImg.swift
//  swiftLap2
//
//  Created by eng.omar on 28/07/2024.
//

import Foundation
import SDWebImage

class ImageLoader {
    static func loadImage(from url: URL, into imageView: UIImageView) {
        imageView.sd_setImage(with: url, completed: nil)
    }
}
