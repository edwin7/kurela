//
//  Onboarding2ViewController.swift
//  Kurela
//
//  Created by Felicia Juwantoro on 23/05/20.
//  Copyright © 2020 Group 16 MC2 2020. All rights reserved.
//

import UIKit

class Onboarding2ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func continueButton(_ sender: UIButton) {
        self.performSegue(withIdentifier: "finalBoarding", sender: self)
    }
    
}
