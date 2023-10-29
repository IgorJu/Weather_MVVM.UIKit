//
//  Extension + UIViewController.swift
//  Weather_MVVM.UIKit
//
//  Created by Igor on 28.10.2023.
//

import UIKit

extension UIViewController {
    
    func setupGradient() {
        let startColor = UIColor(
            red: 13 / 255,
            green: 95 / 255,
            blue: 235 / 255,
            alpha: 1
        )
        
        let endColor = UIColor(
            red: 180 / 255,
            green: 130 / 255,
            blue: 252 / 255,
            alpha: 1.0
        )
        
        view.addVerticalGradientLayer(topColor: startColor, bottomColor: endColor)
    }
}
