//
//  ViewController.swift
//  PlaySound
//
//  Created by 游义男 on 15/6/6.
//  Copyright (c) 2015年 游义男. All rights reserved.
//

import UIKit
import AVFoundation
import MediaPlayer

class ViewController: UIViewController {
    
    var aPlayer:AVAudioPlayer!
    
    
    @IBAction func TappedPlayMusicBtn(sender: AnyObject) {
        var music = MPMoviePlayerViewController(contentURL: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("sound", ofType: "mp3")!));
        presentViewController(music, animated: true, completion: nil)
    }
    @IBAction func TappedStopBtn(sender: AnyObject) {
        aPlayer.stop()
        aPlayer.currentTime = 0
    }
    @IBAction func TappedPauseBtn(sender: AnyObject) {
        aPlayer.pause()
    }
    @IBAction func TappedPlayBtn(sender: AnyObject) {
        aPlayer.play()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        aPlayer = AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("sound", ofType: "mp3")!), error: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

