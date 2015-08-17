//
//  UserData.swift
//  HealthApp
//
//  Created by Alex Harrison on 8/16/15.
//  Copyright (c) 2015 Alex Harrison. All rights reserved.
//

import Foundation

enum SEX {case MALE, FEMALE}
enum MEASUREMENT_SYSTEM {case METRIC, US};

class Measurements:NSObject
{
    var sex:SEX = SEX.MALE;
    var height:Double = 0.0;
    var weight:Double = 0.0;
    var wingspan:Double = 0.0;
    var measurement_system:MEASUREMENT_SYSTEM = MEASUREMENT_SYSTEM.US;
    
    init(var in_sex:SEX, var in_height:Double, var in_weight:Double, var in_wingspan:Double, var in_measurement_system:MEASUREMENT_SYSTEM)
    {
        self.sex = in_sex;
        self.height = in_height;
        self.weight = in_weight
        self.wingspan = in_wingspan;
        self.measurement_system = in_measurement_system;
    }
    
    //---------------------------------------------------------------------
    
    class func CENTIMETERS_PER_INCH()-> Double
    {
        return 2.54;
    }
    
    class func POUNDS_PER_KILO() -> Double
    {
        return 2.20462;
    }
    
    // setters--------------------------------------------------------------
    func set_height(var in_height:Double)
    {
        self.height = in_height;
    }
    
    func set_weight(var in_weight:Double)
    {
        self.weight = in_weight;
    }
    
    func set_wingspan(var in_wingspan:Double)
    {
        self.wingspan = in_wingspan;
    }
    
    func set_sex(var in_sex:SEX)
    {
        self.sex = in_sex;
    }
    
    func set_measurement_system(var in_system:MEASUREMENT_SYSTEM)
    {
        if(self.measurement_system != in_system)    // // data is dirty -> change measurement system and update values
        {
            if(in_system == MEASUREMENT_SYSTEM.METRIC) // convert US to metric
            {
                self.height = Measurements.inches_to_centimeters(self.height);
                self.weight = Measurements.pounds_to_kilos(self.weight);
                self.wingspan = Measurements.inches_to_centimeters(self.wingspan);
            }
            else    // convert metric to us
            {
                self.height = Measurements.centimeters_to_inches(self.height);
                self.weight = Measurements.kilos_to_pounds(self.weight);
                self.wingspan = Measurements.centimeters_to_inches(self.wingspan);
            }
            self.measurement_system = in_system;
        }
        // do nothing if systems are the same
    }
    
    // -------------------------------------------------------------------
    
    // getters
    func get_height(var in_system:MEASUREMENT_SYSTEM)-> Double
    {
        var height_inches:Double;
        var height_meters:Double;
        return self.height;
    }
    
    func get_weight()->Double
    {
        return self.weight;
    }
    
    func get_wingspan()-> Double
    {
        return self.wingspan;
    }
    
    func get_system()-> MEASUREMENT_SYSTEM
    {
        return self.measurement_system;
    }
    
    // -------------------------------------------------------------------
    
    // conversion functions
    class func inches_to_centimeters(var num_inches:Double)->Double
    {
        // 1 m = 39.3701 in
        return num_inches * Measurements.CENTIMETERS_PER_INCH();
    }
    
    class func centimeters_to_inches(var num_centimeters:Double)->Double
    {
        return num_centimeters / Measurements.CENTIMETERS_PER_INCH();
    }
    
    class func pounds_to_kilos(var num_pounds:Double)->Double
    {
        return num_pounds / Measurements.POUNDS_PER_KILO();
    }

    class func kilos_to_pounds(var num_kilos:Double)->Double
    {
        return num_kilos * Measurements.POUNDS_PER_KILO();
    }
}
