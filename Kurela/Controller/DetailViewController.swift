//
//  DetailViewController.swift
//  Kurela
//
//  Created by M Habib Ali Akbar on 16/05/20.
//  Copyright © 2020 Group 16 MC2 2020. All rights reserved.
//

import UIKit
import CoreData

class DetailViewController: UIViewController {


    @IBOutlet weak var applyButton: UIButton!
    @IBOutlet weak var organizationImage: UIImageView!
    @IBOutlet weak var activityNameLabel: UILabel!
    @IBOutlet weak var activityImage: UIImageView!
    
    var data: VolunteeringInfo?
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.largeTitleDisplayMode = .never
        
        organizationImage.layer.cornerRadius = organizationImage.frame.height / 2.0
        
        setApplyButton()
        setData()
    }
    
    func setApplyButton() {
        var tmp = [UserJourney]()
        applyButton.layer.cornerRadius = 15
        let request: NSFetchRequest<UserJourney> = UserJourney.fetchRequest()
        let predicate = NSPredicate(format: "infoDetail.activityName MATCHES %@", data!.activityName!)
        request.predicate = predicate
        do {
            tmp = try context.fetch(request)
            if tmp.count != 0 {
                applyButton.isEnabled = false
                applyButton.setTitle("Applied", for: .normal)
                applyButton.backgroundColor = .gray
            }
        } catch {
            print("Error fetching UserJourney, \(error)")
        }
        
    }
    
    func setData() {
        activityImage.image = UIImage(data: (data?.activityImage!)!)
        organizationImage.image = UIImage(data: (data?.organizationImage!)!)
        activityNameLabel.text = data?.activityName

    }
    
    @IBAction func applayButtonPressed(_ sender: UIButton) {
        let newJourney = UserJourney(context: self.context)
        newJourney.infoDetail = data
        newJourney.status = 1
        newJourney.applyDate = Date()
        saveData()
        applyButton.isEnabled = false
        applyButton.backgroundColor = .gray
        applyButton.setTitle("Applied", for: .normal)
        
        let alert = UIAlertController(title: "Added to your Journey", message: "Open the Journey page to see your status", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
//        alert.addAction(UIAlertAction(title: "Go to Journey", style: .default, handler: { (alert) in
//            tabBarController.selectedIndex = indexToWhichYouWantToMove;
//        }))

        self.present(alert, animated: true)
    }
    
    func saveData() {
        do {
            try context.save()
        } catch {
            print("Error saving data from context, \(error)")
        }
    }
}

extension DetailViewController: UIScrollViewDelegate {
    
}

