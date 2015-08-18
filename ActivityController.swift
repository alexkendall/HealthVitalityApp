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
    var steps = [Double]();
    var lineChartView:myLineChart!;
    
    var pie_chart:PieChartView!;
    var chart_in_frame = CGRect();
    var chart_out_frame = CGRect();
    
    override func viewDidLoad() {
        super.viewDidLoad();

        println("View is loading...!");
        // add bar chart view
        var chart_dim:CGFloat = super_view.bounds.width * 0.9;
        var offset_x:CGFloat = (super_view.bounds.width - chart_dim) * 0.5;
        var offset_y:CGFloat = (super_view.bounds.height - chart_dim) * 0.5;
        
        // configure line chart frame
        //lineChartView = myLineChart(frame: CGRect(x: offset_x, y: offset_y, width: chart_dim, height: chart_dim));
        //super_view.addSubview(lineChartView)
        
        pie_chart = PieChartView(frame: CGRect(x: offset_x, y: offset_y, width: chart_dim, height: chart_dim));
        //super_view.addSubview(pie_chart);
        
        // configure mock line chart data
        days = ["Mon", "Tues", "Wed", "Thurs", "Fri", "Sat", "Sun"];
        steps = [2000.0, 4000.0, 6000.0, 5000.0, 1200.0, 5000.0, 6000.0];
        
        super_view.addSubview(pie_chart);
        setChart(days, values: steps);
        
    

    }
    
    override func viewDidAppear(animated: Bool)
    {
        super.viewDidAppear(animated);
        pie_chart.animate(xAxisDuration: 2.0, yAxisDuration: 2.0);
    }
    
    func setChart(dataPoints: [String], values: [Double])
    {
        var entries = [ChartDataEntry]();
        for(var i = 0; i < dataPoints.count; ++i)
        {
            var chart_entry = ChartDataEntry(value: values[i], xIndex: i);
            entries.append(chart_entry);
            
        }
        
        var data_set = PieChartDataSet(yVals: entries, label: "Steps");
        data_set.colors = [PIONEER_RED, SUNSET_YELLOW, SOFT_LIME, PALE_VIOLET, SOFT_ORANGE, TEAL, UIColor.lightGrayColor()];
        data_set.valueTextColor = UIColor.blackColor();
        var data = PieChartData(xVals: dataPoints, dataSet: data_set);
        pie_chart.data = data;
        pie_chart.legend.enabled = false;
        pie_chart.centerText = "Daily Step Activity";
        pie_chart.centerTextFont = UIFont.systemFontOfSize(17.0);
        pie_chart.centerTextColor = UIColor.whiteColor();
        pie_chart.descriptionText = "";
        pie_chart.holeTransparent = true;
        pie_chart.holeColor = UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0);
        //pie_chart.transparentCircleRadiusPercent = 0.0;
        
        //lineChartView.data = data;
        
        
        // configure data set graphics
        //data_set.circleColors = [SUNSET_YELLOW];
        //data_set.circleHoleColor = UIColor.whiteColor();
        //data_set.drawValuesEnabled = false;
        //data_set.lineWidth = 2.0;
        //data_set.highlightColor = UIColor.orangeColor();
        
        // configure chart
        //lineChartView.legend.labels = ["Steps Taken"];
        //lineChartView.legend.colors = [UIColor.whiteColor()];
        //lineChartView.highlightEnabled = true;
        
        set_title(pie_chart, in_text: "Steps Activity");
        
        /*
        var entries = [ChartDataEntry]();
        for(var i = 0; i < dataPoints.count; ++i)
        {
            var chart_entry = ChartDataEntry(value: values[i], xIndex: i);
            entries.append(chart_entry);
        
        }
        
        var data_set = LineChartDataSet(yVals: entries, label: "Steps");
        var data = LineChartData(xVals: dataPoints, dataSet: data_set);
        lineChartView.data = data;

       
        // configure data set graphics
        data_set.circleColors = [SUNSET_YELLOW];
        data_set.colors = [SUNSET_YELLOW];
        data_set.circleHoleColor = UIColor.whiteColor();
        data_set.drawValuesEnabled = false;
        data_set.lineWidth = 2.0;
        data_set.highlightColor = UIColor.orangeColor();
        
        // configure chart
        lineChartView.legend.labels = ["Steps Taken"];
        lineChartView.legend.colors = [UIColor.whiteColor()];
        lineChartView.highlightEnabled = true;
        
        set_title(lineChartView, in_text: "Steps Activity");
        */
    }
}

