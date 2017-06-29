//
//  CustomCircle.swift
//  PoCDemoFriday
//
//  Created by Nivardo Ibarra on 6/28/17.
//  Copyright © 2017 bbva. All rights reserved.
//

import UIKit

class CustomCircle: UIView {

    let shapeLayer = CAShapeLayer()
    
    override func draw(_ rect: CGRect) {
        self.initialize(rect: rect)
    }

    func initialize(rect: CGRect) {
        self.drawCircle(rect: rect)
    }
    
    func drawCircle(rect: CGRect) {
//        let contextRef = UIGraphicsGetCurrentContext()
//        let circleRect = CGRect(x: 0, y: 0, width: 25, height: 25)
//        contextRef!.addEllipse(in: circleRect)
//        contextRef?.clip()
//        
//        contextRef!.setFillColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.6)
//        contextRef!.fill(rect)
        
        let halfSize:CGFloat = min( bounds.size.width/2, bounds.size.height/2)
        let desiredLineWidth:CGFloat = 1    // your desired value
        
        let circlePath = UIBezierPath(
            arcCenter: CGPoint(x:halfSize,y:halfSize),
            radius: CGFloat( halfSize - (desiredLineWidth/2) ),
            startAngle: CGFloat(0), //CGFloat(120 * Double.pi/180),
            endAngle: CGFloat(360 * Double.pi/180), //CGFloat(140 * Double.pi/180),
            clockwise:false)        
        shapeLayer.path = circlePath.cgPath
        
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.strokeColor = UIColor.white.cgColor
        shapeLayer.lineWidth = desiredLineWidth
        
        layer.addSublayer(shapeLayer)
    }
    
    func drawParticalCircle(angleStart: Double, angleEnd: Double) {
        let halfSize:CGFloat = min( bounds.size.width/2, bounds.size.height/2)
        let desiredLineWidth:CGFloat = 1    // your desired value
        
        let circlePath = UIBezierPath(
            arcCenter: CGPoint(x:halfSize,y:halfSize),
            radius: CGFloat( halfSize - (desiredLineWidth/2) ),
            startAngle: CGFloat(angleStart * Double.pi/180),
            endAngle: CGFloat(angleEnd * Double.pi/180),
            clockwise:false)
        
//        let shapeLayer = CAShapeLayer()
        shapeLayer.path = circlePath.cgPath
        
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.strokeColor = UIColor.white.cgColor
        shapeLayer.lineWidth = desiredLineWidth
        
//        layer.addSublayer(shapeLayer)
    }
    
}
