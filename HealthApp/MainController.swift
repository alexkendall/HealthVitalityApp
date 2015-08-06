//
//  MainController.swift
//  
//
//  Created by Alex Harrison on 8/3/15.
//
//

import Foundation
import UIKit

var LIGHT_BLUE = UIColor(red: 0.0, green: 152.0 / 255.0, blue: 197.0 / 255.0, alpha: 1.0);
var DARK_BLUE = UIColor(red: 0.0, green: 76.0 / 255.0, blue: 98.0 / 255.0, alpha: 1.0);
var nav_button = UIButton();
var super_view = UIView();
var toggle:Bool = false;
var phone_info_container = UIView();
var navigation_container = UIView();
var vitality_label = UILabel();
var vitality_indicator = VitalityIndicator();
var icon_containers = [UIView]();

class MainController:UIViewController
{
    override func viewDidLoad() {
    
        super.viewDidLoad();
        self.view.backgroundColor = UIColor.whiteColor();
        
        // configure this view
        super_view = self.view;
        
        // configure gradient
        add_gradient(LIGHT_BLUE, DARK_BLUE, super_view);
        
        // configure vitality indicator
        var vitality_width:CGFloat = super_view.bounds.width * 0.3;
        var vitality_offset_x:CGFloat = (super_view.bounds.width - vitality_width) * 0.5;
        var vitality_offset_y:CGFloat = vitality_width * 0.2;
        vitality_indicator = VitalityIndicator(frame:CGRect(x: vitality_offset_x, y: vitality_offset_y, width: vitality_width, height: vitality_width));
        super_view.addSubview(vitality_indicator);
        
        // add seperator line
        //vitality_indicator.addTarget(self, action: "showGrid", forControlEvents: UIControlEvents.TouchUpInside);
        var hr_line = Horizontal_Line(frame: CGRect(x: 0.0, y: vitality_indicator.frame.maxY + (vitality_width * 0.1), width: super_view.bounds.width, height: 2.0), in_color: UIColor.whiteColor(), in_width: 10.0);
        super_view.addSubview(hr_line);
        
        
        // add bottom seperator line
        var hr_line2 = Horizontal_Line(frame: CGRect(x: 0.0, y: super_view.bounds.height * 0.9, width: super_view.bounds.width, height: 2.0), in_color: UIColor.whiteColor(), in_width: 10.0);
        super_view.addSubview(hr_line2);
        
        var grid_dim:CGFloat = (super_view.bounds.height - hr_line2.frame.maxY) * 0.6;
        var grid_offset_y:CGFloat = hr_line2.frame.maxY + ((super_view.bounds.height - hr_line2.frame.maxY - grid_dim) * 0.5);
        var grid_offset_x:CGFloat = (super_view.bounds.width - grid_dim) * 0.5;
        var grid = GridButton(frame: CGRect(x: grid_offset_x, y: grid_offset_y, width: grid_dim, height: grid_dim), color: UIColor.whiteColor());
        grid.addTarget(self, action: "showGrid", forControlEvents: UIControlEvents.TouchUpInside);
        super_view.addSubview(grid);
        
        var real_age:CGFloat = 50.0;
        var vitality_age:CGFloat = 47.0;
        vitality_indicator.interpolate_relative_health(vitality_age, actual_age: real_age);
        
        // generate container view
        var num_cols:Int = 2;
        var num_rows:Int = 3;
        var global_offset:CGFloat = hr_line.frame.maxY;
        var tab_offset:CGFloat = super_view.bounds.height - hr_line2.frame.maxY;
        var width = super_view.bounds.width / CGFloat(num_cols) + 1.0;
        var height:CGFloat = (super_view.bounds.height - hr_line.frame.maxY - tab_offset) / CGFloat(num_rows);
        for(var row = 0; row < num_rows; ++row)
        {
            for(var col = 0; col < num_cols; ++col)
            {
                var offset_x:CGFloat = CGFloat(col) * width - 1.0
                var offset_y:CGFloat = (CGFloat(row) * height) + global_offset;
                var view = UIView(frame: CGRect(x: offset_x, y: offset_y, width: width, height: height));
                view.layer.borderWidth = 0.5;
                view.layer.borderColor = UIColor.whiteColor().CGColor;
                icon_containers.append(view);
                super_view.addSubview(view);
            }
        }
        
        // add heart rate
        var container_height = icon_containers[0].bounds.height;
        var container_width = icon_containers[0].bounds.width;
        var dim:CGFloat = icon_containers[0].bounds.height * 0.5;
        var offset_x:CGFloat = (container_width - dim) * 0.5;
        var offset_y:CGFloat = (container_height - dim) * 0.5;
        var heart_rate = HeartRateIndicator(frame: CGRect(x: offset_x, y: offset_y, width: dim, height: dim), in_color: UIColor.whiteColor(), in_width: 2.0);
        heart_rate.addTarget(self, action: "showProfile", forControlEvents: UIControlEvents.TouchUpInside);
        icon_containers[0].addSubview(heart_rate);
        
        // add heart rate label
        for(var i = 0; i < num_cols * num_rows; ++i)
        {
            var label_width:CGFloat = icon_containers[0].bounds.width;
            var label_height:CGFloat = icon_containers[0].bounds.width * 0.10;
            var label_offset_y:CGFloat = heart_rate.frame.maxY;
            var label = UILabel(frame: CGRect(x: 0.0, y: label_offset_y, width: label_width, height: label_height));
            label.font = UIFont.systemFontOfSize(12.0);
            label.textColor = UIColor.whiteColor();
            label.textAlignment = NSTextAlignment.Center;
            icon_containers[i].addSubview(label);
            
            if(i == 0)
            {
                label.text = "Heart Rate";
            }
        }
    }
    
    func showGrid()
    {
        println("Test case...Updating health information...");
        
        var real_age:UInt32 = arc4random_uniform(20) + 50;
        var vitality_age:UInt32 = arc4random_uniform(20) + 50;
        vitality_indicator.interpolate_relative_health(CGFloat(vitality_age), actual_age: CGFloat(real_age));
        
        println("Real Age: " + String(real_age));
        println("Vitality Age: " + String(vitality_age));
        
        println(get_age_from_sodium(140.0));
    }
    
    func showProfile()
    {
        println("Showing profile");
    }
}