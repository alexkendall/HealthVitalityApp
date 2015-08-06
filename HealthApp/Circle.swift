//
//  Circle.swift
//  HealthApp
//
//  Created by Alex Harrison on 8/4/15.
//  Copyright (c) 2015 Alex Harrison. All rights reserved.
//

import Foundation
import UIKit
import CoreGraphics

class UICircle:UIView
{
    override init(frame: CGRect)
    {
        super.init(frame: frame);
        self.layer.cornerRadius = self.bounds.width * 0.5;
    }
    
    init(frame: CGRect, color:UIColor)
    {
        super.init(frame: frame);
        self.layer.cornerRadius = self.bounds.width * 0.5;
        backgroundColor = color;
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
