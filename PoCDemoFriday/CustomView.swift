//
//  CustomView.swift
//  PoCDemoFriday
//
//  Created by Nivardo Ibarra on 6/23/17.
//  Copyright © 2017 bbva. All rights reserved.
//

import UIKit

extension UIView {
    
//    func dropShadow(scale: Bool = true) {        
//        self.layer.masksToBounds = false
//        self.layer.shadowColor = UIColor.black.cgColor
//        self.layer.shadowOpacity = 0.5
//        self.layer.shadowOffset = CGSize(width: -1, height: 1)
//        self.layer.shadowRadius = 1
//        self.layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
//        self.layer.shouldRasterize = true
//        self.layer.rasterizationScale = scale ? UIScreen.main.scale : 1
//    }
    
    func addGradient(view: UIView) { // "Like a shadow effect"
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [UIColor.black.withAlphaComponent(1.0).cgColor, UIColor.clear.cgColor]
        gradientLayer.locations = [0.0, 0.79]
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.5)
        gradientLayer.frame = view.bounds
        view.layer.insertSublayer(gradientLayer, at: 0)
    }
}
