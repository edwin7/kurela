//
//  ProfileViewController.swift
//  Kurela
//
//  Created by M Habib Ali Akbar on 17/05/20.
//  Copyright © 2020 Group 16 MC2 2020. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var generalButton: UIButton!
    @IBOutlet weak var medicalButton: UIButton!
    @IBOutlet weak var documentButton: UIButton!
    @IBOutlet weak var emergencyButton: UIButton!
    @IBOutlet weak var profileImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        customUI(button: generalButton)
        customUI(button: medicalButton)
        customUI(button: documentButton)
        customUI(button: emergencyButton)
    }
    
    
    func customUI(button: UIView) {
        profileImage.layer.cornerRadius = profileImage.frame.height / 2.0
        
        button.layer.cornerRadius = 20
        button.layer.shadowColor = UIColor.gray.cgColor
        button.layer.shadowOpacity = 0.3
        button.layer.shadowRadius = 5
        button.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
    }
    


}
