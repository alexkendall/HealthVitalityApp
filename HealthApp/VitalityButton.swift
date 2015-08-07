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

class VitalityButton:SpringBoardButton
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
        var margin:CGFloat = rect.width * 0.15;
        var path = UIBezierPath();
        
        path.moveToPoint(CGPoint(x: margin, y: margin));
        path.addLineToPoint(CGPoint(x: rect.width * 0.5, y: rect.height - margin));
        path.addLineToPoint(CGPoint(x: rect.width - margin, y: margin));
        path.lineWidth = line_width;
        line_color.setStroke();
        path.stroke();
        
        self.layer.cornerRadius = rect.width * 0.25;
    }
    
    //-------------------------------------------------------------------------------------------------------
}