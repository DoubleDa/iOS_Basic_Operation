//
//  ViewController.swift
//  1.Navtive
//
//  Created by 游义男 on 15/8/4.
//  Copyright (c) 2015年 游义男. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var labelTem: UILabel!
    @IBOutlet weak var labelWeather: UILabel!
    @IBOutlet weak var labelLocation: UILabel!
    @IBOutlet weak var imageViewBarcode: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //确定URL
        let url = NSURL(string: "http://api.k780.com:88/?app=qr.get&data=baidu.com&level=L&size=10")!
        //确定Request
        let request = NSURLRequest(URL: url)
        
        //发送Request,异步请求系统开辟一个线程，完成之后做哪些操作，和主线程不在一个UI中
        // 可以修改队列的优先级来加快速度
         NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue()) { (_, data, error) -> Void in
            //确定data是什么类型的数据，print(data) 看看什么类型(二进制图像)
            if error == nil {
                //闭包内引用参数要显示归属 self
                dispatch_async(dispatch_get_main_queue(), { () -> Void in
                    self.imageViewBarcode.image = UIImage(data: data)
                })
                
            }
        }
        NSURLConnection.sendAsynchronousRequest(NSURLRequest(URL: NSURL(string: "http://api.k780.com:88/?app=weather.future&weaid=1&&appkey=10003&sign=b59bc3ef6191eb9f747dd4e83c99f2a4&format=json")!), queue: NSOperationQueue()) { (_, data, error) -> Void in
            if error == nil {
                if let json = NSJSONSerialization.JSONObjectWithData(data, options: nil, error: nil) as? NSDictionary{
                    //直接使用下标,或者下面的方法
                    let result = json.valueForKey("result") as! NSArray
                    let tody = result[0] as! NSDictionary
                    //对UI的操作放入主线程
                    dispatch_async(dispatch_get_main_queue(), { () -> Void in
                        self.labelLocation.text = tody.valueForKey("cityno") as? String
                        //self.labelLocation.text = tody["cityno"] as? String
                        self.labelWeather.text = tody.valueForKey("weather") as? String
                        self.labelTem.text = tody.valueForKey("temperature") as? String

                    })
                    
                }
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

