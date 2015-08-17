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
        lineChartView = LineChartView(frame: CGRect(x: offset_x, y: offset_y, width: chart_dim, height: chart_dim));
        super_view.addSubview(lineChartView)
        
        // configure mock line chartd data
        days = ["Mon", "Tues", "Wed", "Thurs", "Fri", "Sat", "Sun"];
        unitsSold = [2000.0, 4000.0, 6000.0, 3000.0, 1200.0, 5,000, 3,000];
        setChart(days, values: unitsSold);
        
    }
    
    override func viewDidAppear(animated: Bool)
    {
        super.viewDidAppear(animated);
        lineChartView.animate(xAxisDuration: 2.0, yAxisDuration: 2.0);
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

       
        // configure data set graphics
        data_set.circleColors = [UIColor.whiteColor()];
        data_set.colors = [UIColor.whiteColor()];
        data_set.circleHoleColor = UIColor.whiteColor();
        data_set.drawValuesEnabled = false;
        data_set.lineWidth = 1.0;
        data_set.highlightColor = UIColor.orangeColor();
        data_set.highlightLineWidth = 1.0;
        
        // confogure chart
        lineChartView.drawGridBackgroundEnabled = true;
        lineChartView.gridBackgroundColor = UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.5);
        lineChartView.descriptionText = "";
        
        // configure left axis
        lineChartView.leftAxis.labelTextColor = UIColor.whiteColor();
        lineChartView.leftAxis.gridColor = UIColor.whiteColor();
        lineChartView.leftAxis.gridLineWidth = 1.0;
        
        // conifgure right axis
        lineChartView.rightAxis.enabled = false;
        
        // configure x axis
        lineChartView.xAxis.labelTextColor = UIColor.whiteColor();
        lineChartView.xAxis.gridColor = UIColor.whiteColor();
        lineChartView.xAxis.gridLineWidth  = 1.0;
        lineChartView.xAxis.axisLineColor = UIColor.whiteColor();
        lineChartView.xAxis.axisLineWidth = 1.0;
        
        // configure legend
        lineChartView.legend.enabled = true;
        lineChartView.legend.labels = ["Steps Walked"];
        lineChartView.legend.colors = [UIColor.whiteColor()];
        lineChartView.legend.textColor = UIColor.whiteColor();
        
        // add label above chart
        var label = UILabel(frame: CGRect(x: 0.0, y: 0.0, width: super_view.bounds.width, height: lineChartView.frame.origin.y));
        label.textColor = UIColor.whiteColor();
        label.textAlignment = NSTextAlignment.Center;
        label.font = UIFont.systemFontOfSize(23.0);
        label.text = "Steps Activity";
        super_view.addSubview(label);
    }
}

