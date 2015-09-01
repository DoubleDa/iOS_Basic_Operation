//
//  SpotlightViewController.swift
//  03.MenuList
//
//  Created by 游义男 on 15/9/1.
//  Copyright (c) 2015年 游义男. All rights reserved.
//

import UIKit

class SpotlightViewController: UIViewController ,XSportLightDelegate{

    let WIDTH = UIScreen.mainScreen().bounds.size.width
    let HEIGHT = UIScreen.mainScreen().bounds.size.height
    
    @IBAction func TappedBackButton(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: { () -> Void in
            
        })
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewWillAppear(animated: Bool) {
        var firstAppear = NSUserDefaults.standardUserDefaults().objectForKey("firstLogin") as? Bool
        if firstAppear != true {
            NSUserDefaults.standardUserDefaults().setObject(true, forKey: "firstLogin")
            var sportLight = XSportLight()
            sportLight.messageArray = [
                "这是简书","点击这里撰写文章","搜索文章","这将会是下一节内容"
            ]
            sportLight.rectArray = [
                NSValue(CGRect:CGRectMake(0, 0, 0, 0)),
                NSValue(CGRect:CGRectMake(WIDTH/2, HEIGHT - 20, 50, 50)),
                NSValue(CGRect:CGRectMake(WIDTH/2, HEIGHT - 20, 50, 50)),
                NSValue(CGRect:CGRectMake(WIDTH/2, HEIGHT - 20, 0, 0))
            ]
            sportLight.delegate = self
            
            self.presentViewController(sportLight, animated: false, completion: { () -> Void in
                
                })
            }
        }
    func XSportLightClicked(index: Int) {
        println(index)
    }
    
    }


    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */


