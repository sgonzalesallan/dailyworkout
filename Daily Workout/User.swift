//
//  User.swift
//  Daily Workout
//
//  Created by Allan Gonzales on 10/17/17.
//  Copyright © 2017 UPang. All rights reserved.
//

import UIKit

class User: NSObject, NSCoding {
    var name: String = ""
    var birthdate: String = ""
    var gender: String = ""
    var weight: String = ""
    var height: String = ""
    
    
    var weight_double: Double {
        return Double(weight)!
    }
    
    var height_double: Double {
        return Double(height)!
    }
    
    var age: Int {
        let dateformatter = NSDateFormatter()
        dateformatter.dateFormat = "dd/mm/yy"
        let date = dateformatter.dateFromString(self.birthdate)
        dateformatter.dateFormat = "yyyy"
        let year = Int(dateformatter.stringFromDate(date!))
        let today = Int(dateformatter.stringFromDate(NSDate()))
        
        return today! - year!
    }

    init(name: String, birthdate: String, gender: String, weight: String, height: String) {
        self.name = name
        self.birthdate = birthdate
        self.gender = gender
        self.weight = weight
        self.height = height
    }
    
    required convenience init?(coder decoder: NSCoder) {
        print("decoding...")

        let name: String = decoder.decodeObjectForKey("name") as! String
        let birthdate: String = decoder.decodeObjectForKey("birthdate") as! String
        let gender: String = decoder.decodeObjectForKey("gender") as! String
        let weight: String = decoder.decodeObjectForKey("weight") as! String
        let height: String = decoder.decodeObjectForKey("height") as! String
        self.init(name: name, birthdate: birthdate, gender: gender, weight: weight, height: height)
    }
    
    func encodeWithCoder(coder: NSCoder) {
        print("encoding...")
        coder.encodeObject(self.name, forKey: "name")
        coder.encodeObject(self.birthdate, forKey: "birthdate")
        coder.encodeObject(self.gender, forKey: "gender")
        coder.encodeObject(self.weight, forKey: "weight")
        coder.encodeObject(self.height, forKey: "height")
    }
    
    static let key = "user_key"
    
    func save() {
        let userDefault = NSUserDefaults.standardUserDefaults()
        let archivedData = NSKeyedArchiver.archivedDataWithRootObject(self)
        userDefault.setObject(archivedData, forKey: User.key)
        userDefault.synchronize()
        // Save user
    }
    
    static func current_user() -> User? {
        let userDefault = NSUserDefaults.standardUserDefaults()
        if let data = userDefault.objectForKey(User.key) as? NSData {
            let unarchivedData = NSKeyedUnarchiver(forReadingWithData: data)
            return unarchivedData.decodeObjectForKey("root") as? User // Saved user
        }
        return nil // No user
    }
}
