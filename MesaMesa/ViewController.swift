//
//  ViewController.swift
//  MesaMesa
//
//  Created by NOAA Education and Outreach on 5/3/17.
//  Copyright © 2017 PMG. All rights reserved.
//

import UIKit
import FirebaseCore
import FirebaseAuth

class ViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var pwordTextField: UITextField!
    
    @IBOutlet weak var errorText: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
            errorText.isHidden = true
    }
    
    
    @IBAction func getStartedTapped(_ sender: Any) {
        FIRAuth.auth()?.signIn(withEmail: emailTextField.text!, password: pwordTextField.text!, completion: { (user, error) in
            print("We tried to sign in")
            if error != nil {
                self.errorText.isHidden=false
                print("Hey, Error: \(error)")
                                FIRAuth.auth()?.createUser(withEmail: self.emailTextField.text!, password: self.pwordTextField.text!, completion: { (user, error) in
                    print("we tried to create a user")
                    if error != nil {
                       print("Hey, Error: \(error)")
                    }else{
                        print("New User Created")
                    }
                })
            }else{
                print("Signed-in Successfully")
            }
        })
    }
    
    
}

