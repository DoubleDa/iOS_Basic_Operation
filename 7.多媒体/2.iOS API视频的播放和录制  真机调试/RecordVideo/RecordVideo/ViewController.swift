//
//  ViewController.swift
//  RecordVideo
//
//  Created by 游义男 on 15/6/6.
//  Copyright (c) 2015年 游义男. All rights reserved.
//

import UIKit
import MobileCoreServices
import MediaPlayer

class ViewController: UIViewController ,UIImagePickerControllerDelegate,UINavigationControllerDelegate{

    var picker:UIImagePickerController!//select image video(Library,摄像头)
    var videoUrl:NSURL?
    var player:MPMoviePlayerViewController!

    @IBAction func TappedRecordVideoBtn(sender: AnyObject) {
        if let url = videoUrl{
            player = MPMoviePlayerViewController(contentURL: url)
            presentViewController(player, animated: true, completion: nil)
        }
    }
    @IBAction func TappedPlayVideoBtn(sender: AnyObject) {
        picker = UIImagePickerController()
        picker.mediaTypes = [kUTTypeMovie!]
        picker.sourceType = UIImagePickerControllerSourceType.Camera
        picker.cameraCaptureMode = UIImagePickerControllerCameraCaptureMode.Video
        picker.delegate = self
        presentViewController(picker, animated: true, completion: nil)
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [NSObject : AnyObject]) {
        videoUrl = info[UIImagePickerControllerMediaURL] as? NSURL
        picker.dismissViewControllerAnimated(true, completion: nil)
    }
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        picker.dismissViewControllerAnimated(true, completion: nil)
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

