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

// base class for spring board buttons
class SpringBoardButton:UIButton
{
    var line_color:UIColor = UIColor.whiteColor();
    var line_width:CGFloat = 2.0;
    var path:UIBezierPath  = UIBezierPath();
    
    init(frame: CGRect, var in_color:UIColor, var in_width:CGFloat)
    {
        super.init(frame: frame);
        backgroundColor = UIColor.clearColor();
        line_color = in_color;
        line_width = in_width;
        layer.borderWidth = 1.0;
        layer.borderColor = line_color.CGColor;
        path.lineWidth = in_width;
        addTarget(self, action: "highlight_color", forControlEvents: UIControlEvents.TouchDown);
        addTarget(self, action: "unhighlight_color", forControlEvents: UIControlEvents.TouchUpInside);
        addTarget(self, action: "unhighlight_color", forControlEvents: UIControlEvents.TouchUpOutside);
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func drawRect(rect: CGRect) {
        super.drawRect(rect);
        self.layer.cornerRadius = rect.width * 0.25;
    }
    
    func highlight_color()
    {
        line_color = UIColor.blackColor();
        backgroundColor = UIColor.whiteColor();
        self.clipsToBounds = true;
        self.setNeedsDisplay();
    }
    
    func unhighlight_color()
    {
        backgroundColor = UIColor.clearColor();
        line_color = UIColor.whiteColor();
        self.clipsToBounds = true;
        self.setNeedsDisplay();
    }
}