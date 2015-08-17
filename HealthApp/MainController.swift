//
//  MainController.swift
//  
//
//  Created by Alex Harrison on 8/3/15.
//
//

import Foundation
import UIKit
import QuartzCore
import Charts

//-------------------------------------------------------------------------------------------------------

class MainController:UIViewController
{
    var LIGHT_BLUE = UIColor(red: 0.0, green: 152.0 / 255.0, blue: 197.0 / 255.0, alpha: 1.0);
    var DARK_BLUE = UIColor(red: 0.0, green: 76.0 / 255.0, blue: 98.0 / 255.0, alpha: 1.0);
    var nav_button = UIButton();
    var super_view = UIView();
    var toggle:Bool = false;
    var phone_info_container = UIView();
    var navigation_container = UIView();
    var vitality_label = UILabel();
    var vitality_indicator = VitalityIndicator();
    var spring_containers = [UIView]();
    var spring_buttons = [SpringBoardButton]();
    var icon_labels = ["Vitality", "Progression", "Heart Rate", "Activity", "Blood Pressure", "Measurements"];
    var controller_titles = ["My Vitality", "Progression", "Heart Rate", "My Activity", "Blood Pressure", "Measurements"];
    var out_container_frames = [CGRect]();
    var in_container_frame = CGRect();
    var hr_line:HorizontalLine?;
    var hr_line2:HorizontalLine?;
    var spring_labels = [UILabel]();
    var title_label = UILabel();
    
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
        
        // add seperator line to seperate  status bar and springboard
        hr_line = HorizontalLine(frame: CGRect(x: 0.0, y: vitality_indicator.frame.maxY + (vitality_width * 0.1), width: super_view.bounds.width, height: 2.0), in_color: UIColor.whiteColor(), in_width: 10.0);
        super_view.addSubview(hr_line!);
        
        
        // add bottom seperator line to seperate spring board and tab bar
        hr_line2 = HorizontalLine(frame: CGRect(x: 0.0, y: super_view.bounds.height * 0.9, width: super_view.bounds.width, height: 2.0), in_color: UIColor.whiteColor(), in_width: 10.0);
        super_view.addSubview(self.hr_line2!);
        
        var grid_dim:CGFloat = (super_view.bounds.height - self.hr_line2!.frame.maxY) * 0.6;
        var grid_offset_y:CGFloat = self.hr_line2!.frame.maxY + ((super_view.bounds.height - self.hr_line2!.frame.maxY - grid_dim) * 0.5);
        var grid_offset_x:CGFloat = (super_view.bounds.width - grid_dim) * 0.5;
        var grid = GridButton(frame: CGRect(x: grid_offset_x, y: grid_offset_y, width: grid_dim, height: grid_dim), color: UIColor.whiteColor());
        grid.addTarget(self, action: "showGrid", forControlEvents: UIControlEvents.TouchUpInside);
        super_view.addSubview(grid);
        
        var real_age:CGFloat = 50.0;
        var vitality_age:CGFloat = 47.0;
        vitality_indicator.interpolate_relative_health(vitality_age, actual_age: real_age);
        
        // generate container views to section off main controller into 6 sub views
        var num_cols:Int = 2;
        var num_rows:Int = 3;
        var global_offset:CGFloat = hr_line!.frame.maxY;
        var tab_offset:CGFloat = super_view.bounds.height - self.hr_line2!.frame.maxY;
        var width = super_view.bounds.width / CGFloat(num_cols) + 1.0;
        var height:CGFloat = (super_view.bounds.height - hr_line!.frame.maxY - tab_offset) / CGFloat(num_rows);
        for(var row = 0; row < num_rows; ++row)
        {
            for(var col = 0; col < num_cols; ++col)
            {
                var offset_x:CGFloat = CGFloat(col) * width - 1.0
                var offset_y:CGFloat = (CGFloat(row) * height) + global_offset;
                var frame = CGRect(x: offset_x, y: offset_y, width: width, height: height);
                var view = UIView(frame: frame);
                out_container_frames.append(frame);
                //view.layer.borderWidth = 0.5;
                view.layer.borderColor = UIColor.whiteColor().CGColor;
                spring_containers.append(view);
                super_view.addSubview(view);
            }
        }
        
