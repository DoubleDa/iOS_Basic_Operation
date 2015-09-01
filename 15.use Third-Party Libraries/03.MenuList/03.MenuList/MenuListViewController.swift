//
//  MenuListViewController.swift
//  03.MenuList
//
//  Created by 游义男 on 15/8/31.
//  Copyright (c) 2015年 游义男. All rights reserved.
//

import UIKit

class MenuListViewController: UIViewController {
    var type: String!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.whiteColor()
        // Do any additional setup after loading the view.
        switch type {
        case "Line Chart":
            self.LineChart()
        case "Bar Chart" :
            self.BarChart()
        case "Circle Chart" :
            self.CircleChart()
        case "Pie Chart" :
            self.PieChart()
        default :
            println("error")
        }
    }
    


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /**
    点击tableviewcell响应事件
    */
    func LineChart(){
        println("LineChart")

        // UIView
        let LineChart = PNLineChart(frame: CGRect(x: 0, y: (self.view.frame.width / 2), width: 400, height: 300))
        LineChart.setXLabels(["X1","X2","X3","X4","X5"], withWidth: 50)
        
        var dataArray = [5,3,1,2,7]
        let LineData = PNLineChartData()
        LineData.color = UIColor.redColor()
        LineData.itemCount = (UInt)(dataArray.count)
        LineData.getData = ({(index:UInt) ->PNLineChartDataItem in
            let y: CGFloat = (CGFloat)(dataArray[(Int)(index)])
            return PNLineChartDataItem(y: y)
        })
        
        var dataArray2 = [1,4,5,8,2]
        let LineData2 = PNLineChartData()
        LineData2.color = UIColor.blueColor()
        LineData2.itemCount = (UInt)(dataArray.count)
        LineData2.getData = ({(index:UInt) ->PNLineChartDataItem in
            let y: CGFloat = (CGFloat)(dataArray2[(Int)(index)])
            return PNLineChartDataItem(y: y)
        })
        
        var dataArray3 = [2,5,7,6,3]
        let LineData3 = PNLineChartData()
        LineData3.color = UIColor.yellowColor()
        LineData3.itemCount = (UInt)(dataArray.count)
        LineData3.getData = ({(index:UInt) ->PNLineChartDataItem in
            let y: CGFloat = (CGFloat)(dataArray3[(Int)(index)])
            return PNLineChartDataItem(y: y)
        })
        
        LineChart.chartData = [LineData,LineData2,LineData3]
        LineChart.strokeChart()
        self.view.addSubview(LineChart)
    }
    func BarChart(){
        println("BarChart")
        let barChart = PNBarChart(frame: CGRect(x: 0, y: (self.view.frame.width / 2), width: 400, height: 300))
        barChart.xLabels = ["X1","X2","X3","X4","X5"]
        barChart.yValues = ["5","1","9","4","6"]
        barChart.strokeChart()
        self.view.addSubview(barChart)
    }
    func CircleChart(){
        println("CircleChart")
        let CircleChart = PNCircleChart(frame:  CGRectMake(0, (self.view.frame.width / 2), 400, 300), total: NSNumber(double: 100), current: NSNumber(double: 60), clockwise: false, shadow: false, shadowColor: UIColor.redColor())
        CircleChart.strokeColor = UIColor.blueColor()
        CircleChart.strokeChart()
        self.view.addSubview(CircleChart)
    }
    func PieChart(){
        println("PieChart")
        let items = [PNPieChartDataItem(value: 20, color: UIColor.grayColor(), description: "YouYinan"),
            PNPieChartDataItem(value: 30, color: UIColor.blueColor(), description: "游义男"),
            PNPieChartDataItem(value: 50, color: UIColor.redColor(), description: "Others")]
        let pieChart = PNPieChart(frame: CGRect(x: 0, y: (self.view.frame.width / 2), width: (self.view.frame.width) , height: 300),items:items)
        pieChart.descriptionTextFont = UIFont.systemFontOfSize(14)
        pieChart.descriptionTextColor = UIColor.whiteColor()
        pieChart.strokeChart()
        self.view.addSubview(pieChart)
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
