//
//  ViewController.swift
//  Photo Book
//
//  Created by İbrahim Şakar on 27.05.2018.
//  Copyright © 2018 İbrahim Şakar. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var nameArray = [String]()
    var photographerArray = [String]()
    var imageArray = [UIImage]()
    var dateArray = [Int]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        getInfo()
    }
    
    func getInfo(){
        
        nameArray.removeAll(keepingCapacity: false)
        photographerArray.removeAll(keepingCapacity: false)
        imageArray.removeAll(keepingCapacity: false)
        dateArray.removeAll(keepingCapacity: false)
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let fetch = NSFetchRequest<NSFetchRequestResult>(entityName: "Photos")
        fetch.returnsObjectsAsFaults = false
        
        do{
            let results = try context.fetch(fetch)
            if results.count > 0 {
                for result in results as! [NSManagedObject] {
                    if let name = result.value(forKey: "photoName") as? String {
                        self.nameArray.append(name)
                    }
                    if let photographer = result.value(forKey: "photographer") as? String {
                        self.photographerArray.append(photographer)
                    }
                    if let date = result.value(forKey: "date") as? Int {
                        self.dateArray.append(date)
                    }
                    if let imageData = result.value(forKey: "image") as? Data {
                        let image = UIImage(data: imageData)
                        self.imageArray.append(image!)
                    }
                    
                    self.tableView.reloadData()
                    
                }
            }
        }catch{
            print("Error")
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nameArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = nameArray[indexPath.row]
        return cell
    }
    
    @IBAction func addButtonClicked(_ sender: Any) {
        
        performSegue(withIdentifier: "toDetailsVC", sender: nil)
        
    }
    
}

