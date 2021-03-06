//
//  ViewController.swift
//  ParseXML
//
//  Created by 游义男 on 15/7/17.
//  Copyright (c) 2015年 游义男. All rights reserved.
//

import UIKit

class ViewController: UIViewController ,NSXMLParserDelegate{

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //create XML parse object
        var parser = NSXMLParser(contentsOfURL: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("data", ofType: "xml")!)!)
       //delegate find a new node notice delegate
        parser?.delegate = self
        parser?.parse()
    }
    
    var currentNodeName:String!
    
    func parser(parser: NSXMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [NSObject : AnyObject]){
//        println(elementName)
        currentNodeName = elementName
        if elementName ==  "person"{
            if let  age: AnyObject = attributeDict["age"]{
                println("age:\(age)")
            }
        }
    }
    func parser(parser: NSXMLParser, foundCharacters string: String!) {
//        println(string!)
        var str = string.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())
        if str != ""{
            println("current node : \(currentNodeName),value : \(str)")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

