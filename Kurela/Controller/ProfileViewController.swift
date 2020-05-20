//
//  ProfileViewController.swift
//  Kurela
//
//  Created by Feby Lailani on 19/05/20.
//  Copyright © 2020 Group 16 MC2 2020. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    
    @IBOutlet weak var aboutButton: UIButton!
    @IBOutlet weak var aboutLabel: UILabel!
    @IBOutlet weak var medicalButton: UIButton!
    @IBOutlet weak var medicalLabel: UILabel!
    @IBOutlet weak var documentButton: UIButton!
    @IBOutlet weak var documentLabel: UILabel!
    @IBOutlet weak var emergencyButton: UIButton!
    @IBOutlet weak var emergencyLabel: UILabel!
    @IBOutlet weak var aboutView: UIView!
    @IBOutlet weak var MedicalView: UIView!
    @IBOutlet weak var documentView: UIView!
    @IBOutlet weak var emergencyView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    func prepareAboutView () {
        aboutView.isHidden = false
        MedicalView.isHidden = true
        documentView.isHidden = true
        emergencyView.isHidden = true
    }
    
    func prepareMedicalView () {
        aboutView.isHidden = true
        MedicalView.isHidden = false
        documentView.isHidden = true
        emergencyView.isHidden = true
    }
    
    func prepareDocumentView() {
        aboutView.isHidden = true
        MedicalView.isHidden = true
        documentView.isHidden = false
        emergencyView.isHidden = true
    }
    
    func prepareEmergencyView() {
        aboutView.isHidden = true
        MedicalView.isHidden = true
        documentView.isHidden = true
        emergencyView.isHidden = false
    }
    
//    func configureView() {
//        <#function body#>
//    }

    //    func configure(picture: UIImage, date: String, title: String, location: String, tags: UIImage, duedate: String, logos: UIImage){
    //        pictureView.image = picture
    //        dateLabel.text = date
    //        titleLabel.text = title
    //        locationLabel.text = location
    //        flagView.image = tags
    //        tagLabel.text = duedate
    //        logoView.image = logos
    //
    //        cardView.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
    //        cardView.layer.shadowOpacity = 1
    //        cardView.layer.shadowRadius = 10
    //        titleView.clipsToBounds = true
    //        titleView.layer.cornerRadius = 10
    //        titleView.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
    //
    //    }
    //
    
    @IBAction func aboutTapped(_ sender: Any) {
        prepareAboutView()
        
    }
    
    @IBAction func medicalTapped(_ sender: Any) {
        prepareMedicalView()
        
    }
    
    @IBAction func documentTapped(_ sender: UIButton) {
        prepareDocumentView()
    }
    
    @IBAction func emergencyTapped(_ sender: UIButton) {
        prepareEmergencyView()
    }
    
    
    
    // @IBAction func selectSegment(_ sender: UISegmentedControl) {
//        if sender.selectedSegmentIndex == 0 {
//            currentSegmentedIndex = .idol
//
//        } else {
//            currentSegmentedIndex = .cuisine
//
//        }
//
//        exploreCollectionView.reloadData()
//    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
  
    
    
}
