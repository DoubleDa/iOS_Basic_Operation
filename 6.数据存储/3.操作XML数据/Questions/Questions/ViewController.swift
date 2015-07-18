//
//  ViewController.swift
//  Questions
//
//  Created by 游义男 on 15/7/17.
//  Copyright (c) 2015年 游义男. All rights reserved.
//

import UIKit

class ViewController: UIViewController ,NSXMLParserDelegate {

    @IBOutlet weak var inputTextField: UITextField!
    @IBOutlet weak var answerDLabel: UILabel!
    @IBOutlet weak var answerCLabel: UILabel!
    @IBOutlet weak var answerBLabel: UILabel!
    @IBOutlet weak var answerALabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    
    var questions:Array<Question> = []
    var currentQuestion:Question!
    var currrentShowQuestion:Question!

    @IBAction func TappedSubmitBtn(sender: AnyObject) {
        if inputTextField.text == currrentShowQuestion.right{
            println("right")
        }else{
            println("error")
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        var parser = NSXMLParser(contentsOfURL: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("questions", ofType: "xml")!)!)
        parser!.delegate = self
        parser!.parse()
    }

    func parser(parser: NSXMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [NSObject : AnyObject]) {
        if elementName == "question"{
            currentQuestion = Question()
            questions.append(currentQuestion)
            currentQuestion.question = attributeDict["text"]! as! String
            currentQuestion.right = attributeDict["right"]! as! String
            
        }else if elementName == "answer"{
            var tag = attributeDict["tag"]! as! String
            if tag == "A"{
                currentQuestion.answerA = attributeDict["text"]! as! String
            }else if tag == "B"{
                currentQuestion.answerB = attributeDict["text"]! as! String
            }else if tag == "C"{
                currentQuestion.answerC = attributeDict["text"]! as! String
            }else if tag == "D"{
                currentQuestion.answerD = attributeDict["text"]! as! String
            }
        }
    }
    
    func parserDidEndDocument(parser: NSXMLParser) {
//        println("Size of array : \(questions.count)")
        currrentShowQuestion = questions[0]
        questionLabel.text = currrentShowQuestion.question
        answerALabel.text = currrentShowQuestion.answerA
        answerBLabel.text = currrentShowQuestion.answerB
        answerCLabel.text = currrentShowQuestion.answerC
        answerDLabel.text = currrentShowQuestion.answerD
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

