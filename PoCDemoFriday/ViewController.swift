//
//  ViewController.swift
//  PoCDemoFriday
//
//  Created by Nivardo Ibarra on 6/22/17.
//  Copyright © 2017 bbva. All rights reserved.
//

import UIKit
import Charts

class ViewController: UIViewController {
    
    // MARK: - IBOulets
    @IBOutlet weak var barChartView: BarChartView!
    @IBOutlet var pieChartView: PieChartView!
    
    // MARK: - Variables
    var months: [String]!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.initialize()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    
    func initialize() { // initia...
        //        self.barChartView.noDataText = "You need to provide data for the chart."
        //        self.barChartView.noDataDescription = "GIVE REASON"
        //        months = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"]
        //        let unitsSold = [20.0, 4.0, 6.0, 3.0, 12.0, 16.0, 4.0, 18.0, 2.0, 4.0, 5.0, 4.0]
        //        self.setChart(dataPoints: months, values: unitsSold)
        //        self.barChartView.animate(xAxisDuration: 0.0, yAxisDuration: 1.0)
        self.setPieChartView()
        self.pieChartView.animate(xAxisDuration: 0.0, yAxisDuration: 1.0)
        self.setBarChartView()
        self.barChartView.animate(xAxisDuration: 1.0, yAxisDuration: 1.0)
    }
    
    func setChart(dataPoints: [String], values: [Double]) {
        barChartView.noDataText = "You need to provide data for the chart."
        var dataEntries: [BarChartDataEntry] = []
        
        for i in 0..<dataPoints.count {
            let dataEntry = BarChartDataEntry(x: values[i], y: Double(i))
            dataEntries.append(dataEntry)
        }
        let chartDataSet = BarChartDataSet(values: dataEntries, label: "Units sold")
        let chartData = BarChartData(dataSet: chartDataSet)
        barChartView.data = chartData
    }
    
    func setPieChartView() {
        // Do any additional setup after loading the view.
        let ys1 = Array(1..<10).map { x in return sin(Double(x) / 2.0 / 3.141 * 1.5) * 100.0 }
        
        let yse1 = ys1.enumerated().map { x, y in return PieChartDataEntry(value: y, label: String(x)) }
        
        let data = PieChartData()
        let ds1 = PieChartDataSet(values: yse1, label: "Hello")
        
        ds1.colors = ChartColorTemplates.vordiplom()
        
        data.addDataSet(ds1)
        
        let paragraphStyle: NSMutableParagraphStyle = NSParagraphStyle.default.mutableCopy() as! NSMutableParagraphStyle
        paragraphStyle.lineBreakMode = .byTruncatingTail
        paragraphStyle.alignment = .center
        //        let centerText: NSMutableAttributedString = NSMutableAttributedString(string: "Charts\nby Daniel Cohen Gindi")
        //        centerText.setAttributes([NSFontAttributeName: NSFont(name: "HelveticaNeue-Light", size: 15.0)!, NSParagraphStyleAttributeName: paragraphStyle], range: NSMakeRange(0, centerText.length))
        //        centerText.addAttributes([NSFontAttributeName: NSFont(name: "HelveticaNeue-Light", size: 13.0)!, NSForegroundColorAttributeName: NSColor.gray], range: NSMakeRange(10, centerText.length - 10))
        //        centerText.addAttributes([NSFontAttributeName: NSFont(name: "HelveticaNeue-LightItalic", size: 13.0)!, NSForegroundColorAttributeName: NSColor(red: 51 / 255.0, green: 181 / 255.0, blue: 229 / 255.0, alpha: 1.0)], range: NSMakeRange(centerText.length - 19, 19))
        
        //        self.pieChartView.centerAttributedText = centerText
        
        self.pieChartView.data = data
        
        self.pieChartView.chartDescription?.text = "Piechart Demo"
    }
    
    func setBarChartView() {
        // Do any additional setup after loading the view.
        let ys1 = [39.0, 40.0]
        let yse1 = ys1.enumerated().map { x, y in return BarChartDataEntry(x: Double(x), y: y) }
        
        let data = BarChartData()
        let ds1 = BarChartDataSet(values: yse1, label: "")
        ds1.colors = [NSUIColor.red]
        data.addDataSet(ds1)
        self.barChartView.data = data
        
        //        lineDataSet.drawCirclesEnabled = false // No circles
        //        lineDataSet.lineWidth = 10.0
        //        self.barChartView.drawValuesEnabled = false // Hidden the toggle values
        //        lineDataSet.mode = .linear
        
        self.barChartView.rightAxis.enabled = false
        self.barChartView.leftAxis.enabled = false
        self.barChartView.rightAxis.drawLabelsEnabled = false
        self.barChartView.leftAxis.drawLabelsEnabled = false
        self.barChartView.legend.enabled = false
        
        
        self.barChartView.xAxis.drawLabelsEnabled = false
        
        let xAxis: XAxis = barChartView.xAxis
        xAxis.drawAxisLineEnabled = false
        xAxis.drawGridLinesEnabled = false
        
        
        
        self.barChartView.gridBackgroundColor = NSUIColor.white
        self.barChartView.chartDescription?.text = ""
    }
    
    // MARK: - Unwind Segues
    @IBAction func cancelToPlayersViewController(_ segue:UIStoryboardSegue) {}
}
