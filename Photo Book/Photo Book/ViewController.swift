//
//  ViewController.swift
//  Photo Book
//
//  Created by İbrahim Şakar on 27.05.2018.
//  Copyright © 2018 İbrahim Şakar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    @IBAction func addButtonClicked(_ sender: Any) {
        
        performSegue(withIdentifier: "toDetailsVC", sender: nil)
        
    }
    
}

