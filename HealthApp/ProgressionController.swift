//
//  ProgressionController.swift
//  HealthApp
//
//  Created by Alex Harrison on 8/17/15.
//  Copyright (c) 2015 Alex Harrison. All rights reserved.
//

import Foundation
import Charts

class ProgressionController:BaseController
{
    var bar_chart:BarChartView!;
    
    override func viewDidLoad()
    {
        super.viewDidLoad();
        // add bar chart view
        
        // configure radar chart
        var chart_dim:CGFloat = super_view.bounds.width * 0.9;
        var offset_x:CGFloat = (super_view.bounds.width - chart_dim) * 0.5;
        var offset_y:CGFloat = (super_view.bounds.height - chart_dim) * 0.5;
        bar_chart = BarChartView(frame: CGRect(x: offset_x, y: offset_y, width: chart_dim, height: chart_dim));
        
        // add fake vitality data
        var months:[String] = ["Jan", "Feb", "Mar", "April", "May", "Jun", "July", "August", "Sept", "Oct", "Nov", "Dec"];
        var v_ages:[Double] = [45.0, 45.6, 44.6, 44.3, 44.5, 44.6, 42.2, 44.8, 44.3, 44.1, 43.2, 43.2];
        
        
        var entries = [BarChartDataEntry]();
        for(var i = 0; i < months.count; ++i)
        {
            var entry = BarChartDataEntry(value: v_ages[i], xIndex: i);
            entries.append(entry);
        }
        
        var data_set:BarChartDataSet = BarChartDataSet(yVals: entries, label: "Vitality Age");
        data_set.colors = [SOFT_LIME];
        data_set.valueTextColor = UIColor.whiteColor();
        var data:BarChartData = BarChartData(xVals: months, dataSet: data_set);
        bar_chart.data = data;
        
        // customize chart look
        bar_chart.rightAxis.enabled = false;
        bar_chart.descriptionText = "";
        bar_chart.leftAxis.enabled = false;
        bar_chart.rightAxis.enabled = false;
        bar_chart.gridBackgroundColor = UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.5);
    
        super_view.addSubview(bar_chart);
        
        
        // ENHANCE GRAPH VISUALLY!
        // for this interpolate vitality color for bar based on ratio like with indicator!!!!
        
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated);
        bar_chart.animate(xAxisDuration: 2.0, yAxisDuration: 2.0);
    }
}