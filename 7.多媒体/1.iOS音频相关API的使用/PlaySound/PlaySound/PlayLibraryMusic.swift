//
//  PlayLibraryMusic.swift
//  PlaySound
//
//  Created by 游义男 on 15/6/6.
//  Copyright (c) 2015年 游义男. All rights reserved.
//

import UIKit
import MediaPlayer

class PlayLibraryMusic: UIViewController,MPMediaPickerControllerDelegate {

    var picker:MPMediaPickerController!
    var player:MPMusicPlayerController!
    
    @IBAction func TappedMusicBtn(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    @IBAction func TappedSelectMusicBtn(sender: AnyObject) {
        presentViewController(picker, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        picker = MPMediaPickerController(mediaTypes:MPMediaType.Music)
        picker.allowsPickingMultipleItems = true//选择多个音乐
        picker.delegate = self
        
//        player = MPMusicPlayerController.applicationMusicPlayer() //程序退出音乐停止
        player = MPMusicPlayerController.iPodMusicPlayer()
    }
    
    func mediaPicker(mediaPicker: MPMediaPickerController!, didPickMediaItems mediaItemCollection: MPMediaItemCollection!) {
        mediaPicker.dismissViewControllerAnimated(true, completion: nil)
        
        player.setQueueWithItemCollection(mediaItemCollection)
        player.play()
        
        var name: String = mediaItemCollection.items[0].valueForProperty(MPMediaItemPropertyTitle) as String
        println("\(name)")
        
        println("pick some \(mediaItemCollection)")
    }
    
    func mediaPickerDidCancel(mediaPicker: MPMediaPickerController!) {
        println("Cancel")
        mediaPicker.dismissViewControllerAnimated(true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
