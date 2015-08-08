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

class RulerButton:SpringBoardButton
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
        var height = rect.height;
        var width = rect.width;
        var ruler_width:CGFloat = rect.width * 0.25;
        var ruler_height:CGFloat = rect.height * 0.8;
        var ruler_marginx:CGFloat = (width - ruler_width) * 0.5;
        var ruler_marginy:CGFloat = (height - ruler_height) * 0.5;
        
        var half_hash:CGFloat = ruler_width * 0.5;
        var quarter_hash:CGFloat = ruler_width * 0.25;
        
        path = UIBezierPath();
        
        // draw ruler outline
        var center_point = CGPoint(x: ruler_marginx, y: ruler_marginy);
        path.moveToPoint(center_point);
        path.addLineToPoint(CGPoint(x: ruler_marginx, y: height - ruler_marginy));
        path.addLineToPoint(CGPoint(x: width - ruler_marginx, y: height - ruler_marginy));
        path.addLineToPoint(CGPoint(x: width - ruler_marginx, y: ruler_marginy));
        path.addLineToPoint(center_point);
        
        var num_markers:Int = 6;
        var inc_:CGFloat = ruler_height / CGFloat(num_markers);
        
        // alternate adding half and quarter ruler hash marks
        for(var i = 0; i < num_markers; ++i)
        {
            var y:CGFloat = ruler_marginy + (CGFloat(i) * inc_);
            path.moveToPoint(CGPoint(x: ruler_marginx, y: y));
            if((i % 2) == 0)   
            {
                path.addLineToPoint(CGPoint(x: ruler_marginx + quarter_hash, y: y));
            }
            else
            {
                path.addLineToPoint(CGPoint(x: ruler_marginx + half_hash, y: y));
            }
        }

        path.lineWidth = line_width;
        line_color.setStroke();
        path.stroke();
    }
    
    //-------------------------------------------------------------------------------------------------------
}