//
//  VitalityIndicator.swift
//  HealthApp
//
//  Created by Alex Harrison on 8/5/15.
//  Copyright (c) 2015 Alex Harrison. All rights reserved.
//

import Foundation
import UIKit

class VitalityIndicator:UIView
{
    var label = UILabel();
    override init(frame: CGRect)
    {
        super.init(frame: frame);
        backgroundColor = UIColor.clearColor();
    }
    
    override func drawRect(rect: CGRect)
    {
        super.drawRect(rect);
        var ctx = UIGraphicsGetCurrentContext();
        var path = CGPathCreateMutable();
        var line_width:CGFloat = frame.width * 0.2;
        var height = bounds.height * 0.8;
        var offset = bounds.height * 0.1;
        
        // draw outer circle
        var outer_circle = UIBezierPath(ovalInRect: CGRect(x: offset, y: offset, width: height, height: height));
        UIColor.orangeColor().setStroke();
        outer_circle.lineWidth = height * 0.1;
        outer_circle.stroke();
        
        
        // create label in middle
        var label = UILabel();
        label.frame = rect;
        label.textColor = UIColor.whiteColor();
        label.text = "45";
        label.font = UIFont.systemFontOfSize(40.0);
        label.textAlignment = NSTextAlignment.Center;
        addSubview(label);
        
    }
    
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}