        // set button dimensions
        var container_height = spring_containers[0].bounds.height;
        var container_width = spring_containers[0].bounds.width;
        var dim:CGFloat = spring_containers[0].bounds.height * 0.5;
        var offset_x:CGFloat = (container_width - dim) * 0.5;
        var offset_y:CGFloat = (container_height - dim) * 0.5;
        var spring_frame = CGRect(x: offset_x, y: offset_y, width: dim, height: dim);
        
        // vitality button
        var vitalityButton = VitalityButton(frame: spring_frame, in_color: UIColor.whiteColor(), in_width: 3.0);
        spring_containers[0].addSubview(vitalityButton);
        spring_buttons.append(vitalityButton);
        vitalityButton.addTarget(self, action: "showVitality", forControlEvents: UIControlEvents.TouchUpInside);
        
        // stats button
        var statsButton = GraphIndicator(frame: spring_frame, in_color: UIColor.whiteColor(), in_width: 2.0);
        spring_containers[1].addSubview(statsButton);
        spring_buttons.append(statsButton);
        statsButton.addTarget(self, action: "showProgression", forControlEvents: UIControlEvents.TouchUpInside);
        
        // heart button
        var heartRateButton = HeartRateIndicator(frame: spring_frame, in_color: UIColor.whiteColor(), in_width: 2.0);
        heartRateButton.addTarget(self, action: "showHeartRate", forControlEvents: UIControlEvents.TouchUpInside);
        spring_buttons.append(heartRateButton);
        spring_containers[2].addSubview(heartRateButton );
        
        // activity button
        var activityButton = LocationIndicator(frame: spring_frame, in_color: UIColor.whiteColor(), in_width: 2.0);
        spring_containers[3].addSubview(activityButton);
        spring_buttons.append(activityButton);
        activityButton.addTarget(self, action: "showActivity", forControlEvents: UIControlEvents.TouchUpInside);
        
        // blood pressure button
        var pressureButton = BloodPressureButton(frame: spring_frame, in_color: UIColor.whiteColor(), in_width: 2.0);
        spring_containers[4].addSubview(pressureButton);
        spring_buttons.append(pressureButton);
        pressureButton.addTarget(self, action: "showPressure", forControlEvents: UIControlEvents.TouchUpInside);
        
        // ruler button
        var rulerButton = RulerButton(frame: spring_frame, in_color: UIColor.whiteColor(), in_width: 2.0);
        spring_containers[5].addSubview(rulerButton);
        spring_buttons.append(rulerButton);
        rulerButton.addTarget(self, action: "showMeasurements", forControlEvents: UIControlEvents.TouchUpInside);
    
        
        // add labels  below each button
        for(var i = 0; i < num_cols * num_rows; ++i)
        {
            var label_width:CGFloat = spring_containers[0].bounds.width;
            var label_height:CGFloat = spring_containers[0].bounds.width * 0.10;
            var label_offset_y:CGFloat = spring_frame.maxY;
            var label = UILabel(frame: CGRect(x: 0.0, y: label_offset_y, width: label_width, height: label_height));
            label.font = UIFont.systemFontOfSize(12.0);
            label.textColor = UIColor.whiteColor();
            label.textAlignment = NSTextAlignment.Center;
            spring_containers[i].addSubview(label);
            label.text = icon_labels[i];
            spring_labels.append(label);
        }
        
