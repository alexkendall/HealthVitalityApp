//
//  Color.swift
//  HealthApp
//
//  Created by Alex Harrison on 8/6/15.
//  Copyright (c) 2015 Alex Harrison. All rights reserved.
//

import Foundation
import UIKit

var OLIVE = UIColor(red: 255.0 / 255.0, green: 218.0 / 255.0, blue: 0.0, alpha: 1.0);
var RED_ORANGE = UIColor(red: 255.0 / 255.0, green: 74.0 / 255.0, blue: 0.0, alpha: 1.0);
var SOFT_LIME = UIColor(red: 131.0 / 255.0, green: 242.0 / 255.0, blue: 135.0 / 255.0, alpha: 1.0);
var PIONEER_RED = UIColor(red: 255.0 / 255.0, green: 100.0 / 255.0, blue: 78.0 / 255.0, alpha: 1.0);
var SUNSET_YELLOW = UIColor(red: 255.0 / 255.0, green: 231.0 / 255.0, blue: 82.0 / 255.0, alpha: 1.0);
//-------------------------------------------------------------------------------------------------------
// method for overloading * operator on color
func *(color1:UIColor, mult:CGFloat)->UIColor
{
    var r1:CGFloat = 0.0, g1:CGFloat = 0.0, b1:CGFloat = 0.0, alpha:CGFloat = 1.0;
    color1.getRed(&r1, green: &g1, blue: &b1, alpha: &alpha);
    r1 *= mult;
    g1 *= mult;
    b1 *= mult;
    
    var max_:CGFloat = max(r1, g1, b1);
    if(max_ > 1.0)
    {
        var normalizer = CGFloat(1.0) / max_;
        r1 *= normalizer;
        g1 *= normalizer;
        b1 *= normalizer;
    }
    
    return UIColor(red: r1, green: g1, blue: b1, alpha: alpha);
}
//-------------------------------------------------------------------------------------------------------

// method for overloading + operator on color
func +(color1:UIColor, color2:UIColor)->UIColor
{
    var r1:CGFloat = 0.0, g1:CGFloat = 0.0, b1:CGFloat = 0.0, alpha1:CGFloat = 1.0;
    var r2:CGFloat = 0.0, g2:CGFloat = 0.0, b2:CGFloat = 0.0, alpha2:CGFloat = 1.0;
    color1.getRed(&r1, green: &g1, blue: &b1, alpha: &alpha1);
    color2.getRed(&r2, green: &g2, blue: &b2, alpha: &alpha2);
    return UIColor(red: (r1 + r2), green: (g1 + g2), blue: (b1 + b2), alpha: 1.0);
}

//-------------------------------------------------------------------------------------------------------

func linear_interpolation(color1: UIColor, color2: UIColor, var t_value:CGFloat) ->UIColor
{
    var r1:CGFloat = 0.0, g1:CGFloat = 0.0, b1:CGFloat = 0.0, a1:CGFloat = 0.0;
    color1.getRed(&r1, green: &g1, blue: &b1, alpha: &a1);
    
    var r2:CGFloat = 0.0, g2:CGFloat = 0.0, b2:CGFloat = 0.0, a2:CGFloat = 0.0;
    color2.getRed(&r2, green: &g2, blue: &b2, alpha: &a2);
    
    var r3:CGFloat = (r1 * t_value) + r2 * (1.0 - t_value);
    var g3:CGFloat = (g1 * t_value) + g2 * (1.0 - t_value);
    var b3:CGFloat = (b1 * t_value) + b2 * (1.0 - t_value);
    var a3:CGFloat = (a1 * t_value) + a2 * (1.0 - t_value);
    return UIColor(red: r3, green: g3, blue: b3, alpha: a3);
}

//-------------------------------------------------------------------------------------------------------