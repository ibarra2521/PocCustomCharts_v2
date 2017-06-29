//
//  TotalExpensesViewController.swift
//  DemoCharts
//
//  Created by Nivardo Ibarra on 6/22/17.
//  Copyright © 2017 Nivardo Ibarra. All rights reserved.
//

import UIKit
import Charts

enum Direction: String {
    case left = "left"
    case right = "right"
}

enum Inclination: String {
    case noInclination = "noInclination"
    case inclination = "inclination"
}


class TotalExpensesViewController: UIViewController {
    
    // MARK: - IBOulets
    @IBOutlet weak var lineChartView: LineChartView!
    @IBOutlet weak var shadow: UIView!
    @IBOutlet weak var moneyLabel: UILabel!
    @IBOutlet weak var circleCustom: CustomCircle!
    
    // MARK: - Variables
    @IBOutlet weak var container: UIView!
    @IBOutlet weak var graph: UIView!
    @IBOutlet weak var circle1: UIImageView!
    @IBOutlet weak var circle2: UIImageView!
    @IBOutlet weak var line: UIImageView!
    
    var location = CGPoint(x: 0, y: 0)
    let yAxis: CGFloat = 150.0
    var halfHeighCircle: CGFloat = 0
    var halfWeidthCircle: CGFloat = 0
    var limitXOrigin: CGFloat = 0
    var limitXEnd: CGFloat = 0
    var direcion = Direction.right
    var yAxesYCircle2: CGFloat = 110
    var yAxesYCircle1: CGFloat = 0
    var constraintDown: CGFloat = 10
    var moneyTempToDeleteAfter = 10
    var constraintDown2: CGFloat = 70
    var heightLine: CGFloat = 0.0
    let trigonometry = TrigonometricFunctions()
    
    //Tmp
    let tmpStart = 30.5
    var xAxes = [30.5, 75.5, 120.5, 165.5, 210.5, 255.5, 300.5, 345.5]
    var yAxes = [414, 393, 393, 368, 368, 368, 351, 258]

