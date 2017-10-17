//
//  DataController.swift
//  Daily Workout
//
//  Created by Allan Gonzales on 10/17/17.
//  Copyright © 2017 UPang. All rights reserved.
//

import UIKit
import CoreData

class DataController: NSObject {
    
    var db_name = "DailyWorkOut_Model"
    
    var managedObjectContext: NSManagedObjectContext
    
    override  init() {
        // This resource is the same name as your xcdatamodeld contained in your project.
        guard let modelURL = NSBundle.mainBundle().URLForResource(db_name, withExtension:"momd") else {
            fatalError("Error loading model from bundle")
        }
        // The managed object model for the application. It is a fatal error for the application not to be able to find and load its model.
        guard let mom = NSManagedObjectModel(contentsOfURL: modelURL) else {
            fatalError("Error initializing mom from: \(modelURL)")
        }
        let psc = NSPersistentStoreCoordinator(managedObjectModel: mom)
        self.managedObjectContext = NSManagedObjectContext(concurrencyType: .MainQueueConcurrencyType)
        self.managedObjectContext.persistentStoreCoordinator = psc
        
        let urls = NSFileManager.defaultManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask)
        let docURL = urls[urls.endIndex-1]
        
        /* The directory the application uses to store the Core Data store file.
         This code uses a file named "DataModel.sqlite" in the application's documents directory.
         */
        let storeURL = docURL.URLByAppendingPathComponent(db_name)
        do {
            try psc.addPersistentStoreWithType(NSSQLiteStoreType, configuration: nil, URL: storeURL, options: nil)
        } catch {
            fatalError("Error migrating store: \(error)")
        }
        
    }
    
    static func save(calories_burn: NSNumber, date_created: NSDate, height: NSNumber, minutes_taken: NSNumber, weight: NSNumber) {
        let managedObject = DataController().managedObjectContext
        
        let entity = NSEntityDescription.insertNewObjectForEntityForName("Activity", inManagedObjectContext: managedObject) as! Activity

        entity.setValue(calories_burn, forKey: "calories_burn")
        entity.setValue(date_created, forKey: "date_created")
        entity.setValue(height, forKey: "height")
        entity.setValue(minutes_taken, forKey: "minutes_taken")
        entity.setValue(weight, forKey: "weight")

        // we save our entity
        do {
            try managedObject.save()
        } catch {
            fatalError("Failure to save context: \(error)")
        }
    }
    
    static func fetch(block: [AnyObject] -> Void) {
        let managedObject = DataController().managedObjectContext
        let personFetch = NSFetchRequest(entityName: "Activity")
        
        do {
            let list = try managedObject.executeFetchRequest(personFetch)
            block(list)            
        } catch {
            fatalError("Failed to fetch person: \(error)")
        }
    }
    
    static func delete() {
        let managedObject = DataController().managedObjectContext
        let fetchRequest = NSFetchRequest()
        fetchRequest.entity = NSEntityDescription.entityForName("Activity", inManagedObjectContext: managedObject)
        fetchRequest.includesPropertyValues = false
        do {
            if let results = try managedObject.executeFetchRequest(fetchRequest) as? [NSManagedObject] {
                for result in results {
                    managedObject.deleteObject(result)
                }
                
                try managedObject.save()
            }
        } catch {
        }
    }
}
