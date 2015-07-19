//
//  ProgressControl.swift
//  CustomizeControls
//
//  Created by 游义男 on 15/7/19.
//  Copyright (c) 2015年 游义男. All rights reserved.
//

import UIKit

class ProgressControl: UIView {
    
    private var _progressValue:CGFloat! = 0.0
    

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor(white: 1, alpha: 0)
    }
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    internal func getProgressValue()->CGFloat{
        return _progressValue
    }
    internal func setProgressValue(value:CGFloat){
        _progressValue = value
        
        // 重绘
        setNeedsDisplay()
    }
    
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
        var context = UIGraphicsGetCurrentContext()
        var radius = rect.width/2
        
        CGContextAddArc(context, radius, radius, radius, 0, 3.1415926*2, 0)
        CGContextSetRGBFillColor(context, 0.7, 0.7, 0.7, 1)
        CGContextFillPath(context)
        
        CGContextAddArc(context, radius, radius, radius, 0, 2*3.141592653*_progressValue, 0)
        CGContextAddLineToPoint(context, radius, radius)
        CGContextSetRGBFillColor(context, 0, 0, 1, 1)
        CGContextFillPath(context)
    }


}
