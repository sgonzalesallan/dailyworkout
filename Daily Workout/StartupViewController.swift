//
//  StartupViewController.swift
//  Daily Workout
//
//  Created by Student on 03/10/2017.
//  Copyright © 2017 UPang. All rights reserved.
//

import UIKit

class StartupViewController: UIViewController
{
    override func viewDidLoad()
    {
        super.viewDidLoad()
    }
    @IBAction func save(sender: UIButton)
    {
        if name.text != " "
        {
            performSegueWithIdentifier("pass", sender: self)
        }
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
        let variable = segue.destinationViewController as! ViewController
        variable.myString = name.text!
    }
    
    @IBOutlet var name: UITextField!
    @IBOutlet var month: UITextField!
    @IBOutlet var day: UITextField!
    @IBOutlet var year: UITextField!
    @IBAction func clear(sender: UIButton)
    {
        name.text = ""
        month.text = ""
        day.text = ""
        year.text = ""
        name.becomeFirstResponder()
    }
    //MALE
    @IBOutlet weak var uncheck1: UIButton!
    
    
    @IBAction func btn1(sender: UIButton)
    {
      sender.setImage(UIImage(named: "check.png")!, forState: .Normal)
    }
    
    
    
    
    
    
    
    //FEMALE
    @IBAction func btn2(sender: UIButton)
    {
        sender.setImage(UIImage(named: "check.png")!, forState: .Normal)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
