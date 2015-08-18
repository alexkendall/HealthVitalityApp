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

class MeasurementsController:BaseController
{
    var height:CGFloat = 72.00;
    var weight:CGFloat = 175.0;
    var bar_chart:BarChartView!;
    
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated);
        
        bar_chart.animate(xAxisDuration: 2.0, yAxisDuration: 2.0);
    }
    
    override func viewDidLoad() {
        super.viewDidLoad();
        
        // configure mock line chartd data
        var dim_labels = ["Height (inches)", "Weight (pounds)"];
        var my_vals = [user_measurements.height, user_measurements.weight];
        
        
        // configure mock line chartd data
        var avg_vals_male = [68.8, 180.0];
        var avg_vals_female = [64.4, 160.0]
        
        
        // configure radar chart
        var chart_dim:CGFloat = super_view.bounds.width * 0.9;
        var offset_x:CGFloat = (super_view.bounds.width - chart_dim) * 0.5;
        var offset_y:CGFloat = (super_view.bounds.height - chart_dim) * 0.5;
        bar_chart = BarChartView(frame: CGRect(x: offset_x, y: offset_y, width: chart_dim, height: chart_dim));
        
        
        // configure colors
        
        var personal_entries = [BarChartDataEntry]();
        var avg_data_entries = [BarChartDataEntry]();
        
        for(var i = 0; i < dim_labels.count; ++i)
        {
            var personal_entry = BarChartDataEntry(value: my_vals[i], xIndex: i);
            personal_entries.append(personal_entry);
        }
        
        var label_str:String!; // string that identifies data and sex
        if(user_measurements.sex == SEX.MALE)
        {
            for(var i = 0; i < dim_labels.count; ++i)
            {
                var avg_entry = BarChartDataEntry(value: avg_vals_male[i], xIndex: i);
                avg_data_entries.append(avg_entry);
            }
            label_str = "Global Average (Male)";
        }
        else
        {
            for(var i = 0; i < dim_labels.count; ++i)
            {
                var avg_entry = BarChartDataEntry(value: avg_vals_female[i], xIndex: i);
                avg_data_entries.append(avg_entry);
            }
            label_str = "Global Average (Female)";
        }
        
        
        // personal data set
        var personal_data_set = BarChartDataSet(yVals: personal_entries, label: "Personal");
        personal_data_set.colors = [SUNSET_YELLOW];
        personal_data_set.valueTextColor = UIColor.whiteColor();
        
        // global avg data set
        var avg_data_set = BarChartDataSet(yVals: avg_data_entries, label: label_str);
        avg_data_set.colors = [PIONEER_RED];
        avg_data_set.valueTextColor = UIColor.whiteColor();
    
        // configure bar chart
        var chart_data = BarChartData(xVals: dim_labels, dataSets: [personal_data_set, avg_data_set]);
        bar_chart.backgroundColor = UIColor.clearColor();
        bar_chart.gridBackgroundColor = UIColor.clearColor();
        bar_chart.data = chart_data;
        bar_chart.descriptionText = "";
        bar_chart.xAxis.labelTextColor = UIColor.whiteColor();
        bar_chart.xAxis.gridColor = UIColor.whiteColor();
        bar_chart.rightAxis.gridColor = UIColor.whiteColor();
        bar_chart.rightAxis.labelTextColor = UIColor.whiteColor();
        bar_chart.leftAxis.labelTextColor = UIColor.whiteColor();
        bar_chart.leftAxis.gridColor = UIColor.whiteColor();
        bar_chart.legend.textColor = UIColor.whiteColor();
        super_view.addSubview(bar_chart);
        
        // set title
        set_title(bar_chart, in_text: "Height & Weight");
    }
}
