//
//  Algorithms.swift
//  HealthApp
//
//  Created by Alex Harrison on 8/6/15.
//  Copyright (c) 2015 Alex Harrison. All rights reserved.
//

import Foundation

//----------------------------------------------------------------------------------------------------------------------

//predicts age based om sodium level
// equation based on linear regression derived from data at http://www.statcrunch.com/5.0/viewreport.php?reportid=15270
// AGE = 0.9963(SODIUM LEVEL) - 100.18
func get_age_from_sodium(var sodium_level:Double)->Double
{
    return (0.9973 * sodium_level) - 100.18;
}

//----------------------------------------------------------------------------------------------------------------------

//predicts age based om systolic blood pressure
// equation based on linear regression derived from data at http://www.statcrunch.com/5.0/viewreport.php?reportid=15270
// AGE = 0.8298(Blood Pressure) - 69.622
func get_age_from_blood_pressue(var blood_pressure:Double)->Double
{
    return (0.8298 * blood_pressure) - 69.622;
}

//----------------------------------------------------------------------------------------------------------------------