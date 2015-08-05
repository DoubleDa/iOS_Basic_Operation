//
//  ViewController.swift
//  HitList
//
//  Created by 游义男 on 15/8/5.
//  Copyright (c) 2015年 游义男. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController,UITableViewDataSource{
    //Model层
    var names = [String]()
    var people = [NSManagedObject]()
//    var names:[String] = ["TOM","Jorden","KEV","ROBB"]
    @IBOutlet weak var tableView: UITableView!
    @IBAction func addName(sender: AnyObject) {
        var alert = UIAlertController(title: "New name", message: "Add a new name", preferredStyle: UIAlertControllerStyle.Alert)
        
        //创建两个按钮
        let saveAction = UIAlertAction(title: "Save", style: UIAlertActionStyle.Default) { (action:UIAlertAction!) -> Void in
            let textField = alert.textFields![0] as! UITextField
//            self.names.append(textField.text)
            self.saveName(textField.text)
            self.tableView.reloadData()
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Default) { (action:UIAlertAction!) -> Void in
        }
        
        alert.addTextFieldWithConfigurationHandler { (textField:UITextField!) -> Void in
        }
        alert.addAction(saveAction)
        alert.addAction(cancelAction)
        self.presentViewController(alert, animated: true, completion: nil)
    }
    
    func saveName(name:String){
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext
        let entity = NSEntityDescription.entityForName("Person", inManagedObjectContext: managedContext!)
        let person = NSManagedObject(entity: entity!, insertIntoManagedObjectContext: managedContext)
        person.setValue(name, forKey: "name")
        var error:NSError?
        if !(managedContext?.save(&error) != nil){
            println("Could not save \(error), \(error!.userInfo)")
        }
        people.append(person)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        title = "\"The List\""
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "Cell")
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext
        let fetchRequest = NSFetchRequest(entityName: "Person")
        var error:NSError?
        let fetchedResults = managedContext?.executeFetchRequest(fetchRequest, error: &error) as? [NSManagedObject]
        if let results = fetchedResults{
            people = results
        }else{
            println("Could not fetch \(error),\(error!.userInfo)")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return people.count
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell") as! UITableViewCell
//        cell.textLabel?.text = names[indexPath.row]
        let person = people[indexPath.row]
        cell.textLabel?.text = person.valueForKey("name") as? String
        return cell
    }


}

