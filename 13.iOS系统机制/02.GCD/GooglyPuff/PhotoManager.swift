//
//  PhotoManager.swift
//  GooglyPuff
//
//  Created by Bjørn Olav Ruud on 06.08.14.
//  Copyright (c) 2014 raywenderlich.com. All rights reserved.
//

import Foundation

/// Notification when new photo instances are added
let PhotoManagerAddedContentNotification = "com.raywenderlich.GooglyPuff.PhotoManagerAddedContent"
/// Notification when content updates (i.e. Download finishes)
let PhotoManagerContentUpdateNotification = "com.raywenderlich.GooglyPuff.PhotoManagerContentUpdate"

typealias PhotoProcessingProgressClosure = (completionPercentage: CGFloat) -> Void
typealias BatchPhotoDownloadingCompletionClosure = (error: NSError?) -> Void

private let _sharedManager = PhotoManager()

class PhotoManager {
  class var sharedManager: PhotoManager {
    return _sharedManager
  }

  private var _photos: [Photo] = []
  var photos: [Photo] {
    // FIXME: Not thread-safe
    var photosCopy:[Photo]!
    dispatch_sync(concurrentPhotoQueue, { () -> Void in
      photosCopy = self._photos
    })
    
    return photosCopy
  }
  
  // 自定义并发队列，处理屏障函数隔离读写操作
  // 使用dispatch_queue_create初始化一个并发队列concurrentPhotoQueue。第一个参数遵循反向DNS命名习惯；保证描述性以利于调试。第二个参数指出你的队列是顺序(SERIAL)的还是并发的(CONCURRENT)
//  注意：当在网上搜索例子时，你经常看到人们传0或NULL作为dispatch_queue_create的第二个参数。这是一种过时的方法来生成顺序调度队列；最好用参数显示声明。
  private let concurrentPhotoQueue = dispatch_queue_create("com.raywenderlich.GooglyPuff.photoQueue", DISPATCH_QUEUE_CONCURRENT)

  func addPhoto(photo: Photo) {
    // FIXME: Not thread-safe
//    _photos.append(photo)
//    dispatch_async(dispatch_get_main_queue()) {
//      self.postContentAddedNotification()
//    }
    dispatch_barrier_async(concurrentPhotoQueue, { () -> Void in
      self._photos.append(photo)
      dispatch_async(GlobalMainQueue, { () -> Void in
        self.postContentAddedNotification()
      })
    })
    
  }

  func downloadPhotosWithCompletion(completion: BatchPhotoDownloadingCompletionClosure?) {
    var storedError: NSError?
    for address in [OverlyAttachedGirlfriendURLString,
                    SuccessKidURLString,
                    LotsOfFacesURLString] {
      let url = NSURL(string: address)
      let photo = DownloadPhoto(url: url!) {
        image, error in
        if error != nil {
          storedError = error
        }
      }
      PhotoManager.sharedManager.addPhoto(photo)
    }

    if let completion = completion {
      completion(error: storedError)
    }
  }

  private func postContentAddedNotification() {
    NSNotificationCenter.defaultCenter().postNotificationName(PhotoManagerAddedContentNotification, object: nil)
  }
}
