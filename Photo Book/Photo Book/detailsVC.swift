//
//  detailsVC.swift
//  Photo Book
//
//  Created by İbrahim Şakar on 27.05.2018.
//  Copyright © 2018 İbrahim Şakar. All rights reserved.
//

import UIKit
import CoreData

class detailsVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var photoNameText: UITextField!
    @IBOutlet weak var photographerText: UITextField!    
    @IBOutlet weak var dateText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        imageView.isUserInteractionEnabled = true
        
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(detailsVC.selectImage))
        imageView.addGestureRecognizer(gestureRecognizer)
        
    }
    @objc func selectImage(){
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.sourceType = .photoLibrary
        picker.allowsEditing = true
        present(picker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        imageView.image = info[UIImagePickerControllerEditedImage] as? UIImage
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func saveButtonClicked(_ sender: Any) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let newPhotos = NSEntityDescription.insertNewObject(forEntityName: "Photos", into: context)
        
        newPhotos.setValue(photoNameText.text!, forKey: "photoName")
        newPhotos.setValue(photographerText.text!, forKey: "photographer")
        
        if let date = Int(dateText.text!) {
            newPhotos.setValue(date, forKey: "date")
        }
        
        let data = UIImageJPEGRepresentation(imageView.image!, 0.5)
        newPhotos.setValue(data, forKey: "image")
        
        do{
            try context.save()
            print("Successfully saved")
        }catch{
            print("Error")
        }
        
    }
    
}
