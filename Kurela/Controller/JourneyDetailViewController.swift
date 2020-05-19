//
//  JourneyDetailViewController.swift
//  Kurela
//
//  Created by M Habib Ali Akbar on 19/05/20.
//  Copyright © 2020 Group 16 MC2 2020. All rights reserved.
//

import UIKit
import CoreData

class JourneyDetailViewController: UIViewController {

    @IBOutlet weak var detailButton: UIButton!
    @IBOutlet weak var ilustrationImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var firstTabButton: UIButton!
    @IBOutlet weak var secondTabButton: UIButton!
    @IBOutlet weak var thirdTabButton: UIButton!
    @IBOutlet weak var fourthTabButton: UIButton!
    @IBOutlet weak var oneTwoView: UIView!
    @IBOutlet weak var twoThreeView: UIView!
    @IBOutlet weak var threeFourView: UIView!
    @IBOutlet weak var bottomDetailView: UIView!
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    var journeyDetail: UserJourney?
    var sendParameter: [VolunteeringInfo]?
    override func viewDidLoad() {
        super.viewDidLoad()

        customUi()
        // Do any additional setup after loading the view.
    }
    
    func customUi() {
        bottomDetailView.isHidden = true
        firstTabButton.layer.cornerRadius = firstTabButton.frame.height / 2
        secondTabButton.layer.cornerRadius = firstTabButton.frame.height / 2
        thirdTabButton.layer.cornerRadius = firstTabButton.frame.height / 2
        fourthTabButton.layer.cornerRadius = firstTabButton.frame.height / 2
        detailButton.layer.cornerRadius = 15
        
        titleLabel.text = journeyDetail?.infoDetail?.activityName
    }
    
    
    @IBAction func detailPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "journeyToDetail", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! ActivityViewController
        destinationVC.data = journeyDetail?.infoDetail
    
    }
    
    @IBAction func tabProgressPressed(_ sender: UIButton) {
        
        if sender.titleLabel?.text == "1" {
            firstTabButton.backgroundColor = UIColor(named: "AppSecondColor")
            secondTabButton.backgroundColor = UIColor(named: "AppColor")
//            secondTabButton.setTitleColor(.white, for: .normal)
            bottomDetailView.isHidden = true
        } else if sender.titleLabel?.text == "2" {
            firstTabButton.backgroundColor = UIColor(named: "AppColor")
            secondTabButton.backgroundColor = UIColor(named: "AppSecondColor")
            secondTabButton.setTitleColor(.white, for: .normal)
            bottomDetailView.isHidden = false
        }
    }
    
    
    
}
