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
    var super_view = UIView()
    override func viewDidLoad() {
        super.viewDidLoad();
        super_view = self.view;
        var super_y:CGFloat = main_controller.hr_line!.frame.origin.y;
        var super_height:CGFloat = super_view.bounds.height - super_y - (super_view.bounds.height - main_controller.hr_line2!.frame.origin.y);
        super_view.frame = CGRect(x: 0.0, y: super_y, width: super_view.bounds.width, height: super_height);
    }
}