//
//  CustomGraph.swift
//  HealthApp
//
//  Created by Alex Harrison on 8/17/15.
//  Copyright (c) 2015 Alex Harrison. All rights reserved.
//

import Foundation
import Charts

class myLineChart:LineChartView
{
    override init(frame: CGRect) {
        super.init(frame:frame);
        
        // confogure chart
        self.drawGridBackgroundEnabled = true;
        self.gridBackgroundColor = UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.5);
        self.descriptionText = "";
        
        // configure left axis
        self.leftAxis.labelTextColor = UIColor.whiteColor();
        self.leftAxis.gridColor = UIColor.whiteColor();
        self.leftAxis.gridLineWidth = 1.0;
        
        // conifgure right axis
        self.rightAxis.enabled = false;
        
        // configure x axis
        self.xAxis.labelTextColor = UIColor.whiteColor();
        self.xAxis.gridColor = UIColor.whiteColor();
        self.xAxis.gridLineWidth  = 1.0;
        self.xAxis.axisLineColor = UIColor.whiteColor();
        self.xAxis.axisLineWidth = 1.0;
        
        // configure legend
        self.legend.enabled = true;
        self.legend.colors = [UIColor.whiteColor()];
        self.legend.textColor = UIColor.whiteColor();
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}