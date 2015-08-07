//
//  VitalityIndicator.swift
//  HealthApp
//
//  Created by Alex Harrison on 8/7/15.
//  Copyright (c) 2015 Alex Harrison. All rights reserved.
//

import Foundation

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

class VitalityIcon:UIButton
{
    var line_color:UIColor = UIColor.whiteColor();
    var line_width:CGFloat = 2.0;
    
    init(frame: CGRect, var in_color:UIColor, var in_width:CGFloat)
    {
        super.init(frame: frame);
        backgroundColor = UIColor.clearColor();
        line_color = in_color;
        line_width = in_width;
        layer.borderWidth = 1.0;
        layer.borderColor = line_color.CGColor;
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func drawRect(rect: CGRect) {
        super.drawRect(rect);
        
        var path = CGPathCreateMutable();
        var start_x = rect.origin.x;
        var start_y = rect.origin.y;
        
        var bezier = UIBezierPath();
        
    }
}