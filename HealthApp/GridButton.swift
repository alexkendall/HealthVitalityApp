//
//  GridButton.swift
//  HealthApp
//
//  Created by Alex Harrison on 8/5/15.
//  Copyright (c) 2015 Alex Harrison. All rights reserved.
//

import Foundation

import Foundation
import UIKit
import CoreGraphics

class GridButton:UIButton
{
    var grid_color:UIColor = UIColor.whiteColor();
    
    //-------------------------------------------------------------------------------------------------------
    
    override init(frame: CGRect)
    {
        super.init(frame: frame);
        self.layer.cornerRadius = self.bounds.width * 0.5;
    }
    
    //-------------------------------------------------------------------------------------------------------
    
    init(frame: CGRect, color:UIColor)
    {
        super.init(frame: frame);
        grid_color = color;
        backgroundColor = UIColor.clearColor();
    }
    
    //-------------------------------------------------------------------------------------------------------
    
    override func drawRect(rect: CGRect) {
        super.drawRect(rect);
        
        var num_rows:Int = 3;
        var num_cols:Int = 3;
        var block_width:CGFloat = frame.width * 0.25;
        var block_offset:CGFloat = block_width * 0.5;
        
        for(var r = 0; r < num_rows; ++r)
        {
            for (var c = 0; c < num_cols; ++c)
            {
                var offset_x:CGFloat = (block_width + block_offset) * CGFloat(c);
                var offset_y:CGFloat = (block_width + block_offset) * CGFloat(r);
                
                // create path
                var path = CGPathCreateMutable();
                CGPathMoveToPoint(path, nil, frame.origin.x, frame.origin.y);
                CGPathAddRect(path, nil, CGRect(x: offset_x, y: offset_y, width: block_width, height: block_width));
                
                // get bezier and set color attributes
                var bezier = UIBezierPath(CGPath: path);
                grid_color.setFill();
                bezier.fill();
            }
        }

    }
    
    //-------------------------------------------------------------------------------------------------------
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}