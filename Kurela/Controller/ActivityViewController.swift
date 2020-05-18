//
//  ActivityViewController.swift
//  Kurela
//
//  Created by Edwin Sendjaja on 5/16/20.
//  Copyright © 2020 Group 16 MC2 2020. All rights reserved.
//

import UIKit

class ActivityViewController: UIViewController {

    @IBOutlet weak var activityTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        activityTableView.delegate = self
        activityTableView.dataSource = self
        
        //navbar background color
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        //appearance.configureWithTransparentBackground()

        navigationItem.standardAppearance = appearance
        navigationItem.compactAppearance = appearance

        navigationItem.leftBarButtonItem?.tintColor = .green
        navigationItem.leftBarButtonItem?.setBackButtonBackgroundImage(#imageLiteral(resourceName: "logo2"), for: .normal, barMetrics: .default)

        //1. NAVIGATION BAR - BAR ITEM - RIGHT BUTTON
        //1.1 create button
        let rightButton : UIButton = UIButton(type: UIButton.ButtonType.custom)
        //rightButton.setBackgroundImage(#imageLiteral(resourceName: "iconactive1"), for: .normal)
        rightButton.setTitle("Apply", for: .normal)
        rightButton.frame.size = CGSize(width: 100, height: 30)
        rightButton.backgroundColor = UIColor(red: 0, green: 0.711, blue: 0.867, alpha: 1)
        //!!!! START - NOT WORKING !!!!!///
        rightButton.tintColor = UIColor(red: 0, green: 0.711, blue: 0.867, alpha: 1) //not working!!
        //!!!! END - NOT WORKING !!!!!///

        //1.1.1 create BarButtonItem and Set it as right bar button item for Navigation item
        let customRightBarButtonItem = UIBarButtonItem(customView: rightButton)
        navigationItem.rightBarButtonItem = customRightBarButtonItem
        
        //or only image
        
        //1.2 NAVIGATION BAR - BAR ITEM - RIGHT BUTTON - Create
        //1.2.1 create BarButtonItem and Set it as right bar button item for Navigation item
        //navigationItem.rightBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "highlight").withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(handleDismiss))
        
        //1.3 custom right bar button item in on nav bar
        //!!!! START - NOT WORKING !!!!!///
        navigationItem.rightBarButtonItem?.tintColor = .yellow
        navigationItem.rightBarButtonItem?.title = "testawefaewfawefwef"
        //!!!! END - NOT WORKING !!!!!///

        // Provide an empty backBarButton to hide the 'Back' text present by default in the back button.
        
        //!!!! START - NOT WORKING !!!!!///
        let backBarButtton = UIBarButtonItem(title: "ccccc", style: .plain, target: nil, action: nil)
        navigationItem.backBarButtonItem = backBarButtton
        navigationItem.backBarButtonItem?.tintColor = .yellow
        //!!!! END - NOT WORKING !!!!!///
        
        // Customize based on appearance type.
        let buttonAppearance = UIBarButtonItemAppearance()
        buttonAppearance.normal.titleTextAttributes = [.foregroundColor: UIColor.orange]
        navigationItem.standardAppearance?.buttonAppearance = buttonAppearance
        
        let compactAppearance = UIBarButtonItemAppearance()
        compactAppearance.normal.titleTextAttributes = [.foregroundColor: UIColor.brown]
        navigationItem.compactAppearance?.buttonAppearance = compactAppearance
        
        let scollEdgebuttonAppearance = UIBarButtonItemAppearance()
        scollEdgebuttonAppearance.normal.titleTextAttributes = [.foregroundColor: UIColor.blue]
        navigationItem.scrollEdgeAppearance?.buttonAppearance = scollEdgebuttonAppearance
        
        let doneButtonAppearance = UIBarButtonItemAppearance()
        doneButtonAppearance.normal.titleTextAttributes = [.foregroundColor: UIColor.magenta]
        navigationItem.standardAppearance?.doneButtonAppearance = doneButtonAppearance
        navigationItem.compactAppearance?.doneButtonAppearance = doneButtonAppearance
        navigationItem.scrollEdgeAppearance?.buttonAppearance = doneButtonAppearance

    }
    
    @objc func handleDismiss() {
        
    }
}

extension ActivityViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
                
        let cell = activityTableView.dequeueReusableCell(withIdentifier: "activityCell", for: indexPath) as! ActivityHeaderTableViewCell
        
        cell.informationTextLabel.text = "Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda. Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda. Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda. Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda. Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda. Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda. Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda. Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda."
                
        return cell

    }
    
    
}
