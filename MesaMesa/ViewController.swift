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
import FirebaseDatabase

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
                
                
                // an error occurred while attempting login
                if let errCode = FIRAuthErrorCode(rawValue: (error?._code)!) {
                    switch errCode {
                    case .errorCodeEmailAlreadyInUse:
                        print("case1")
                    case .errorCodeInvalidEmail:
                        print("case2 invalid email")
                    case .errorCodeWrongPassword:
                        print("case3 wrong password")
                        self.errorText.isHidden=false
                        //let delayInSeconds = 3.0
                        //DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + delayInSeconds) {
                            // here code perfomed with delay
                        //}
                        
                    default : print("fu")
                    }
                }
                
                
                //print("Hey, Error: \(error)")
                FIRAuth.auth()?.createUser(withEmail: self.emailTextField.text!, password: self.pwordTextField.text!, completion: { (user, error) in
                    
                    print("we tried to create a user")
                    if error != nil {
                        print("Hey, Error: \(error!)")
                        //self.errorText.isHidden = true
                    }else{
                        print("New User Created")
                        //add user to database
                      FIRDatabase.database().reference().child("users").child(user!.uid).child("email").setValue(user!.email!)
                        
                        self.errorText.text="We just created a MesaMesa account for you. Welcome to the table."
                        self.errorText.textColor = UIColor.black
                        self.errorText.isHidden = false
                        let delayInSeconds = 2.5
                        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + delayInSeconds) {
                            self.performSegue(withIdentifier: "signinSegue", sender: nil)
                        }

                    }
                })
            }else{
                self.errorText.isHidden = true

                print("Signed-in Successfully")
                self.performSegue(withIdentifier: "signinSegue", sender: nil)
            }
        })
    }
    
    
}

