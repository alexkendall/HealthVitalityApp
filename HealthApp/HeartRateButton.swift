//
//  heart_rate.swift
//  HealthApp
//
//  Created by Alex Harrison on 8/6/15.
//  Copyright (c) 2015 Alex Harrison. All rights reserved.
//

import Foundation
import UIKit
import CoreGraphics

class HeartRateIndicator:SpringBoardButton
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
        
        //var x_vals = [CGFloat]();
        
        var num_points = 7;
        var offset_x:CGFloat = height * 0.5;
        var x1 = width * 0.2;
        var x2 = width * 0.3;
        var x3 = width * 0.4;
        var x4 = width * 0.55;
        var x5 = width * 0.67;
        var x6 = width * 0.73;
        var x7 = width * 1.0;
        var x_vals = [x1, x2, x3, x4, x5, x6, x7];
        
        // y vals
        var offset_y:CGFloat = height * 0.5;
        var y1 = offset_y + (0.0 * height);
        var y2 = offset_y - (0.5 * height);
        var y3 = offset_y + (0.5 * height);
        var y4 = offset_y - (0.25 * height);
        var y5 = offset_y + (0.25 * height);
        var y6 = offset_y - (0.0 * height);
        var y7 = offset_y + (0.0 * height);
        var y_vals = [y1, y2, y3, y4, y5, y6, y7];
        
        CGPathMoveToPoint(path, nil, 0.0, height * 0.5);
        for(var i = 0; i < num_points; ++i)
        {
            CGPathAddLineToPoint(path, nil, x_vals[i], y_vals[i]);
        }
        
        self.layer.cornerRadius = frame.width * 0.25;
        
        line_color.setStroke();
        var bezier = UIBezierPath(CGPath: path);
        bezier.lineWidth = line_width
        bezier.stroke();
    }
    
    //-------------------------------------------------------------------------------------------------------
}