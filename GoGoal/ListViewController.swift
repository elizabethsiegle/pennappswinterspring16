//
//  ListViewController.swift
//  GoGoal
//
//  Created by Elizabeth Siegle on 1/23/16.
//  Copyright © 2016 Elizabeth Siegle. All rights reserved.
//

import UIKit

class ListViewController: UITableViewController {
//    var itemsList = [
//        GoalItem(name: "Warriors"),
//        GoalItem(name: "Giants"),
//        GoalItem(name: "WTA")
//        ]
    
    let goalsManager = GoalsManager()
    
    var newItem : GoalItem?
    
    @IBAction func unwindToList(segue: UIStoryboardSegue) {
        if segue.identifier == "DoneItem" {
            let addItemController = segue.sourceViewController as! AddViewController
            if let newItem = addItemController.newItem {
                goalsManager.goals += [newItem] //other newItem?
                
                let indexPath = NSIndexPath(forRow: goalsManager.goals.count - 1, inSection: 0)
                tableView.insertRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
            }
        }
        goalsManager.save()
    
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return goalsManager.goals.count
    }
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        self.title = "GoGoal"
        let cell = tableView.dequeueReusableCellWithIdentifier("ListViewCell", forIndexPath:indexPath) as! UITableViewCell
        
        let item = goalsManager.goals[indexPath.row]
        cell.textLabel?.text = item.name
        return cell
    }
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == UITableViewCellEditingStyle.Delete {
            goalsManager.goals.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Automatic)
        }
        goalsManager.save()
    }


}
