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

class LocationIndicator:SpringBoardButton
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
        var margin:CGFloat = rect.height * 0.15;
        var dimple_margin:CGFloat = rect.height * 0.65;
        var midpoint:CGFloat = frame.width * 0.5;
        
        // start path at bottom left corner of view
        CGPathMoveToPoint(path, nil, midpoint, margin);
        CGPathAddLineToPoint(path, nil, margin, rect.height - margin);
        CGPathAddLineToPoint(path, nil, midpoint, dimple_margin);
        CGPathAddLineToPoint(path, nil, rect.width - margin, rect.height - margin);
        CGPathAddLineToPoint(path, nil, midpoint, margin);
        line_color.setStroke();

        var bezier = UIBezierPath(CGPath: path);
        bezier.lineWidth = line_width
        bezier.stroke();
        self.layer.cornerRadius = frame.width * 0.25;
        
    }
    
    //-------------------------------------------------------------------------------------------------------
}