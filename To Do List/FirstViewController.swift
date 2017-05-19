//
//  FirstViewController.swift
//  To Do List
//
//  Created by Ross on 05/05/2017.
//  Copyright © 2017 Braaaaap. All rights reserved.
//

    import UIKit
    
    class FirstViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
        
        
        @IBOutlet weak var table: UITableView!
        
        var items:[String] = []

        
        
        internal func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            
            return items.count
            
        }
        
        internal func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            
            let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "Cell")
            
            cell.textLabel?.text = items[indexPath.row]
            
            return cell
            
        }
        
        override func viewDidLoad() {
            super.viewDidLoad()
            // Do any additional setup after loading the view, typically from a nib.
            
            
        }
        
        override func viewDidAppear(_ animated: Bool) {
            
            let itemsObject = UserDefaults.standard.object(forKey: "items") // pulls back our permanent items from storage
            
            if let tempItems = itemsObject as? [String] { //creates a mutable variable, and attempts to 'cast' it to create an array
                
                items = tempItems // sets the storeditems and the array query as the same

        }
            
            table.reloadData()
            
        }
        
        
        func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
            
            if editingStyle == UITableViewCellEditingStyle.delete {
                
                items.remove(at: indexPath.row)
                
                table.reloadData()
                
                UserDefaults.standard.set(items, forKey: "items")
                
                
            }
            
        }
        //override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        //    if editingStyle == UITableViewCellEditingStyle.Delete {
        //        numbers.removeAtIndex(indexPath.row)
        //        tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Automatic)
        //    }
        //}
        
        override func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
            
        }
    }



