//
//  ProgressionController.swift
//  HealthApp
//
//  Created by Alex Harrison on 8/17/15.
//  Copyright (c) 2015 Alex Harrison. All rights reserved.
//

import Foundation
import Charts
var chart_colors = [UIColor]();

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
        var v_ages:[Double] = [35.0, 35.6, 34.6, 34.3, 34.5, 34.6, 34.2, 34.8, 34.3, 34.1, 33.2, 33.0];
        
        for(var i = 0; i < v_ages.count; ++i)
        {
            var color:UIColor = VitalityIndicator.get_vitality_color(CGFloat(v_ages[i]), actual_age: CGFloat(user_measurements.age));
            chart_colors.append(color);
        }
        
        
        // determine min and max
        var max:Double = -1.0;
        var min:Double = 1000000;
        for(var i = 0; i < v_ages.count; ++i)
        {
            if(v_ages[i] > max)
            {
                max = v_ages[i];
            }
            if(v_ages[i] < min)
            {
                min = v_ages[i];
            }
        }
        
        var min_buffer:Double = 3.0;
        var max_buffer:Double = 1.0;

        bar_chart.leftAxis.customAxisMin = floor(min) - min_buffer;
        bar_chart.leftAxis.customAxisMax = ceil(max) + max_buffer;
        
        
        var entries = [BarChartDataEntry]();
        for(var i = 0; i < months.count; ++i)
        {
            var entry = BarChartDataEntry(value: v_ages[i], xIndex: i);
            entries.append(entry);
        }
        
        var data_set:BarChartDataSet = BarChartDataSet(yVals: entries, label: "Vitality Age (Years)");
        println("Count: " + String(chart_colors.count));
        data_set.valueTextColor = UIColor.whiteColor();
        data_set.colors = [SOFT_LIME];
        var data:BarChartData = BarChartData(xVals: months, dataSet: data_set);
        bar_chart.leftAxis.startAtZeroEnabled = false;
        bar_chart.data = data;
        
        // customize chart look
        bar_chart.rightAxis.enabled = false;
        bar_chart.descriptionText = "";
        bar_chart.rightAxis.enabled = false;
        bar_chart.leftAxis.labelTextColor = UIColor.whiteColor();
        bar_chart.gridBackgroundColor = UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.5);
        bar_chart.xAxis.labelTextColor = UIColor.whiteColor();
        bar_chart.legend.colors = [UIColor.whiteColor()];
        bar_chart.legend.textColor = UIColor.whiteColor();
    
        super_view.addSubview(bar_chart);
        
        
        // ENHANCE GRAPH VISUALLY!
        // for this interpolate vitality color for bar based on ratio like with indicator!!!!
        
        set_title(bar_chart, in_text: "Vitality Progression");
        
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated);
        bar_chart.animate(xAxisDuration: 0.0, yAxisDuration: 2.0);
    }
}