    override func viewDidLoad() {
        super.viewDidLoad()
        self.initialize()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func initialize() {
//        self.setCustomLine()
//        self.lineChartView.animate(xAxisDuration: 0.0, yAxisDuration: 1.0)
        self.customView()
        
        self.halfHeighCircle = self.circle1.frame.height / 2
        self.halfWeidthCircle =  self.circle1.frame.width / 2
        self.limitXOrigin = self.container.bounds.minX + self.halfWeidthCircle
        self.limitXEnd = self.container.frame.width - self.halfWeidthCircle
        self.yAxesYCircle1 = self.container.bounds.maxY - self.halfHeighCircle - self.constraintDown
        self.yAxesYCircle2 = self.container.bounds.maxY - 77
        self.circle1.center = CGPoint(x: self.limitXOrigin, y: self.yAxesYCircle1)
        //self.circle2.center = CGPoint(x: self.limitXOrigin, y: self.yAxesYCircle2) //CGPoint(x: self.limitXOrigin, y: self.yAxesYCircle2)
        self.circleCustom.center = CGPoint(x: self.limitXOrigin, y: self.yAxesYCircle2)
        self.heightLine = self.line.frame.height
        self.line.center = CGPoint(x: self.limitXOrigin, y: self.yAxesYCircle2 + 27)
    }
    
    func setCustomLine() {
        // Do any additional setup after loading the view.
        let ys1 = [0.0, 40.0, 40.0, 88.0, 88.0, 88.0, 120.0, 300.0] //[2.0, 40.0, 40.0, 88.0, 88.0, 88.0, 120.0, 300.0]
        let yse1 = ys1.enumerated().map { x, y in return ChartDataEntry(x: Double(x), y: y) }
        print("yse1[0].description: \(yse1[0].description)")
        print("yse1[1].description: \(yse1[1].description)")
        print("yse1[2].description: \(yse1[2].description)")
        print("yse1[3].description: \(yse1[3].description)")
        print("yse1[4].description: \(yse1[4].description)")
        print("yse1[5].description: \(yse1[5].description)")
        print("yse1[5].description: \(yse1[6].description)")
        print("yse1[6].description: \(yse1[7].description)")
        
        let data = LineChartData()
        let lineDataSet = LineChartDataSet(values: yse1, label: "") //LineChartDataSet(values: yse1, label: "Hello")
        lineDataSet.colors = [AppColors.blue_5BBEFF.color] //[NSUIColor.red]
        
//      // Uncomment to shwo drawcircles
        lineDataSet.drawCirclesEnabled = false // No circles
        lineDataSet.lineWidth = 10.0
        
        //Uncomment Hidden the toggle values
        lineDataSet.drawValuesEnabled = false // Hidden the toggle values
        
        // Uncomment to enable lines, grid
        lineChartView.rightAxis.enabled = false
        lineChartView.leftAxis.enabled = false
        lineChartView.rightAxis.drawLabelsEnabled = false
        lineChartView.leftAxis.drawLabelsEnabled = false
        lineChartView.legend.enabled = false
        
        
        lineChartView.xAxis.drawLabelsEnabled = false
        
        
        
        

        
//        
        data.addDataSet(lineDataSet)
        
        self.lineChartView.data = data
        self.lineChartView.gridBackgroundColor = AppColors.clearColor.color
        self.lineChartView.chartDescription?.text = ""
        
        //
        //self.lineChartView.data?.getDataSetByIndex(0)
        //print("self.lineChartView.lineData?.getDataSetByIndex(0): \(self.lineChartView.data?.getDataSetByIndex(0))")
        
        
        // Uncomment to enable lines, grid
        let xAxis: XAxis = lineChartView.xAxis
        xAxis.drawAxisLineEnabled = false
        xAxis.drawGridLinesEnabled = false

        
        
        self.lineChartView.gridBackgroundColor = NSUIColor.red //NSUIColor.white
        //self.lineChartView.chartDescription?.text = "Linechart Demo"

        // Uncomment to shwo drawcircles
        //self.lineChartView.drawCirclesEnabled = false
    }
    
    // Custom
    func customView() {
//        self.shadow.dropShadow(scale: true)
        self.shadow.addGradient(view: self.shadow)
    }
    
    // MARK: - Unwind Segues
    @IBAction func cancelToPlayersViewController(_ segue:UIStoryboardSegue) {}
    

    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        /*self.location = (touches.first?.location(in: self.view))!
        print("touchesBegan: \(self.location)")
        let tmpLocation = CGPoint(x: location.x, y: self.yAxesYCircle1)
        self.circle1.center = tmpLocation
        
        let locatinoY = getLocationYCircle2(locationX: location.x)
        self.drawCircleTwo(xAxes: self.location.x, yAxes: locatinoY)
        self.drawLine(xAxes: self.location.x, yAxes: locatinoY, height: 0.0)
//        self.drawCircleTwo(xAxes: self.location.x, yAxes: self.yAxesYCircle2) */
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.location = (touches.first?.location(in: self.view))!
        print("touchesBegan: \(self.location)")
        if self.isInsizeContainer(xAxes: self.location.x) {
            let tmpLocation = CGPoint(x: self.location.x, y: self.yAxesYCircle1)
            self.circle1.center = tmpLocation
            
            let locationY = getLocationYCircle2(locationX: location.x)
            self.yAxesYCircle2 = (self.container.bounds.maxY - self.constraintDown2) - locationY.locationY //77
            
        
            self.drawCircleTwo(xAxes: self.location.x, yAxes: self.yAxesYCircle2, angle: locationY.angle)
            //self.drawCircleTwo(xAxes: self.location.x, yAxes: self.yAxesYCircle2)
            self.drawLine(xAxes: self.location.x, yAxes: self.yAxesYCircle2, height: locationY.locationY)
        } else {
            if self.direcion == .left {
                let tmpLocation = CGPoint(x: self.limitXOrigin, y: self.yAxesYCircle1)
                self.circle1.center = tmpLocation
                
                //let locationY = getLocationYCircle2(locationX: location.x)
                //self.yAxesYCircle2 = (self.container.bounds.maxY - self.constraintDown2) - locationY
                
                self.drawCircleTwo(xAxes: self.limitXOrigin, yAxes: self.yAxesYCircle2, angle: 0.0)
                self.drawLine(xAxes: self.limitXOrigin, yAxes: self.yAxesYCircle2, height: 0.0)
            } else {
                let tmpLocation = CGPoint(x: self.limitXEnd, y: self.yAxesYCircle1)
                self.circle1.center = tmpLocation

//                let locationY = getLocationYCircle2(locationX: location.x)
//                self.yAxesYCircle2 = (self.container.bounds.maxY - self.constraintDown2) - locationY

                self.drawCircleTwo(xAxes: self.limitXEnd, yAxes: self.yAxesYCircle2, angle: 0.0)
                self.drawLine(xAxes: self.limitXEnd, yAxes: self.yAxesYCircle2, height: self.yAxesYCircle2 + 95)
            }
        }
        self.updateLabelMoney(amount: "")
    }
    
    func isInsizeContainer(xAxes: CGFloat) -> Bool {
        if xAxes <= self.limitXOrigin {
            print("limit x, left")
            self.direcion = .left
            return false
        } else if xAxes > self.limitXEnd {
            print("limit x, right")
            self.direcion = .right
            return false
        } else {
            print("Inside")
            return true
        }
    }
    
    // MARK: -  Draw circle two
    func drawCircleTwo(xAxes: CGFloat, yAxes: CGFloat, angle: CGFloat) {
        //self.circle2.center = CGPoint(x: xAxes, y: yAxes)
        print("Angle: \(angle)")
        let angles = self.trigonometry.getAnglesStartAndEnd(angle: angle)
        if xAxes >= 20 && xAxes <= 317 {
            self.circleCustom.drawParticalCircle(angleStart: Double(angles.start), angleEnd: Double(angles.end))
            self.circleCustom.center = CGPoint(x: xAxes, y: yAxes)
        } else if xAxes < 20 || xAxes > 317 {
            self.circleCustom.drawParticalCircle(angleStart: Double(0), angleEnd: Double(360))
        }
        self.circleCustom.center = CGPoint(x: xAxes, y: yAxes)
    }
    
