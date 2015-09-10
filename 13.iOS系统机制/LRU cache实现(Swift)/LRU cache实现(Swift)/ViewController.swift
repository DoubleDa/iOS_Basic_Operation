//
//  ViewController.swift
//  LRU cache实现(Swift)
//
//  Created by 游义男 on 15/9/10.
//  Copyright © 2015年 游义男. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        var cache = LRU<String,Float>(capacity: 7)
        
        cache["AAPL"] = 114.63
        cache["GOOG"] = 533.75
        cache["YHOO"] = 50.67
        cache["TWTR"] = 38.91
        cache["BABA"] = 109.89
        cache["YELP"] = 55.17
        cache["BABA"] = 109.80
        cache["TSLA"] = 231.43
        cache["AAPL"] = 113.41
        cache["GOOG"] = 533.60
        cache["AAPL"] = 113.01
        
        /**
            retrieve
        */
        if let item = cache["AAPL"]{
            print("Key:AAPL Value: \(item)")
        }else{
            print("Item not found")
        }
        
        print(cache)

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

