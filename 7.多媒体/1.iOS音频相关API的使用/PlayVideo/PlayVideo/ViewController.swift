//
//  ViewController.swift
//  PlayVideo
//
//  Created by 游义男 on 15/6/6.
//  Copyright (c) 2015年 游义男. All rights reserved.
//

import UIKit
import MediaPlayer

class ViewController: UIViewController {

    var pc:MPMoviePlayerViewController!
    @IBAction func TappedPlayVideoBtn(sender: AnyObject) {
        pc = MPMoviePlayerViewController(contentURL: NSBundle.mainBundle().URLForResource("video", withExtension: "mp4"))
        presentViewController(pc, animated: true, completion: nil)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

