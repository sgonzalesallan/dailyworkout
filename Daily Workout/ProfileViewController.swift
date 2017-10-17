//
//  ProfileViewController.swift
//  Daily Workout
//
//  Created by Allan Gonzales on 10/17/17.
//  Copyright © 2017 UPang. All rights reserved.
//

import UIKit

class ProfileViewController: UITableViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var birthdateTextField: UITextField!
    @IBOutlet weak var genderTextField: UITextField!
    @IBOutlet weak var weightTextField: UITextField!
    @IBOutlet weak var heightTextField: UITextField!
    
    var datepicker = UIDatePicker()
    override func viewDidLoad() {
        super.viewDidLoad()
        if let user = User.current_user() {
            let button = UIBarButtonItem(barButtonSystemItem: .Stop, target: self, action: #selector(self.dismiss))
            self.navigationItem.leftBarButtonItem = button
            
            nameTextField.text = user.name
            birthdateTextField.text = user.birthdate
            genderTextField.text = user.gender
            weightTextField.text = user.weight
            heightTextField.text = user.height
        } else {
        }
        
        self.addToolBar(nameTextField)
        self.addToolBar(birthdateTextField)
        self.addToolBar(genderTextField)
        self.addToolBar(weightTextField)
        self.addToolBar(heightTextField)

        
        self.datepicker = UIDatePicker()
        datepicker.datePickerMode = UIDatePickerMode.Date
        birthdateTextField.inputView = datepicker
        datepicker.addTarget(self, action: #selector(self.birthDateChanged), forControlEvents: UIControlEvents.ValueChanged)
        // Do any additional setup after loading the view.
        
    }
    
    func birthDateChanged() {
        let dateformatter = NSDateFormatter()
        dateformatter.dateStyle = NSDateFormatterStyle.ShortStyle
        birthdateTextField.text = dateformatter.stringFromDate(self.datepicker.date)
    }
    
    func dismiss() {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func showProfile() {
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func addToolBar(textField: UITextField){
        let toolBar = UIToolbar()
        toolBar.barStyle = UIBarStyle.Default
        toolBar.translucent = true
        toolBar.tintColor = UIColor(red: 76/255, green: 217/255, blue: 100/255, alpha: 1)
        let doneButton = UIBarButtonItem(title: "Done", style: UIBarButtonItemStyle.Done, target: self, action: #selector(self.donePressed))

        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.FlexibleSpace, target: nil, action: nil)
        toolBar.setItems([spaceButton, doneButton], animated: false)
        toolBar.userInteractionEnabled = true
        toolBar.sizeToFit()
        
        textField.inputAccessoryView = toolBar
    }
    
    func showAlert(message: String) {
        let alert = UIAlertController(title: "Daily Workout", message: message, preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
        self.presentViewController(alert, animated: true, completion: nil)
    }
    
    func donePressed() {
        view.endEditing(true)
    }
    
    func isFormValid() -> Bool {
        if nameTextField.text == "" {
            self.showAlert("Name is required")
            return false
        } else if birthdateTextField.text == "" {
            self.showAlert("Birthdate is required")
            return false
        } else if genderTextField.text == "" {
            self.showAlert("Gender is required")
            return false
        } else if weightTextField.text == "" {
            self.showAlert("Weight is required")
            return false
        } else if heightTextField.text == "" {
            self.showAlert("Height is required")
            return false
        }
        
        return true
    }
    
    @IBAction func save(sender: AnyObject) {
        if !isFormValid() {
            return // Do nothing
        }
        
        let user = User(name: self.nameTextField.text!, birthdate: self.birthdateTextField.text!, gender: self.genderTextField.text!, weight: self.weightTextField.text!, height: self.heightTextField.text!)
        
        print("age: \(user.age)")
        user.save()
        DataController.delete()
        self.dismiss()
    }
    
}

extension ProfileViewController: UITextFieldDelegate {
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        self.donePressed()
        return true
    }
    
    func textFieldShouldBeginEditing(textField: UITextField) -> Bool {
        if textField == self.genderTextField {
            let actionSheetControllerIOS8: UIAlertController = UIAlertController(title: "Select Gender", message: "", preferredStyle: .ActionSheet)
     
            let cancelActionButton = UIAlertAction(title: "Cancel", style: .Cancel) { _ in
            }
            actionSheetControllerIOS8.addAction(cancelActionButton)
            
            let saveActionButton = UIAlertAction(title: "Male", style: .Default)
            { _ in
                self.genderTextField.text = "Male"
            }
            actionSheetControllerIOS8.addAction(saveActionButton)
            
            let deleteActionButton = UIAlertAction(title: "Female", style: .Default)
            { _ in
                self.genderTextField.text = "Female"
            }
            actionSheetControllerIOS8.addAction(deleteActionButton)
            self.presentViewController(actionSheetControllerIOS8, animated: true, completion: nil)
            return false
        }
        
        return true
    }
}
