//
//  profileViewController.swift
//  MesaMesa
//
//  Created by NOAA Education and Outreach on 5/9/17.
//  Copyright © 2017 PMG. All rights reserved.
//

import UIKit

class profileViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    
    @IBAction func logoutTapped(_ sender: Any) {
        //this brings the user back to login screen
        dismiss(animated: true, completion: nil)
    }

    
}
