//
//  ActivityController.swift
//  HealthApp
//
//  Created by Alex Harrison on 8/12/15.
//  Copyright (c) 2015 Alex Harrison. All rights reserved.
//

import Foundation
import Charts
import UIKit


class ActivityController:BaseController
{
    var days = [String]();
    var unitsSold = [Double]();
    var lineChartView = LineChartView();
    
    override func viewDidLoad() {
        super.viewDidLoad();

        // add bar chart view
        var chart_dim:CGFloat = super_view.bounds.width * 0.9;
        var offset_x:CGFloat = (super_view.bounds.width - chart_dim) * 0.5;
        var offset_y:CGFloat = (super_view.bounds.height - chart_dim) * 0.5;
        lineChartView = LineChartView(frame: CGRect(x: offset_x, y: offset_y, width: chart_dim, height: chart_dim));
        lineChartView.layer.borderColor = UIColor.whiteColor().CGColor;
        
        
        days = ["Mon", "Tues", "Wed", "Thurs", "Fri"];
        unitsSold = [2000.0, 4000.0, 6000.0, 3000.0, 1200.0];

        setChart(days, values: unitsSold)
        
    }
    
    func setChart(dataPoints: [String], values: [Double])
    {
        var entries = [ChartDataEntry]();
        for(var i = 0; i < dataPoints.count; ++i)
        {
            var chart_entry = ChartDataEntry(value: values[i], xIndex: i);
            entries.append(chart_entry);
        
        }
        
        var data_set = LineChartDataSet(yVals: entries, label: "Steps");
        var data = LineChartData(xVals: dataPoints, dataSet: data_set);
        lineChartView.data = data;
        lineChartView.descriptionText = "Steps Activity";
        super_view.addSubview(lineChartView);
        data_set.colors = [UIColor.orangeColor()];
    }
}

