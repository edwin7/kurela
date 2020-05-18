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
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var journeyArray = [UserJourney]()
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
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
        return journeyArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "JourneyReusableCell", for: indexPath) as! JourneyCardCell
        
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE, d MMM yyyy"
        
        let formatter2 = DateFormatter()
        formatter2.dateFormat = "d MMM yyyy"
        
        cell.titleLabel.text = journeyArray[indexPath.row].title
        cell.dateLabel.text = formatter.string(from: journeyArray[indexPath.row].date!)
        cell.locationLabel.text = journeyArray[indexPath.row].location
        if journeyArray[indexPath.row].status == 1 {
            cell.statusLabel.text = "Applied"
            cell.date2Label.text = "Applied on \(formatter2.string(from: journeyArray[indexPath.row].applyDate!))"
        }
        
        
        return cell
    }
    
    
}
