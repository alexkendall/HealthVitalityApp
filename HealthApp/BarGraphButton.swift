//
//  BarGraph.swift
//  HealthApp
//
//  Created by Alex Harrison on 8/6/15.
//  Copyright (c) 2015 Alex Harrison. All rights reserved.
//

import Foundation
import UIKit
import CoreGraphics

class GraphIndicator:SpringBoardButton
{
    //-------------------------------------------------------------------------------------------------------
    
    override init(frame: CGRect, var in_color:UIColor, var in_width:CGFloat)
    {
        super.init(frame: frame, in_color: in_color, in_width: in_width);
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
        var height = rect.height;
        var width = rect.width;
        var num_points = 13;
        var bar_width:CGFloat = frame.width / CGFloat(num_points);
        
        
        // start path at bottom left corner of view
        CGPathMoveToPoint(path, nil, 0.0, height  * 0.5);
        CGPathAddLineToPoint(path, nil, 0.0, height * 0.5);
        CGPathAddLineToPoint(path, nil, 0.25 * width, height * 0.5);
        CGPathAddLineToPoint(path, nil, 0.25 * width, height);
        CGPathAddLineToPoint(path, nil, 0.25 * width, 0.1 * height);
        CGPathAddLineToPoint(path, nil, 0.5 * width, 0.1 * height);
        CGPathAddLineToPoint(path, nil, 0.5 * width, height);
        
        CGPathAddLineToPoint(path, nil, 0.5 * width, 0.6 * height);
        CGPathAddLineToPoint(path, nil, 0.75 * width, 0.6 * height);
        CGPathAddLineToPoint(path, nil, 0.75 * width, height);
        
        CGPathAddLineToPoint(path, nil, 0.75 * width, 0.3 * height);
        CGPathAddLineToPoint(path, nil, 1.0 * width, 0.3 * height);
        CGPathAddLineToPoint(path, nil, 1.0 * width, height * 0.5);
        
        line_color.setStroke();
        var bezier = UIBezierPath(CGPath: path);
        bezier.lineWidth = line_width
        bezier.stroke();
    }
    
    //-------------------------------------------------------------------------------------------------------
}