//
//  UrlImageLoadClass.swift
//  LoginScreenAuth
//
//  Created by Gaditek on 27/11/2021.
//

import Foundation
import UIKit

class LoadImage {
    
    static let shared = LoadImage()
    var images: [String: UIImage] = [:]
    
    private init(){}
    
    func loadImage(code: String, completion: @escaping ((UIImage) -> Void)){
        if let image = images[code] {
            completion(image)
            return
        }
        DispatchQueue.global(qos: .background).async {
            guard let url = URL(string: "https://raw.githubusercontent.com/madebybowtie/FlagKit/master/Assets/PNG/\(code)%403x.png") else { fatalError("image not found") }
            
            if let data = try? Data(contentsOf: url), let image = UIImage(data: data) {
                DispatchQueue.main.async {
                    self.images[code] = image
                    completion(image)
                }
            }
        }
    }
    
}
