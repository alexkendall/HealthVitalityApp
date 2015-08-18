//
//  BloodPressureController.swift
//  
//
//  Created by Alex Harrison on 8/18/15.
//
//

import Foundation
import Charts

class BloodPressureController:BaseController
{
    var horizontal_chart:HorizontalBarChartView!;
    override func viewDidLoad() {
        super.viewDidLoad();
        
        // add bar chart view
        var chart_dim:CGFloat = super_view.bounds.width * 0.9;
        var offset_x:CGFloat = (super_view.bounds.width - chart_dim) * 0.5;
        var offset_y:CGFloat = (super_view.bounds.height - chart_dim) * 0.5;
        
        // configure line chart frame
        horizontal_chart = HorizontalBarChartView(frame: CGRect(x: offset_x, y: offset_y, width: chart_dim, height: chart_dim));
        super_view.addSubview(horizontal_chart);
        
        var data = [72, 116.0];
        var tag:String = "(Healthy)";
        if(data[0] > 80) || (data[1] > 120)
        {
            tag = "(Unhealthy)"
        }
        var stats = ["Diastolic BP " + tag, "Systolic BP " + tag];
        var entries = [BarChartDataEntry]();
        for(var i = 0; i < data.count; ++i)
        {
            var data_entry = BarChartDataEntry(value: data[i], xIndex: i);
            entries.append(data_entry);
        }
        var data_set = BarChartDataSet(yVals: entries, label: "mmHG");
        data_set.colors = [PIONEER_RED, SUNSET_YELLOW];
        data_set.valueFont = UIFont.systemFontOfSize(12.0);
        data_set.valueTextColor = UIColor.whiteColor();
        var chart_data = BarChartData(xVals: stats, dataSet: data_set);
        horizontal_chart.data = chart_data;
        
        // configure visuals
        horizontal_chart.descriptionText = "";
        horizontal_chart.gridBackgroundColor = UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.5);
        horizontal_chart.leftAxis.gridColor = UIColor.whiteColor();
        horizontal_chart.leftAxis.labelTextColor = UIColor.whiteColor();
        horizontal_chart.rightAxis.gridColor = UIColor.whiteColor();
        horizontal_chart.rightAxis.labelTextColor = UIColor.whiteColor();
        horizontal_chart.xAxis.labelPosition = ChartXAxis.XAxisLabelPosition.BottomInside;
        horizontal_chart.legend.textColor = UIColor.whiteColor();
        
        super_view.addSubview(horizontal_chart);
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated);
        horizontal_chart.animate(xAxisDuration: 2.0, yAxisDuration: 2.0);
    }
}