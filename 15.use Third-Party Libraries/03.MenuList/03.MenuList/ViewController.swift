//
//  ViewController.swift
//  03.MenuList
//
//  Created by 游义男 on 15/8/31.
//  Copyright (c) 2015年 游义男. All rights reserved.
//

import UIKit

class ViewController: UIViewController,AwesomeMenuDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        var storyMenuImage = UIImage(named: "bg-menuitem.png")
        var storyMenuImagePressed = UIImage(named: "bg-menuitem-highlighted.png")
        var startImage = UIImage(named: "icon-star")
        
        var item1 = AwesomeMenuItem(image: storyMenuImage, highlightedImage: storyMenuImagePressed, contentImage: startImage, highlightedContentImage: nil)
        var item2 = AwesomeMenuItem(image: storyMenuImage, highlightedImage: storyMenuImagePressed, contentImage: startImage, highlightedContentImage: nil)
        var item3 = AwesomeMenuItem(image: storyMenuImage, highlightedImage: storyMenuImagePressed, contentImage: startImage, highlightedContentImage: nil)
        var item4 = AwesomeMenuItem(image: storyMenuImage, highlightedImage: storyMenuImagePressed, contentImage: startImage, highlightedContentImage: nil)
        var item5 = AwesomeMenuItem(image: storyMenuImage, highlightedImage: storyMenuImagePressed, contentImage: startImage, highlightedContentImage: nil)
        
        var addMenu = AwesomeMenuItem(image: UIImage(named: "bg-addbutton.png"), highlightedImage: UIImage(named: "bg-addbutton-highlighted.png"), contentImage: UIImage(named: "icon-plus.png"), highlightedContentImage: UIImage(named: "icon-plus-highlighted.png"))
        var menu = AwesomeMenu(frame: self.view.frame, startItem: addMenu, menuItems: [item1,item2,item3,item4,item5])
        menu.delegate = self
        self.view.addSubview(menu)
        
        menu.rotateAngle = (CGFloat)(M_PI)/2    // menuItem呈现的位置（顺时针旋转弧度制）
        menu.menuWholeAngle = (CGFloat)(M_PI)/2 // 菜单的呈现范围大小（弧度制）
        
        menu.timeOffset = 0.1 // dispaly delay
        menu.farRadius = 200
        menu.nearRadius = 100
        menu.endRadius = 150
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    /**
    *  AwesomeMenuDelegate
    */
    func awesomeMenu(menu: AwesomeMenu!, didSelectIndex idx: Int) {
        print("\(idx)")
    }
}