    func drawLine(xAxes: CGFloat, yAxes: CGFloat, height: CGFloat) {
        self.line.frame.origin.x = xAxes
        self.line.frame.origin.y = yAxes + 10 //self.halfHeighCircle
        self.line.frame.size.height = self.heightLine + height //30
    }
    
    func updateLabelMoney(amount: String) {
        //
        self.moneyTempToDeleteAfter += 10
        self.moneyLabel.text = "\(self.moneyTempToDeleteAfter)"//amount
    }
    
    func getLocationYCircle2(locationX: CGFloat) -> (locationY: CGFloat, angle: CGFloat) {
        print("getLocationYCircle2 ... \(locationX)")
        let segmentNumber = self.getSegment(valueX: Double(locationX))
        let indexesArray = self.getIndexFromArray(segment: segmentNumber)
        let inclination = self.getInclinationAngle(indexStart: indexesArray.indexStart, indexEnd: indexesArray.IndexEnd)
        //        if inclination == .inclination { // Funcion TODO: Positive or negative
        if locationX >= 55 && locationX < 100 {
            return (27.0, 180)
        } else if locationX >= 100 && locationX < 140 {
//            let trigonometry = TrigonometricFunctions()
            let hypotenuse = trigonometry.getHypotenuse(cathetusOpposite: 25, cathetusAdjacent: 45) //  45, 21
            let angle = trigonometry.getAngleSin(cathetusOpposite: 25, hypotenuse: CGFloat(hypotenuse))
            let yAxex2 = trigonometry.getCathetusOpposite(cathetusAdjacent: locationX, coTangent: CGFloat(angle))
            return (CGFloat(yAxex2 - 28), CGFloat(angle))
        } else if (locationX >= 140 && locationX < 240) {
            return (52.0, 180)
        } else if (locationX >= 240 && locationX < 285) {
//            let trigonometry = TrigonometricFunctions()
            let hypotenuse = trigonometry.getHypotenuse(cathetusOpposite: 17, cathetusAdjacent: 45) //  45, 21
            let angle = trigonometry.getAngleSin(cathetusOpposite: 17, hypotenuse: CGFloat(hypotenuse))
            let yAxex2 = trigonometry.getCathetusOpposite(cathetusAdjacent: locationX, coTangent: CGFloat(angle))
            return (CGFloat(yAxex2 - 38), CGFloat(angle))
        } else if (locationX > 285 && locationX < 325)  {
//            let trigonometry = TrigonometricFunctions()
            let hypotenuse = trigonometry.getHypotenuse(cathetusOpposite: 93, cathetusAdjacent: 45) //  45, 21
            let angle = trigonometry.getAngleSin(cathetusOpposite: 93, hypotenuse: CGFloat(hypotenuse))
            let yAxex2 = trigonometry.getCathetusOpposite(cathetusAdjacent: locationX, coTangent: CGFloat(angle))
            return (CGFloat(yAxex2 - 508), CGFloat(angle)) // 208
        } else {
//            let trigonometry = TrigonometricFunctions()
            let hypotenuse = trigonometry.getHypotenuse(cathetusOpposite: 21, cathetusAdjacent: 45) //  45, 21
            //        print("hypotenuse: \(hypotenuse)")
            let angle = trigonometry.getAngleSin(cathetusOpposite: 21, hypotenuse: CGFloat(hypotenuse))
            //        print("angle: \(angle)")
            let yAxex2 = trigonometry.getCathetusOpposite(cathetusAdjacent: locationX, coTangent: CGFloat(angle))
            //        print("yAxex2 Return: \(yAxex2)")
            return (CGFloat(yAxex2), CGFloat(angle))
            //        } else {
            //            return 50// - 77 - CGFloat(self.yAxes[indexesArray.indexStart])
            //            //return CGFloat(self.yAxes[indexesArray.IndexEnd])
            //            //return 150.0
            //        }
        }
    }
    
    func getInclinationAngle(indexStart: Int, indexEnd: Int) -> Inclination {
        let y1 = yAxes[indexStart]
        let y2 = yAxes[indexEnd]
        if y1 == y2 {
            return Inclination.noInclination
        } else { // Inclination positive
            return Inclination.inclination
        } // Inclination negative // TODO: add another condition
    }
    
    func getSegment(valueX: Double) -> Int {
        for (index, _) in self.xAxes.enumerated() {
            if index < self.xAxes.count - 1 { // -1
                let limitStart = self.xAxes[index]
                let limitEnd = self.xAxes[index+1]
                if (valueX >= limitStart) && (valueX <= limitEnd) {
                    return index
                }
            }
        }
        return -1
    }
    
    func getIndexFromArray(segment: Int) -> (indexStart: Int, IndexEnd: Int){
        if segment > 0 && segment < self.xAxes.count {
            return (segment - 1, segment)
        }
        return (0, 0) //(-1, -1)
    }
}
