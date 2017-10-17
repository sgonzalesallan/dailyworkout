//
//  HistoryViewController.swift
//  Daily Workout
//
//  Created by Allan Gonzales on 10/17/17.
//  Copyright © 2017 UPang. All rights reserved.
//

import UIKit
import CoreData

class CellTableView: UITableViewCell {
    
    @IBOutlet weak var calorieLabel: UILabel!
    @IBOutlet weak var kgLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
}

class HistoryViewController: UITableViewController {

    var list: [AnyObject] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = "History"
        self.fetch()
        let right = UIBarButtonItem(title: "Delete", style: UIBarButtonItemStyle.Plain, target: self, action: #selector(self.deleteHistory))
        self.navigationItem.rightBarButtonItem = right
        // Do any additional setup after loading the view.
    }
    
    func deleteHistory() {
        DataController.delete()
        self.fetch()
    }
    
    func fetch() {
        DataController.fetch { (result) in
            self.list = result as! [AnyObject]
            self.tableView.reloadData()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

extension HistoryViewController {
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as? CellTableView
        let activity = self.list[indexPath.row] as? Activity
        if let calo = activity?.calories_burn {
            cell?.calorieLabel.text = String(format: "%.2f", Double(calo))
            cell?.kgLabel.text = "\(activity!.weight!) kg"
            
            let dateformatter = NSDateFormatter()
            dateformatter.dateStyle = .MediumStyle
            cell?.dateLabel.text = "\(dateformatter.stringFromDate(activity!.date_created!))"
        }
        return cell!
    }
}
