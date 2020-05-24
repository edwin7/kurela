//
//  Onboarding3ViewController.swift
//  Kurela
//
//  Created by Felicia Juwantoro on 23/05/20.
//  Copyright © 2020 Group 16 MC2 2020. All rights reserved.
//

import UIKit

class Onboarding3ViewController: UIViewController {
    
    var window: UIWindow?
    var navArrayMenu = [UINavigationController]()
    var tabbarController = UITabBarController()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func startButton(_ sender: UIButton){
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let tabBarViewController = storyboard.instantiateViewController(withIdentifier: "TabBarIdentifier")
        let targetNavigationController = UINavigationController(rootViewController: tabBarViewController)
        self.present(targetNavigationController, animated: true, completion: nil)
        self.modalPresentationStyle = .fullScreen
        
        }
    }

