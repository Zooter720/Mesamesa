//
//  newLayoutViewController.swift
//  MesaMesa
//
//  Created by NOAA Education and Outreach on 5/9/17.
//  Copyright © 2017 PMG. All rights reserved.
//

import UIKit
import FirebaseDatabase
import FirebaseAuth
class newLayoutViewController: UIViewController {

    @IBOutlet weak var layoutNameTextField: UITextField!
   
    @IBOutlet weak var nextButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
           // Do any additional setup after loading the view.
    }

    @IBAction func nextTapped(_ sender: Any) {
        let userID : String = (FIRAuth.auth()?.currentUser?.uid)!
         print("Current user ID is " + userID)
      //FIRDatabase.database().reference().child("users").child(userID).child("layouts").childByAutoId().child("name").setValue(layoutNameTextField.text)
        
        FIRDatabase.database().reference().child("users").child(userID).child("layouts").child(layoutNameTextField.text!)
       
    }
    
        
    
    
}
