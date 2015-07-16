//
//  ViewController.swift
//  ParsseXMl
//
//  Created by 游义男 on 15/4/28.
//  Copyright (c) 2015年 游义男. All rights reserved.
//

import UIKit

class ViewController: UIViewController , NSXMLParserDelegate {

    var currentNodeName :String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        var parser = NSXMLParser(contentsOfURL:NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("data", ofType: "xml")!, isDirectory: true))
        
        parser?.delegate = self
        parser?.parse()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func parser(parser: NSXMLParser!, didStartElement elementName: String!, namespaceURI: String!, qualifiedName qName: String!, attributes attributeDict: [NSObject : AnyObject]!) {
        
        currentNodeName = ""
        if elementName == "person" {
            
            if let age: AnyObject? = attributeDict["age"]{
                println("age:\(age!)")
            }
            
        }
        // println(elementName)
        
        func parser(parser: NSXMLParser!, foundCharacters string: String!){
          //  println(string)
            var str = string.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet())
            //String.stringByTrimmingCharactersInSet(NSString.whitespaceCharacterSet())
            if str != ""{
                println("current node :\(self.currentNodeName),value:\(str)")
            }
        }
    }

}

