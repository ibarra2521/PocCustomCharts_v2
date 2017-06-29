//
//  LineChart3D.swift
//  PoCDemoFriday
//
//  Created by Nivardo Ibarra on 6/28/17.
//  Copyright © 2017 bbva. All rights reserved.
//

import UIKit

class LineChart3D: UIView {
 
    var lastPoint = CGPoint(x: 0, y: 0)
    
    override func draw(_ rect: CGRect) {
        self.initialize()
    }
    
    func initialize() {
        /*let aPath = UIBezierPath()
        aPath.move(to: CGPoint(x:20, y:50)) // init line
        aPath.addLine(to: CGPoint(x: 40, y: 100))
        //Keep using the method addLineToPoint until you get to the one where about to close the path
        aPath.close()
        //If you want to stroke it with a red color
        AppColors.blue_5BBEFF.color.set()//UIColor.red.set()
        
        //
        aPath.lineWidth = 13
        //
        
        aPath.stroke()
        //If you want to fill it as well
        aPath.fill()*/
        let height = self.frame.height - 17
        self.lastPoint = CGPoint(x: 15, y: height)
        self.drawSegmentOne()
        self.drawSegmentTwo()
        self.drawSegmentThree()
        self.drawSegmentFour()
        self.drawSegmentFive()
        self.drawSegmentSix()
        self.drawSegmentSeven()
    }
    
    func drawSegmentOne() {
        let aPath = UIBezierPath()
        let height = self.frame.height - 17
        aPath.move(to: CGPoint(x: 15, y: height))
        let lastCGPoint = CGPoint(x: 55, y: height - 19)
        aPath.addLine(to: lastCGPoint)
        aPath.close()
        AppColors.blue_5BBEFF.color.set() //
        aPath.lineWidth = 10
        aPath.stroke()
//        aPath.fill()
        self.lastPoint = lastCGPoint
    }
    
    func drawSegmentTwo() {
        let aPath = UIBezierPath()
        //let height = self.frame.height - 10
        aPath.move(to: CGPoint(x: self.lastPoint.x - 1, y: self.lastPoint.y))
        let lastCGPoint = CGPoint(x: 100, y: self.lastPoint.y)
        aPath.addLine(to: lastCGPoint)
        aPath.close()
        AppColors.blue_218CD4.color.set()//UIColor.red.set()
        aPath.lineWidth = 10
        aPath.stroke()
        self.lastPoint = lastCGPoint
        //        aPath.fill()
        //self.drawSegmentOne()
    }

    
    func drawSegmentThree() {
        let aPath = UIBezierPath()
        //let height = self.frame.height - 10
        aPath.move(to: CGPoint(x: self.lastPoint.x - 3, y: self.lastPoint.y + 1))
        let lastCGPoint = CGPoint(x: (self.lastPoint.x - 3) + 48, y: self.lastPoint.y - 25)
        aPath.addLine(to: lastCGPoint)
        aPath.close()
        AppColors.blue_5BBEFF.color.set()//UIColor.red.set()
        aPath.lineWidth = 10
        aPath.stroke()
        self.lastPoint = lastCGPoint
        //        aPath.fill()
        //self.drawSegmentTwo()
        //self.drawSegmentOne()
    }
    
    func drawSegmentFour() {
        let aPath = UIBezierPath()
        //let height = self.frame.height - 10
        aPath.move(to: CGPoint(x: self.lastPoint.x - 3, y: self.lastPoint.y + 1))
        let lastCGPoint = CGPoint(x: (self.lastPoint.x - 3) + 48, y: self.lastPoint.y + 1)
        aPath.addLine(to: lastCGPoint)
        aPath.close()
        AppColors.blue_218CD4.color.set()//UIColor.red.set()
        aPath.lineWidth = 10
        aPath.stroke()
        self.lastPoint = lastCGPoint
        //        aPath.fill()
        //self.drawSegmentTwo()
        //self.drawSegmentOne()
    }

    func drawSegmentFive() {
        let aPath = UIBezierPath()
        //let height = self.frame.height - 10
        aPath.move(to: CGPoint(x: self.lastPoint.x - 3, y: self.lastPoint.y + 0))
        let lastCGPoint = CGPoint(x: (self.lastPoint.x - 3) + 48, y: self.lastPoint.y + 0)
        aPath.addLine(to: lastCGPoint)
        aPath.close()
        AppColors.blue_218CD4.color.set()//UIColor.red.set()
        aPath.lineWidth = 10
        aPath.stroke()
        self.lastPoint = lastCGPoint
        //        aPath.fill()
        //self.drawSegmentTwo()
        //self.drawSegmentOne()
    }

    func drawSegmentSix() {
        let aPath = UIBezierPath()
        //let height = self.frame.height - 10
        aPath.move(to: CGPoint(x: self.lastPoint.x - 3, y: self.lastPoint.y + 0))
        let lastCGPoint = CGPoint(x: (self.lastPoint.x - 3) + 48, y: self.lastPoint.y - 17 - 1)
        aPath.addLine(to: lastCGPoint)
        aPath.close()
        AppColors.blue_5BBEFF.color.set()//UIColor.red.set()
        aPath.lineWidth = 10
        aPath.stroke()
        self.lastPoint = lastCGPoint
        //        aPath.fill()
        //self.drawSegmentTwo()
        //self.drawSegmentOne()
    }

    func drawSegmentSeven() {
        let aPath = UIBezierPath()
        //let height = self.frame.height - 10
        aPath.move(to: CGPoint(x: self.lastPoint.x - 2, y: self.lastPoint.y + 3))
        let lastCGPoint = CGPoint(x: (self.lastPoint.x - 3) + 40, y: self.lastPoint.y - 93 + 15)
        aPath.addLine(to: lastCGPoint)
        aPath.close()
        AppColors.blue_5BBEFF.color.set()//UIColor.red.set()
        aPath.lineWidth = 10
        aPath.stroke()
        self.lastPoint = lastCGPoint
        //        aPath.fill()
        //self.drawSegmentTwo()
        //self.drawSegmentOne()
    }
}
