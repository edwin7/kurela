//
//  OnboardingViewController.swift
//  Kurela
//
//  Created by Felicia Juwantoro on 23/05/20.
//  Copyright © 2020 Group 16 MC2 2020. All rights reserved.
//

import UIKit

class OnboardingViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    @IBAction func continueButton(_ sender: Any) {
        self.performSegue(withIdentifier: "nextBoarding", sender: self)
    }
    
}
