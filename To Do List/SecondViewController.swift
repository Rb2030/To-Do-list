//
//  SecondViewController.swift
//  To Do List
//
//  Created by Ross on 05/05/2017.
//  Copyright © 2017 Braaaaap. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    
    
    @IBOutlet weak var enteredText: UITextField!
    
    
    
    @IBAction func submitItem(_ sender: Any) {
    
    
        let itemsObject = UserDefaults.standard.object(forKey: "items") // pulls back our permanent items from storage
        
        var items:[String] // defining the array
        
        if let tempItems = itemsObject as? [String] { //creates a mutable variable, and attempts to 'cast' it to create an array
            
            items = tempItems // sets the storeditems and the array query as the same
            
            items.append(enteredText.text!) // calls the method 'additems' and adds to the array, with the argument of text from the user text box, this is an optional, hence the ! although we can safely assume it has a value as even an empty string would have a value and we know that the text field actually exists. This line adds the item to the array
        
        }else {// if there is no array
            
            items = [enteredText.text!] // create an array and put the users text input in it
        }
    
    UserDefaults.standard.set(items, forKey: "items") // this saves the items in the storage
        
        enteredText.text = "" // This resets the user text field empty in case they want to add multiple items if they want to.
    
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        self.view.endEditing(true)
        
    }
    
    func enteredTextShouldReturn(_ enteredText: UITextField) -> Bool {
        
        enteredText.resignFirstResponder()
        
        return true
    }
   
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    
    }


}

