//
//  HeartRateController.swift
//  HealthApp
//
//  Created by Alex Harrison on 8/17/15.
//  Copyright (c) 2015 Alex Harrison. All rights reserved.
//

import Foundation
import Charts

class HeartRateController:BaseController
{
    var line_graph:myLineChart!;
    
    override func viewDidLoad()
    {
        super.viewDidLoad();
        // add bar chart view
        var chart_dim:CGFloat = super_view.bounds.width * 0.9;
        var offset_x:CGFloat = (super_view.bounds.width - chart_dim) * 0.5;
        var offset_y:CGFloat = (super_view.bounds.height - chart_dim) * 0.5;
        
        line_graph = myLineChart(frame: CGRect(x: offset_x, y: offset_y, width: chart_dim, height: chart_dim));
        set_title(line_graph, in_text: "Resting Heart Rate");
        
        // add mock data
        var heart_rates = [80.0, 84.0, 80.0, 87.0, 81.0, 78.0, 77.0];
        var days = ["M", "T", "W", "T", "F", "S", "S"]
        
        var heart_data = [ChartDataEntry]();
        for(var i = 0; i < heart_rates.count; ++i)
        {
            var new_entry = ChartDataEntry(value: heart_rates[i], xIndex: i);
            heart_data.append(new_entry);
        }
        var hr_data_set = LineChartDataSet(yVals: heart_data, label: "Heart Rates");
        var mixed_data_set = ChartDataSet(yVals: heart_data, label: "Heart Rates");
        
        
        hr_data_set.colors = [PIONEER_RED];
        hr_data_set.lineWidth = 2.0;
        hr_data_set.circleColors = [PIONEER_RED];
        hr_data_set.valueTextColor = PIONEER_RED;
        hr_data_set.valueFont = UIFont.systemFontOfSize(10.0);
    
        var hr_data = LineChartData(xVals: days, dataSet: hr_data_set);
        var combined_data = CombinedChartData(xVals: days, dataSet: mixed_data_set);
    
        // disable right axis
        line_graph.rightAxis.enabled = false;
        
        var min:Double = 10000000.00;
        var max:Double = 0.00;
        for(var i = 0; i < heart_rates.count; ++i)
        {
            if(heart_rates[i] < min)
            {
                min = heart_rates[i];
            }
            if(heart_rates[i] > max)
            {
                max = heart_rates[i];
            }
        }
        
        println(max);
        
        var min_int = Int(min) - (Int(min) % 5);
        var max_int = Int(max) - (Int(max) % 5) + 5;

        line_graph.leftAxis.startAtZeroEnabled = false;
        line_graph.leftAxis.customAxisMin = Double(min_int);
        line_graph.leftAxis.customAxisMax = Double(max_int);
        line_graph.data = hr_data;
        line_graph.legend.textColor = UIColor.whiteColor();
        
        super_view.addSubview(line_graph);
        
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated);
        line_graph.animate(yAxisDuration: 2.0, easingOption: ChartEasingOption.EaseInQuad);
    }
}