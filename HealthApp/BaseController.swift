//
//  ActivityController.swift
//  HealthApp
//
//  Created by Alex Harrison on 8/12/15.
//  Copyright (c) 2015 Alex Harrison. All rights reserved.
//

import UIKit

class BaseController:UIViewController
{
    var super_view = UIView();
    var super_in_frame = CGRect();
    var super_out_frame = CGRect();
    
    override func viewDidLoad() {
        super.viewDidLoad();
        super_view = self.view;
        var super_y:CGFloat = main_controller.hr_line!.frame.origin.y;
        var super_height:CGFloat = super_view.bounds.height - super_y - (super_view.bounds.height - main_controller.hr_line2!.frame.origin.y);
        super_view.frame = CGRect(x: 0.0, y: super_y, width: super_view.bounds.width, height: super_height);
        
        // configure super in and out frames for animation
        super_in_frame = CGRect(x: super_view.frame.origin.x, y: super_view.frame.origin.y, width: super_view.bounds.width, height: super_view.bounds.height);
        super_out_frame = CGRect(x: super_view.bounds.width, y: super_view.frame.origin.y, width: super_view.bounds.width, height: super_view.bounds.height);
        super_view.frame = super_out_frame;
        
    }
    
    override func viewDidAppear(animated: Bool)
    {
        println("view is appearing");
        super.viewDidAppear(animated);
        
        
        UIView.animateWithDuration(2.0, animations: {
            println("here");
            self.super_view.frame = self.super_in_frame;
        })
        
        
    }
    
    func push_out()
    {
        UIView.animateWithDuration(1.0, delay: 0.0, options: UIViewAnimationOptions.TransitionNone, animations: { () -> Void in
            
            self.super_view.frame = self.super_out_frame;
            
            }, completion: { (finished: Bool) -> Void in
                
                // you can do this in a shorter, more concise way by setting the value to its opposite, NOT value
                self.super_view.removeFromSuperview();
        })
    }
}