        var label_y:CGFloat = 0.0;
        var label_x:CGFloat = spring_buttons[0].frame.maxX + 10.0;
        var label_width:CGFloat = super_view.bounds.width - label_x;
        var label_height:CGFloat = hr_line!.frame.maxY;
        title_label = UILabel(frame: CGRect(x: label_x, y: label_y, width: label_width, height: label_height));
        title_label.textColor = UIColor.whiteColor();
        title_label.textAlignment = NSTextAlignment.Left;
        title_label.font = UIFont.systemFontOfSize(22.0);
        title_label.alpha = 0.0;
        super_view.addSubview(title_label);

    }
    
    //-------------------------------------------------------------------------------------------------------
    
    func showGrid()
    {
        println("Test case...Updating health information...");
        
        var real_age:UInt32 = arc4random_uniform(20) + 50;
        var vitality_age:UInt32 = arc4random_uniform(20) + 50;
        vitality_indicator.interpolate_relative_health(CGFloat(vitality_age), actual_age: CGFloat(real_age));
        println("Real Age: " + String(real_age));
        println("Vitality Age: " + String(vitality_age));
        println(get_age_from_sodium(140.0));
        
        
        for(var i = 0; i < out_container_frames.count; ++i)
        {
            UIView.animateWithDuration(1.25, animations: {
                for(var i = 0; i < self.out_container_frames.count; ++i)
                {
                    self.spring_containers[i].frame = self.out_container_frames[i];
                    self.spring_containers[i].alpha = 1.0;
                    self.vitality_indicator.alpha = 1.0;
                    self.spring_labels[i].alpha = 1.0;
                    self.title_label.alpha = 0.0;
                }
            })
        }
        activity_controller.push_out();
        measurements_controller.push_out();
    }
    
    //-------------------------------------------------------------------------------------------------------
    
    func animate_selection(var index:Int)
    {
        for(var i = 0; i < out_container_frames.count; ++i)
        {
            UIView.animateWithDuration(1.25, animations: {
                for(var i = 0; i < self.out_container_frames.count; ++i)
                {
                    var offset_y:CGFloat = (self.hr_line!.frame.maxY - self.spring_containers[0].bounds.height) * 0.5;
                    var offset_x:CGFloat = self.spring_containers[0].frame.origin.x;
                    var height:CGFloat = self.spring_containers[0].bounds.height;
                    var width:CGFloat = self.spring_containers[1].bounds.width;
                    var frame:CGRect = CGRect(x: offset_x, y: offset_y, width: width, height: height);
                
                    self.title_label.text = self.controller_titles[index];
                    self.title_label.alpha = 1.0;
                    
                    // change frame
                    self.spring_containers[i].frame = frame;
                    
                    if(i != index)
                    {
                        self.spring_containers[i].alpha = 0.0;
                    }
                    self.spring_labels[i].alpha = 0.0;
                }
            })
            
            UIView.animateWithDuration(0.5, animations: {
                for(var i = 0; i < self.out_container_frames.count; ++i)
                {
                    self.vitality_indicator.alpha = 0.0;
                }
            })

        }
    }
    
    
    //-------------------------------------------------------------------------------------------------------
    
    func showHeartRate()
    {
        animate_selection(2);
    }
    
    //-------------------------------------------------------------------------------------------------------
    
    func showProgression()
    {
        animate_selection(1);
    }
    
    //-------------------------------------------------------------------------------------------------------
    
    func showActivity()
    {
        main_controller.super_view.addSubview(activity_controller.view);
        animate_selection(3);
    }
    
    //-------------------------------------------------------------------------------------------------------
    
    func showVitality()
    {
        animate_selection(0);
    }
    
    //-------------------------------------------------------------------------------------------------------
    
    func showPressure()
    {
        animate_selection(4);
    }
    
    //-------------------------------------------------------------------------------------------------------
    
    func showMeasurements()
    {
        main_controller.super_view.addSubview(measurements_controller.view);
        animate_selection(5);
    }
    
    //-------------------------------------------------------------------------------------------------------
    
}