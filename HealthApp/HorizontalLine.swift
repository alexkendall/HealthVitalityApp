//
//  hr_break.swift
//  HealthApp
//
//  Created by Alex Harrison on 8/5/15.
//  Copyright (c) 2015 Alex Harrison. All rights reserved.
//

import Foundation
import UIKit
import CoreGraphics

class HorizontalLine:UIView
{
    
    //-------------------------------------------------------------------------------------------------------
    
    var line_color:UIColor = UIColor.whiteColor();
    var line_width:CGFloat = 2.0;
    init(frame: CGRect, var in_color:UIColor, var in_width:CGFloat)
    {
        super.init(frame: frame);
        backgroundColor = UIColor.clearColor();
        line_color = in_color;
        line_width = in_width;
    }
    
    //-------------------------------------------------------------------------------------------------------

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //-------------------------------------------------------------------------------------------------------
    
    override func drawRect(rect: CGRect) {
        super.drawRect(rect);
        
        var path = CGPathCreateMutable();
        var start_x = rect.origin.x;
        var start_y = rect.origin.y;
        CGPathMoveToPoint(path, nil, rect.minX, rect.minY);
        CGPathAddLineToPoint(path, nil, rect.maxX, rect.minY);
        line_color.setStroke();
        var bezier = UIBezierPath(CGPath: path);
        bezier.lineWidth = line_width
        bezier.stroke();
    }
}