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
    var health_color:UIColor = UIColor.orangeColor();
    var vitality_age:Int = 50;
    
    override init(frame: CGRect)
    {
        super.init(frame: frame);
        backgroundColor = UIColor.clearColor();
        addSubview(label);
    }
    
    func set_color(color:UIColor)
    {
        health_color = color;
    }
    
    func set_vitality_age(var age:Int)
    {
        vitality_age = age;
        label.text = String(age);
        println(label.text);
    }
    
    override func drawRect(rect: CGRect)
    {
        super.drawRect(rect);
        var ctx = UIGraphicsGetCurrentContext();
        var path = CGPathCreateMutable();
        var line_width:CGFloat = frame.width * 0.2;
        var height = bounds.height * 0.8;
        var offset = bounds.height * 0.1;
        
        // draw outer circle -> outline
        var outline_circle = UIBezierPath(ovalInRect: CGRect(x: offset, y: offset, width: height, height: height));
        UIColor.blackColor().setStroke();
        outline_circle.lineWidth = height * 0.13;
        outline_circle.stroke();
        
        
        // draw inner circle
        var outer_circle = UIBezierPath(ovalInRect: CGRect(x: offset, y: offset, width: height, height: height));
        health_color.setStroke();
        outer_circle.lineWidth = height * 0.1;
        outer_circle.stroke();
        
        
        
        // add label to middle
        label.frame = rect;
        label.textColor = UIColor.whiteColor();
        label.font = UIFont.systemFontOfSize(40.0);
        label.textAlignment = NSTextAlignment.Center;
        addSubview(label);
        
    }
    
    
    // sets the age of the vitality indicator
    // compares to real age and interpolates color accordingly
    // green = healthy for age, red = unhealthy for age
    func interpolate_relative_health(var vitality_age:CGFloat, var actual_age:CGFloat)
    {
        var healthy_color:UIColor = UIColor.greenColor();
        var unhealthy_color:UIColor = UIColor.yellowColor();
        var ratio:CGFloat = vitality_age / actual_age;
        var upper_bound:CGFloat = 1.20;
        var lower_bound:CGFloat = 0.80;
        
        println("Ratio: " + String(stringInterpolationSegment: ratio));
        
      
        // clamp ratio to bounds
        if(ratio > upper_bound)
        {
            ratio = upper_bound;
        }
        if(ratio <  lower_bound)
        {
            ratio = lower_bound;
        }
        
        // get t value
        var t_value:CGFloat = (ratio - lower_bound) / (upper_bound - lower_bound);
        var color:UIColor = UIColor();
        
        if(t_value <= 0.5)   // healthy zone -> interpolate green to yellow
        {
            t_value *= 2.0; // normalize;
            color = (UIColor.greenColor() * (1.0 - t_value)) + (UIColor.yellowColor() * t_value);
            
        }
        else    // healthy zone -> interpolate yellow to red
        {
            t_value = (t_value - 0.5) * 2.0;
            color = (UIColor.yellowColor() * (1.0 - t_value)) + (UIColor.redColor() * t_value);
        }
        
        set_color(color);
        set_vitality_age(Int(vitality_age));
        vitality_indicator.setNeedsDisplay();
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}