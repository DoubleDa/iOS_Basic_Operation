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
        var dataArray = [5,3,1,2,7]
        // UIView
        let LineChart = PNLineChart(frame: CGRect(x: 0, y: (self.view.frame.width / 2), width: 400, height: 300))
        LineChart.setXLabels(["X1","X2","X3","X4","X5"], withWidth: 50)
        
        
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
        
        LineChart.chartData = [LineData,LineData2]
        LineChart.strokeChart()
        self.view.addSubview(LineChart)
    }
    func BarChart(){
        println("BarChart")
    }
    func CircleChart(){
        println("CircleChart")
    }
    func PieChart(){
        println("PieChart")
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
