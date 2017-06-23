//
//  TotalExpensesViewController.swift
//  DemoCharts
//
//  Created by Nivardo Ibarra on 6/22/17.
//  Copyright © 2017 Nivardo Ibarra. All rights reserved.
//

import UIKit
import Charts

class TotalExpensesViewController: UIViewController {
    
    // MARK: - IBOulets
    @IBOutlet weak var lineChartView: LineChartView!
    
    // MARK: - Variables

    override func viewDidLoad() {
        super.viewDidLoad()
        self.initialize()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func initialize() {
        self.setCustomLine()
        self.lineChartView.animate(xAxisDuration: 0.0, yAxisDuration: 1.0)
    }
    
    func setCustomLine() {
        // Do any additional setup after loading the view.
        let ys1 = [2.0, 40.0, 40.0, 88.0, 88.0, 88.0, 120.0, 300.0]
        let yse1 = ys1.enumerated().map { x, y in return ChartDataEntry(x: Double(x), y: y) }
        
        let data = LineChartData()
        let lineDataSet = LineChartDataSet(values: yse1, label: "") //LineChartDataSet(values: yse1, label: "Hello")
        lineDataSet.colors = [AppColors.blue_5BBEFF.color] //[NSUIColor.red]
        
//        
        lineDataSet.drawCirclesEnabled = false // No circles
        lineDataSet.lineWidth = 10.0
        lineDataSet.drawValuesEnabled = false // Hidden the toggle values
        lineDataSet.mode = .linear
        
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
        
        
        let xAxis: XAxis = lineChartView.xAxis
        xAxis.drawAxisLineEnabled = false
        xAxis.drawGridLinesEnabled = false

        
        
        /*self.lineChartView.gridBackgroundColor = NSUIColor.red //NSUIColor.white
        self.lineChartView.chartDescription?.text = "Linechart Demo" */
        
//        self.lineChartView.drawCirclesEnabled = false
    }
    
    // MARK: - Unwind Segues
    @IBAction func cancelToPlayersViewController(_ segue:UIStoryboardSegue) {}
}
