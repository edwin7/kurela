//
//  ActivityViewController.swift
//  Kurela
//
//  Created by Edwin Sendjaja on 5/16/20.
//  Copyright © 2020 Group 16 MC2 2020. All rights reserved.
//

import UIKit
import AVKit


class ActivityViewController: UIViewController {

    @IBOutlet weak var activityTableView: UITableView!
    
    var activityTitle: String = ""
    var information_text: String = ""

    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var organizationImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        activityTableView.delegate = self
        activityTableView.dataSource = self
        
        backButton.layer.cornerRadius = 13
        backButton.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMaxXMaxYCorner]
    }
    
    @IBAction func backButtonPressed(_ sender: Any) {
        self.navigationController?.popViewController(animated:true)
    }

    @IBAction func playVideoButton(_ sender: UIButton) {
        playVideo()
    }
}


extension ActivityViewController: UITableViewDelegate, UITableViewDataSource {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {

        let maximumVerticalOffset = CGFloat(120)
        let currentVerticalOffset = scrollView.contentOffset.y
        let percentageVerticalOffset = currentVerticalOffset / maximumVerticalOffset

        let color = UIColor.init(red: 255/255.0, green: 255/255.0, blue: 255/255.0, alpha: percentageVerticalOffset)
        navigationController?.navigationBar.backgroundColor = color
        
        if (percentageVerticalOffset < 1){
            configureNavBarABeforeScroll()
        }
        else {
            configureNavBarAfterScroll()
        }
    }
    
    func configureNavBarAfterScroll() {
                
        self.title = activityTitle
        let tlabel = UILabel(frame: CGRect(x: 0, y: 0, width: 10, height: 40))
        tlabel.text = self.title
        tlabel.textColor = UIColor.black
        tlabel.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        tlabel.backgroundColor = UIColor.clear
        tlabel.adjustsFontSizeToFitWidth = true
        tlabel.textAlignment = .center
        self.navigationItem.titleView = tlabel
        
        let barButtonItemApperance = UIBarButtonItemAppearance()
        barButtonItemApperance.normal.titleTextAttributes = [.foregroundColor: UIColor(red: 0, green: 0.711, blue: 0.867, alpha: 1)]

        //Configure Standard & Compact Nav Bar
        let newStandardAppearance = UINavigationBarAppearance()
        newStandardAppearance.configureWithOpaqueBackground()

        newStandardAppearance.titleTextAttributes = [.foregroundColor: UIColor.black]
        newStandardAppearance.buttonAppearance = barButtonItemApperance
        
        navigationItem.standardAppearance = newStandardAppearance
        navigationItem.compactAppearance = newStandardAppearance
        navigationItem.scrollEdgeAppearance = newStandardAppearance

        self.navigationController?.navigationBar.tintColor = UIColor(red: 0, green: 0.711, blue: 0.867, alpha: 1)

        configureRightButton()
    }
    
    func configureNavBarABeforeScroll() {
        navigationItem.rightBarButtonItem = nil
        self.title = ""
        self.navigationItem.titleView = nil
        self.navigationController?.navigationBar.tintColor = UIColor.white
        navigationItem.hidesBackButton = true

        
        // bar button styling
        let barButtonItemApperance = UIBarButtonItemAppearance()
        barButtonItemApperance.normal.titleTextAttributes = [.foregroundColor: UIColor.white]

        //Configure Standard & Compact Nav Bar
        let newStandardAppearance = UINavigationBarAppearance()
        newStandardAppearance.configureWithTransparentBackground()

        newStandardAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        newStandardAppearance.buttonAppearance = barButtonItemApperance

        navigationItem.standardAppearance = newStandardAppearance
        navigationItem.compactAppearance = newStandardAppearance
        navigationItem.scrollEdgeAppearance = newStandardAppearance
        
    }
        
    func configureRightButton() {
        
        navigationItem.hidesBackButton = false

        let rightButton : UIButton = UIButton(type: UIButton.ButtonType.custom)
        rightButton.setTitle("Apply", for: .normal)
        rightButton.titleLabel!.font = .systemFont(ofSize: 14)
        rightButton.frame.size = CGSize(width: 80, height: 30)
        rightButton.backgroundColor = UIColor(red: 0, green: 0.711, blue: 0.867, alpha: 1)
        rightButton.layer.cornerRadius = 15

        let customRightBarButtonItem = UIBarButtonItem(customView: rightButton)
        navigationItem.rightBarButtonItem = customRightBarButtonItem
    }
    
 
    @objc func back(sender: UIBarButtonItem) {
              self.navigationController?.popViewController(animated:true)
          
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
                
        let cell = activityTableView.dequeueReusableCell(withIdentifier: "activityCell", for: indexPath) as! ActivityHeaderTableViewCell
        
        activityTitle = "Berbagi "

        information_text = "Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda. Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda. Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda. Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda. Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda. Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda. Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda. Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda."
        cell.informationTextLabel.text = information_text
                
        return cell

    }
    
    func playVideo() {
        
        guard let url = URL(string: "https://assets.mixkit.co/videos/preview/mixkit-daytime-city-traffic-aerial-view-56-large.mp4") else {
            return
        }
        // Create an AVPlayer, passing it the HTTP Live Streaming URL.
        let player = AVPlayer(url: url)

        // Create a new AVPlayerViewController and pass it a reference to the player.
        let controller = AVPlayerViewController()
        controller.player = player

        // Modally present the player and call the player's play() method when complete.
        present(controller, animated: true) {
            player.play()
        }
        
        
    }
    
    
}
