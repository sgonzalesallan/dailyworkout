//
//  CalculateViewController.swift
//  Daily Workout
//
//  Created by Allan Gonzales on 10/17/17.
//  Copyright © 2017 UPang. All rights reserved.
//

import UIKit

class CalculateViewController: UIViewController {

    @IBOutlet weak var calorieLabel: UILabel!
    @IBOutlet weak var numberOfMinutes: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.calorieLabel.text = "0.00"
        if let _ = User.current_user() {
   
        } else {
            let controller = self.storyboard?.instantiateViewControllerWithIdentifier("ProfileNavigationController")
            self.presentViewController(controller!, animated: false, completion: nil)
        }
        
        let right = UIBarButtonItem(title: "History", style: UIBarButtonItemStyle.Plain, target: self, action: #selector(self.showHistory))
        self.navigationItem.rightBarButtonItem = right
        
        let left = UIBarButtonItem(title: "Recommendation", style: UIBarButtonItemStyle.Plain, target: self, action: #selector(self.showHistory))
        self.navigationItem.leftBarButtonItem = left
        // Do any additional setup after loading the view.
    }
    
    func showHistory() {
        let controller = self.storyboard?.instantiateViewControllerWithIdentifier("HistoryViewController") as? HistoryViewController
        self.navigationController?.pushViewController(controller!, animated: true)
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        if let user = User.current_user() {
            let label = UILabel(frame: CGRect(x: 0, y: 0, width: 50, height: 40))
            label.text = user.name
            label.font = UIFont.systemFontOfSize(14)
            let touch = UITapGestureRecognizer(target: self, action: #selector(self.showProfile))
            touch.numberOfTapsRequired = 1
            touch.numberOfTouchesRequired = 1
            label.userInteractionEnabled = true
            label.addGestureRecognizer(touch)
            self.navigationItem.titleView = label
        }
        
    }
    
    func showProfile() {
        let controller = self.storyboard?.instantiateViewControllerWithIdentifier("ProfileNavigationController")
        self.presentViewController(controller!, animated: false, completion: nil)

    }

    
    func showRecommendations() {
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func calculate(sender: AnyObject) {
        
        let user = User.current_user()!
        var computation: Double = 0

        let weight = 9.99 * user.weight_double
        let height = 6.25 * user.height_double
        let age = 4.92 * Double(user.age)
        let minutes = Double(numberOfMinutes.text!)
        if user.gender == "Female" {
            computation = ((weight + height) - age) - 161
        } else {
            computation = ((weight + height) - age) + 5
        }
        
        computation = computation * minutes!
        
        let calories = user.weight_double - (computation * 1/7.715)
        self.calorieLabel.text = String(format: "%.2f", computation)
        
        DataController.save(computation, date_created: NSDate(), height: user.height_double, minutes_taken: minutes!, weight: user.weight_double)
    }

}
