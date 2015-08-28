//
//  LineView.swift
//  02.Test
//
//  Created by 游义男 on 15/8/27.
//  Copyright (c) 2015年 游义男. All rights reserved.
//

import UIKit

class LineView: UIView {

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */
    
    var labelTitle = ["动态","关注","粉丝","文章","文集"]
    
    override func drawRect(rect: CGRect) {
        var context = UIGraphicsGetCurrentContext()
        CGContextSetRGBStrokeColor(context, 0, 0, 0, 0.3)
        CGContextSetLineWidth(context, 0.5)
        
        for (var i = 1;i<5 ;i++){
            CGContextMoveToPoint(context,(CGFloat)(i)*rect.width/5, 10)
            CGContextAddLineToPoint(context,(CGFloat)(i)*rect.width/5, rect.height - 10)
        }
        CGContextMoveToPoint(context, 0, 5)
        CGContextAddLineToPoint(context, rect.width, 5)
        
        CGContextMoveToPoint(context, 0, rect.height)
        CGContextAddLineToPoint(context, rect.width, rect.height - 5)
        
        CGContextStrokePath(context)
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.whiteColor()
        for var i = 0;i<5;i++ {
            var label = UILabel(frame: CGRect(x: (CGFloat)(i) * frame.width/5, y: frame.height/3, width: frame.width/5, height: frame.height/3 * 2))
            
            label.text = labelTitle[i]
            label.textColor = UIColor.grayColor()
            label.font = UIFont.systemFontOfSize(13)
            label.textAlignment = NSTextAlignment.Center
            self.addSubview(label)
        }
    }

    required init(coder aDecoder: NSCoder) {
       super.init(coder: aDecoder)
    }
}
