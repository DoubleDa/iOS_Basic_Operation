//
//  ViewController.swift
//  Questions
//
//  Created by 游义男 on 15/4/28.
//  Copyright (c) 2015年 游义男. All rights reserved.
//

import UIKit

class ViewController: UIViewController ,NSXMLParserDelegate{

    @IBOutlet weak var LQuestion: UILabel!
    
    @IBOutlet weak var LAnwswerA: UILabel!
    
    @IBOutlet weak var LAnwswerB: UILabel!
    
    
    @IBOutlet weak var LAnwswerC: UILabel!
    
    @IBOutlet weak var LAnwserD: UILabel!
    
    
    @IBOutlet weak var tfInputAnswer: UITextField!
    
    @IBOutlet weak var btnSubmit: UIButton!
    
   var questions:Array<Question> = []
    var currentQuestion:Question!
    var currentShowQuestion:Question!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        var parser = NSXMLParser(contentsOfURL: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("questions", ofType: "xml")!))
        parser?.delegate = self
        parser?.parse()
    }

    
    func parser(parser: NSXMLParser!, didStartElement elementName: String!, namespaceURI: String!, qualifiedName: String!, attributes: [NSObject : AnyObject]!){
        if  elementName ==  "question"{
            currentQuestion = Question()
            questions.append(currentQuestion)
            currentQuestion.question = attributes["text"]! as String
            currentQuestion.right = attributes["right"]! as String
        }else if elementName == "anwser"{
           var tag = attributes["tag"]! as String
            if tag == "A"{
                currentQuestion.anwserA = attributes["text"]! as String
            }else if tag == "B"{
                currentQuestion.anwserB = attributes["text"]! as String
            }else if tag == "C"{
                currentQuestion.anwserC = attributes["text"]! as String
            }else if tag == "D"{
                currentQuestion.anwserD = attributes["text"]! as String
            }
 

        }
    }
    
     func parserDidEndDocument(parser: NSXMLParser!) {
      // println("Size of array :\(questions.count)")
        currentShowQuestion = questions[0]
        LQuestion.text = currentShowQuestion.question
        LAnwswerA.text = currentShowQuestion.anwserA
        LAnwswerB.text = currentShowQuestion.anwserB
        LAnwswerC.text = currentShowQuestion.anwserC
        LAnwserD.text = currentShowQuestion.anwserD
        
        
    }
    
    @IBAction func btnSubmitTapped(sender: AnyObject) {
        if tfInputAnswer.text == currentShowQuestion.right{
            println("正确")
        }else{
            println("错误")
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

