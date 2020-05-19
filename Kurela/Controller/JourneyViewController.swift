//
//  JourneyViewController.swift
//  Kurela
//
//  Created by M Habib Ali Akbar on 14/05/20.
//  Copyright © 2020 Group 16 MC2 2020. All rights reserved.
//

import UIKit
import CoreData

class JourneyViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var emptyView: UIView!
    @IBOutlet weak var tabView: UIView!
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var journeyArray = [UserJourney]()
    
    var selectedIndex: Int?
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        tableView.delegate = self
        loadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let searchBar = UISearchController(searchResultsController: nil)
        navigationItem.searchController = searchBar
        
        tableView.dataSource = self
        tableView.register(UINib(nibName: "JourneyCardCell", bundle: nil), forCellReuseIdentifier: "JourneyReusableCell")

        
    }

    func loadData() {
        let request: NSFetchRequest<UserJourney> = UserJourney.fetchRequest()
        request.sortDescriptors = [NSSortDescriptor(key: "applyDate", ascending: true)]
        
        do {
            journeyArray = try context.fetch(request)
        } catch {
            print("Error fatching from context, \(error)")
        }
        
        tableView.reloadData()
    }

}

extension JourneyViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        emptyView.isHidden = true
        tabView.isHidden = false
        if journeyArray.count == 0 {
            emptyView.isHidden = false
            tabView.isHidden = true
        }
        return journeyArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "JourneyReusableCell", for: indexPath) as! JourneyCardCell
        
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE, d MMM yyyy"
        
        let formatter2 = DateFormatter()
        formatter2.dateFormat = "d MMM yyyy"
        
        cell.titleLabel.text = journeyArray[indexPath.row].infoDetail?.activityName
        cell.dateLabel.text = formatter.string(from: journeyArray[indexPath.row].infoDetail!.date!)
        cell.locationLabel.text = journeyArray[indexPath.row].infoDetail?.location
        if journeyArray[indexPath.row].status == 1 {
            cell.statusLabel.text = "Applied"
            cell.date2Label.text = "Applied on \(formatter2.string(from: journeyArray[indexPath.row].applyDate!))"
        }
        
        
        return cell
    }
    
}

extension JourneyViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        selectedIndex = indexPath.row
        performSegue(withIdentifier: "goToJourneyDetail", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! JourneyDetailViewController
        if let indexPath = selectedIndex {
            destinationVC.journeyDetail = journeyArray[indexPath]
        }
    }
}
