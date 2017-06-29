//
//  TrigonometricFunctions.swift
//  PoCDemoFriday
//
//  Created by Nivardo Ibarra on 6/27/17.
//  Copyright © 2017 bbva. All rights reserved.
//

import UIKit

class TrigonometricFunctions {
    
    func getHypotenuse(cathetusOpposite: CGFloat, cathetusAdjacent: CGFloat) -> Double {
        let hypotenuseC = pow(Double(cathetusOpposite), Double(2)) + pow(Double(cathetusAdjacent), Double(2))
        print("Double(cathetusOpposite), Double(2): \(Double(cathetusOpposite), Double(2))")
        print("Double(cathetusOpposite), Double(2): \(Double(cathetusOpposite), Double(2))")
        print("hypotenuseC: \(hypotenuseC)")
        print("CGFloat(pow(Double(hypotenuseC), Double(0.5))): \(pow(Double(hypotenuseC), Double(0.5)))")
        return pow(Double(hypotenuseC), Double(0.5))
    }
    
    func getAngleSin(cathetusOpposite: CGFloat, hypotenuse: CGFloat) -> Double {
        let sin = cathetusOpposite / hypotenuse
        print("sin: \(sin)")
        let angle = asin(Double(sin)) * 180 / Double.pi //let arcsinus = asin(1.0) * 180 / Double.pi
        print("CGFloat(angle): \(CGFloat(angle))")
        return angle
    }

    func getCathetusOpposite(cathetusAdjacent: CGFloat, coTangent: CGFloat) -> Double {
        let tang = tan(Double(coTangent) * Double.pi / 180) //tan(90 * M_PI / 180)
        print("tang: \(tang)")
        //let cathetusOpposite = tan(coTangent) * cathetusAdjacent
        let cathetusOpposite = tang * Double(cathetusAdjacent)
        print("cathetusOpposite__: \(cathetusOpposite))")
        return Double(cathetusOpposite)
    }
    
    func getAnglesStartAndEnd(angle: CGFloat) -> (start: CGFloat, end: CGFloat) {
        let constant: CGFloat = 35
        if angle != 180 {
            let angleEnd = (180.0 - angle) + constant
            let angleStart = (180.0 - angle) - (constant - 10)
            print("angleStart: \(angleStart)")
            print("angleEnd: \(angleEnd)")
            return (angleStart, angleEnd)
        } else {
            let angleEnd = (180) + constant
            let angleStart = (180.0) - (constant - 10)
            print("angleStart: \(angleStart)")
            print("angleEnd: \(angleEnd)")
            return (angleStart, angleEnd)
        }
    }
}
