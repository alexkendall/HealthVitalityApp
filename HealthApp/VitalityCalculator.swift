//
//  VitalityCalculator.swift
//  HealthApp
//
//  Created by Alex Harrison on 8/3/15.
//  Copyright (c) 2015 Alex Harrison. All rights reserved.
//

import Foundation


// function which estimates a users age based on their body index
// equation is derived from https://en.wikipedia.org/wiki/Body_mass_index
// y = 0.0072x6 - 0.1583x5 + 1.2972x4 - 4.825x3 + 7.3956x2 - 0.9167x + 22.8

func getAgefromBMI(var BMI:Double)->Double
{
    /*
    var pol6 = pow(0.0072 * BMI, 6);
    var pol5  = pow(0.1583 * BMI, 5);
    var pol4 = pow(1.2972 * BMI, 4);
    var pol3 = pow(4.825 * BMI, 3);
    var pol2 = pow(7.3956 * BMI, 2);
    var pol1 = 0.9167 * BMI;
    var pol0 = 22.8;
    
    println(pol6);
    println(pol5);
    println(pol4);
    println(pol3);
    println(pol2);
    println(pol1);
    println(pol0);
    
    return pol6 - pol5 + pol4 - pol3 + pol2 - pol1 + pol0;
    */
    
    //y = 0.9374ln(x) + 26.601
    
    return 0.9374 * log(BMI) + 26.601;


}