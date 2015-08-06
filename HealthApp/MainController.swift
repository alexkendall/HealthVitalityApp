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
        var vitality_indicator = VitalityIndicator(frame:CGRect(x: vitality_offset_x, y: vitality_offset_y, width: vitality_width, height: vitality_width));
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
        
        
        
        
    }
    
    func showGrid()
    {
        println("Showing grid");
        
    }
    
    func showProfile()
    {
        println("Showing profile");
    }
}


