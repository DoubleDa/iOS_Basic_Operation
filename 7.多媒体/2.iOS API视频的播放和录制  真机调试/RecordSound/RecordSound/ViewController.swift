//
//  ViewController.swift
//  RecordSound
//
//  Created by 游义男 on 15/6/6.
//  Copyright (c) 2015年 游义男. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    var avRecord:AVAudioRecorder!
    var audioFileUrl:NSURL!
    var avPlayer:AVAudioPlayer!
    
    @IBAction func TappedPlayBtn(sender: AnyObject) {
        println("play")
        avPlayer = AVAudioPlayer(contentsOfURL: audioFileUrl, error: nil)
        avPlayer.prepareToPlay()
        avPlayer.play()
    }
    @IBAction func TappedPauseBtn(sender: AnyObject) {
        println("Pause")
        avRecord.stop()
    }
    @IBAction func TappedBeginBtn(sender: AnyObject) {
        println("start")
        avRecord.record()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        audioFileUrl = (NSFileManager.defaultManager().URLsForDirectory(NSSearchPathDirectory.DocumentDirectory, inDomains: NSSearchPathDomainMask.AllDomainsMask) [0] as NSURL).URLByAppendingPathComponent("rec")
        avRecord = AVAudioRecorder(URL: audioFileUrl, settings: nil, error: nil)
        avRecord.prepareToRecord()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

