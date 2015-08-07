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

class BloodPressureButton:SpringBoardButton
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
        var midpoint:CGFloat = rect.width * 0.5;
        var height = rect.height * 0.9;
        var width = rect.width * 0.9;
        path = UIBezierPath();
    
        var center_point = CGPoint(x: rect.width * 0.5, y: height * 0.3);
        
        // ove path to start point
        path.moveToPoint(CGPoint(x: width * 0.1, y: height * 0.3));
        
        // CURVE 1
        var end_point = center_point;
        var control_1 = CGPoint(x: width * 0.1, y: 0.0);
        var control_2 = CGPoint(x: rect.width * 0.5, y: 0.0);
        path.addCurveToPoint(end_point, controlPoint1: control_1, controlPoint2: control_2);
        
        // curve 2
        end_point = CGPoint(x: width, y: height * 0.3);
        control_1 = CGPoint(x: rect.width * 0.5, y: 0.0);
        control_2 = CGPoint(x: width, y: 0.0);
        path.addCurveToPoint(end_point, controlPoint1: control_1, controlPoint2: control_2);
        
        // curve 3
        end_point = CGPoint(x: rect.width * 0.5, y: height);
        control_1 = CGPoint(x: width, y: rect.height * 0.5);
        control_2 = CGPoint(x: rect.width * 0.5, y: height);
        path.addCurveToPoint(end_point, controlPoint1: control_1, controlPoint2: control_2);
        
        // curve 4
        end_point = CGPoint(x: width * 0.1, y: height * 0.3);
        control_1 = CGPoint(x: rect.width * 0.5, y: height);
        control_2 = CGPoint(x: width * 0.1, y: rect.height * 0.5);
        path.addCurveToPoint(end_point, controlPoint1: control_1, controlPoint2: control_2);
        
        path.lineWidth = line_width;
        line_color.setStroke();
        path.stroke();
    }
    
    //-------------------------------------------------------------------------------------------------------
}