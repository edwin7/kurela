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
    @IBOutlet weak var ongoingTabButton: UIButton!
    @IBOutlet weak var historyTabButton: UIButton!
    @IBOutlet weak var ongoingLabel: UILabel!
    @IBOutlet weak var historyLabel: UILabel!
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var journeyArray = [UserJourney]()
    var isOngoingOpened = true
    
    var selectedIndex: Int?
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        if isOngoingOpened {
            loadData(predicate: NSPredicate(format: "status != 4"))
        } else {
            loadData(predicate: NSPredicate(format: "status = 4"))
        }
        
    }
    @IBAction func ongoingPressed(_ sender: UIButton) {
        isOngoingOpened = true
        ongoingTabButton.setImage(#imageLiteral(resourceName: "ongoingactive"), for: .normal)
        historyTabButton.setImage(#imageLiteral(resourceName: "historyinactive"), for: .normal)
        ongoingLabel.textColor = UIColor(named: "AppColor")
        historyLabel.textColor = .black
        
        let predicate = NSPredicate(format: "status != 4")
        loadData(predicate: predicate)
        
    }
    @IBAction func historyPressed(_ sender: UIButton) {
        isOngoingOpened = false
        ongoingTabButton.setImage(#imageLiteral(resourceName: "ongoinginactive"), for: .normal)
        historyTabButton.setImage(#imageLiteral(resourceName: "historyactive"), for: .normal)
        ongoingLabel.textColor = .black
        historyLabel.textColor = UIColor(named: "AppColor")
        
        let predicate = NSPredicate(format: "status = 4")
        loadData(predicate: predicate)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let searchBar = UISearchController(searchResultsController: nil)
        navigationItem.searchController = searchBar
        searchBar.searchBar.delegate = self
        searchBar.obscuresBackgroundDuringPresentation = false
        searchBar.searchBar.placeholder = "Activity"
        definesPresentationContext = true
        navigationItem.hidesSearchBarWhenScrolling = false

        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "JourneyCardCell", bundle: nil), forCellReuseIdentifier: "JourneyReusableCell")
        
        
    }

    func loadData(predicate: NSPredicate, searchPredicate: NSPredicate? = nil) {
        let request: NSFetchRequest<UserJourney> = UserJourney.fetchRequest()
        request.sortDescriptors = [NSSortDescriptor(key: "applyDate", ascending: false)]
        
        if let additionalPredicate = searchPredicate {
            request.predicate = NSCompoundPredicate(andPredicateWithSubpredicates: [predicate, additionalPredicate])
        } else {
            request.predicate = predicate
        }
        
        
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
//        tabView.isHidden = false
        if journeyArray.count == 0 {
            emptyView.isHidden = false
//            tabView.isHidden = true
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
        cell.tagsImage.image = #imageLiteral(resourceName: "tags")
        cell.date2Label.textColor = UIColor(named: "AppColor")
        switch journeyArray[indexPath.row].status {
        case 1:
            cell.statusLabel.text = "Applied"
            cell.date2Label.text = "Applied on \(formatter2.string(from: journeyArray[indexPath.row].applyDate!))"
        case 2:
            cell.statusLabel.text = "Interview"
            cell.date2Label.text = "Interview on \(formatter2.string(from: journeyArray[indexPath.row].interviewDate!))"
        case 3:
            cell.statusLabel.text = "In Review"
            cell.date2Label.text = "In Review until \(formatter2.string(from: journeyArray[indexPath.row].inreviewDate!))"
        case 4:
            if journeyArray[indexPath.row].rejectedStatus > 0 {
                cell.statusLabel.text = "Rejected"
                cell.tagsImage.image = #imageLiteral(resourceName: "redtag")
                cell.date2Label.text = "Rejected on \(formatter2.string(from: journeyArray[indexPath.row].resultDate!))"
                cell.date2Label.textColor = UIColor(named: "AppRejectedColor")
            } else {
                cell.statusLabel.text = "Accepted"
                cell.tagsImage.image = #imageLiteral(resourceName: "greentag")
                cell.date2Label.text = "Accepted on \(formatter2.string(from: journeyArray[indexPath.row].resultDate!))"
                cell.date2Label.textColor = UIColor(named: "AppAcceptedColor")
            }
            
            
        default:
            print("next update")
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

extension JourneyViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        var predicate = NSPredicate()
        let serchPredicate = NSPredicate(format: "infoDetail.activityName CONTAINS[cd] %@", searchBar.text!)
        if isOngoingOpened {
            predicate = NSPredicate(format: "status != 4")
        } else {
            predicate = NSPredicate(format: "status = 4")
        }
        loadData(predicate: predicate, searchPredicate: serchPredicate)
        
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        if isOngoingOpened {
            loadData(predicate: NSPredicate(format: "status != 4"))
        } else {
            loadData(predicate: NSPredicate(format: "status = 4"))
        }
        
    }
}
