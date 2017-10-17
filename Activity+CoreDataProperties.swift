//
//  Activity+CoreDataProperties.swift
//  Daily Workout
//
//  Created by Allan Gonzales on 10/17/17.
//  Copyright © 2017 UPang. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Activity {

    @NSManaged var minutes_taken: NSNumber?
    @NSManaged var calories_burn: NSNumber?
    @NSManaged var weight: NSNumber?
    @NSManaged var height: NSNumber?
    @NSManaged var date_created: NSDate?

}
