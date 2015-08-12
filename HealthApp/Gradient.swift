//
//  Gradient.swift
//  HealthApp
//
//  Created by Alex Harrison on 8/5/15.
//  Copyright (c) 2015 Alex Harrison. All rights reserved.
//

import Foundation
import UIKit

// adds linear gradient to superview
func add_gradient(var color1:UIColor, var color2:UIColor, var view:UIView)
{
    var gradient = CAGradientLayer();
    gradient.locations = [0,1];
    gradient.colors = [color1.CGColor, color2.CGColor];
    gradient.frame = main_controller.super_view.bounds;
    view.layer.addSublayer(gradient);
}