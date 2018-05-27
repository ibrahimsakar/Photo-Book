//
//  detailsVC.swift
//  Photo Book
//
//  Created by İbrahim Şakar on 27.05.2018.
//  Copyright © 2018 İbrahim Şakar. All rights reserved.
//

import UIKit

class detailsVC: UIViewController {

    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var photoNameText: UITextField!
    @IBOutlet weak var photographerText: UITextField!    
    @IBOutlet weak var dateText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func saveButtonClicked(_ sender: Any) {
    }
    
}
