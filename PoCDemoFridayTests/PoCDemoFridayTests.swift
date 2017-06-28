//
//  PoCDemoFridayTests.swift
//  PoCDemoFridayTests
//
//  Created by Nivardo Ibarra on 6/22/17.
//  Copyright © 2017 bbva. All rights reserved.
//

import XCTest
@testable import PoCDemoFriday

class PoCDemoFridayTests: XCTestCase {
    var trigonometry:TrigonometricFunctions?
    
    override func setUp() {
        super.setUp()
        trigonometry = TrigonometricFunctions()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        trigonometry = nil
        super.tearDown()
    }
    
    func testPerformanceExample() {
        self.measure {
        }
    }
    
    func testHypotnues() {
        XCTAssertEqual(43.46262762420146, trigonometry?.getHypotenuse(cathetusOpposite: 40, cathetusAdjacent: 17))
    }

    func testAngleSin() {
        XCTAssertEqual(23.025492008528033, trigonometry?.getAngleSin(cathetusOpposite: 17, hypotenuse: 43.46262762420146))
    }

    func testCathetusOpposite() {
        XCTAssertEqual(4.25, trigonometry?.getCathetusOpposite(cathetusAdjacent: 10, coTangent: 23.025492008528033))
    }

}
