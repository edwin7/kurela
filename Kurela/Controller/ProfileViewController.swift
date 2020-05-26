//
//  ProfileViewController.swift
//  Kurela
//
//  Created by Feby Lailani on 20/05/20.
//  Copyright © 2020 Group 16 MC2 2020. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    
    @IBOutlet weak var settingsView: UIView!
    @IBOutlet weak var helpView: UIView!
    @IBOutlet weak var signoutView: UIView!
    @IBOutlet weak var nameLabel: UILabel!
    
    var userProfile: UsersProfile?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavBar()
        configureView()
        prepareData()
    }
    
    func prepareData() {
        userProfile = UsersProfile.fetchData(viewContext: getViewContext())
        nameLabel.text = userProfile?.name ?? "Your Name"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        prepareData()
    }
        
    func setupNavBar(){
        
        //large title for navbar
        navigationController?.navigationBar.prefersLargeTitles = true
        
        //navbar background color
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor(red: 0, green: 0.711, blue: 0.867, alpha: 1)
        
        //change title color
        appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        
        navigationItem.standardAppearance = appearance
        navigationItem.scrollEdgeAppearance = appearance
    }
    
    func configureView(){
      settingsView.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.15).cgColor
        settingsView.layer.shadowOpacity = 0.5
      settingsView.layer.shadowRadius = 7
        settingsView.layer.cornerRadius = 10
      helpView.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.20).cgColor
        helpView.layer.shadowOpacity = 0.5
      helpView.layer.shadowRadius = 7
        helpView.layer.cornerRadius = 10
      signoutView.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.20).cgColor
        signoutView.layer.shadowOpacity = 0.5
      signoutView.layer.shadowRadius = 7
        signoutView.layer.cornerRadius = 10
        // inside viewDidLoad

        // the color of the shadow
//        settingsView.layer.shadowColor = UIColor.darkGray.cgColor
//
//        // the shadow will be 5pt right and 5pt below the image view
//        // negative value will place it on left / above of the image view
//        settingsView.layer.shadowOffset = CGSize(width: 5.0, height: 5.0)
//
//        // how long the shadow will be. The longer the shadow, the more blurred it will be
//        settingsView.layer.shadowRadius = 10.0
//
//        // opacity of the shadow
//        settingsView.layer.shadowOpacity = 0.9
    }
}

