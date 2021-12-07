//
//  CustomMoveScreen.swift
//  LoginScreenAuth
//
//  Created by Gaditek on 24/11/2021.
//

import Foundation
import UIKit

extension UIViewController {
    func moveScreen(storyboard: String , vc: String) {
        
        let story = UIStoryboard(name: storyboard, bundle: nil)
        let controller = story.instantiateViewController(withIdentifier: vc)
//        controller.modalPresentationStyle = .fullScreen
        self.present(controller, animated: true, completion: nil)
    }
}
