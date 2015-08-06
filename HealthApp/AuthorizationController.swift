//
//  ViewController.swift
//  HealthApp
//
//  Created by Alex Harrison on 8/3/15.
//  Copyright (c) 2015 Alex Harrison. All rights reserved.
//

import UIKit
import HealthKit

let HealthStore:HKHealthStore = HKHealthStore();

class AuthorizeController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        request_authorization();
        
        // check if health kit is available on this device
        if(HKHealthStore.isHealthDataAvailable() == false)
        {
            println("HealthKit is unavailable.");
        }
        else
        {
            request_authorization();
            println("HealthKit is available.");
        }
        self.view.backgroundColor = UIColor.whiteColor();
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func request_authorization()
    {
        let healthKitTypesToRead = [
        HKObjectType.workoutType(),
        HKObjectType.quantityTypeForIdentifier(HKQuantityTypeIdentifierDistanceWalkingRunning),
        HKObjectType.quantityTypeForIdentifier(HKQuantityTypeIdentifierActiveEnergyBurned),
        HKObjectType.quantityTypeForIdentifier(HKQuantityTypeIdentifierHeartRate)
        ]
        
        let healthKitTypesToWrite = [
        HKObjectType.quantityTypeForIdentifier(HKQuantityTypeIdentifierBodyMassIndex),
        HKObjectType.quantityTypeForIdentifier(HKQuantityTypeIdentifierActiveEnergyBurned),
        HKObjectType.quantityTypeForIdentifier(HKQuantityTypeIdentifierDistanceWalkingRunning),
        HKObjectType.quantityTypeForIdentifier(HKQuantityTypeIdentifierHeight),
        HKObjectType.quantityTypeForIdentifier(HKQuantityTypeIdentifierDistanceCycling),
        HKQuantityType.workoutType()
        ]
        
        HealthStore.requestAuthorizationToShareTypes(Set(healthKitTypesToRead), readTypes: Set(healthKitTypesToRead)) { (success, error) -> Void in
            if(success)
            {
                println("success");
                EXIT_FAILURE;
            }
            if((error) != nil)
            {
                println("error");
                EXIT_FAILURE;
            }}

    }
}
  