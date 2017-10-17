//
//  ViewController.swift
//  Daily Workout
//
//  Created by Student on 03/10/2017.
//  Copyright © 2017 UPang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad()
    {
        super.viewDidLoad()
        labelname.text = "Hello " + myString
    }
    @IBAction func btnhelp(sender: UIButton)
    {
        btnhelp()
    }
    @IBAction func about(sender: UIButton)
    {
        btnabout()
    }
    func btnabout()
    {
        let alertController = UIAlertController(title: "ABOUT", message: "This application is intended for users that wants to improve their physical fitness and maintain their healthy body.", preferredStyle: UIAlertControllerStyle.Alert)
        alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
        self.presentViewController(alertController, animated: true, completion: nil)
    
    }
    func btnhelp()
    {
        let alertController = UIAlertController(title: "HELP", message: "Before using the app you first need to create your own profile by clicking the (NOT YOU?) button, then fill up the given information \n \n SELECTING: \n Select from the given choices of what you want to improve by clicking one of the four buttons in the main view (AB, ARMS, WAISTLINE, HIPS)", preferredStyle: UIAlertControllerStyle.Alert)
        alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
        self.presentViewController(alertController, animated: true, completion: nil)
        
    }
    @IBOutlet var nametext: UILabel!
    
        var myString = String()
    @IBOutlet var labelname: UILabel!
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }

}

