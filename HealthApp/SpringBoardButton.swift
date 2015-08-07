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
        self.layer.cornerRadius = rect.width * 0.25;
    }
}