//
//  VitalityController.swift
//  HealthApp
//
//  Created by Alex Harrison on 8/17/15.
//  Copyright (c) 2015 Alex Harrison. All rights reserved.
//

import Foundation
import UIKit

class VitalityController:BaseController
{
    override func viewDidLoad() {
        var vitality_indicator:VitalityIndicator!;
        var vitality_label:UILabel!;
        var real_age_indicator:VitalityIndicator!;
        var real_age_label:UILabel!;
        var background_color:UIColor = UIColor.whiteColor();
        super.viewDidLoad();
        
        
        var uc_height:CGFloat = super_view.bounds.height * 0.5;
        var upper_container:UIView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: super_view.bounds.width, height: uc_height));
        //upper_container.backgroundColor = UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.5);
        //upper_container.layer.borderWidth = 1.0;
        //upper_container.layer.borderColor = UIColor.whiteColor().CGColor;
        super_view.addSubview(upper_container);
        
        var mult_:CGFloat = 0.8;
        var indicator_dim:CGFloat = upper_container.bounds.height * 0.5 * mult_;
        var indicator_margin:CGFloat = upper_container.bounds.width * 0.05;
        var offset_x:CGFloat = upper_container.bounds.width - indicator_margin - indicator_dim;
        var offset_y:CGFloat = ((upper_container.bounds.height * 0.5) - indicator_dim) * 0.5;
 
        // configure vitality indicator
        vitality_indicator = VitalityIndicator(frame: CGRect(x: offset_x, y: offset_y, width: indicator_dim, height: indicator_dim));
        upper_container.addSubview(vitality_indicator);
        vitality_indicator.interpolate_relative_health(vitality_age, actual_age: CGFloat(user_measurements.age));
        
        // configure vitality label
        var label_length:CGFloat = super_view.bounds.width - indicator_dim - indicator_margin;
        vitality_label = UILabel(frame: CGRect(x: 0.0, y: 0.0, width: label_length, height: upper_container.bounds.height * 0.5));
        vitality_label.textAlignment = NSTextAlignment.Center;
        vitality_label.textColor = UIColor.whiteColor();
        vitality_label.font = UIFont.systemFontOfSize(25.0);
        vitality_label.text = "Vitality Age";
        super_view.addSubview(vitality_label);
        
        
        // configure real age indicator
        real_age_indicator = VitalityIndicator(frame:CGRect(x: offset_x, y: (upper_container.bounds.height * 0.5) + offset_y, width: indicator_dim, height: indicator_dim));
        upper_container.addSubview(real_age_indicator);
        real_age_indicator.interpolate_relative_health(CGFloat(user_measurements.age), actual_age: CGFloat(user_measurements.age));
        
        // configure real age label
        real_age_label = UILabel(frame: CGRect(x: 0.0, y: upper_container.bounds.height * 0.5, width: label_length, height: upper_container.bounds.height * 0.5));
        real_age_label.textAlignment = NSTextAlignment.Center;
        real_age_label.textColor = UIColor.whiteColor();
        real_age_label.font = UIFont.systemFontOfSize(25.0);
        real_age_label.text = "Actual Age";
        super_view.addSubview(real_age_label);
    }
    
}