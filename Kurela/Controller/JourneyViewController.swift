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
    
    let defaults = UserDefaults.standard
    
    var selectedIndex: Int?
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        if isOngoingOpened {
            loadData(predicate: NSPredicate(format: "status != 4"))
        } else {
            loadData(predicate: NSPredicate(format: "status = 4"))
        }
        UserDefaults.standard.set(0, forKey: "newJourneyBadgeCounter")
        tabBarController?.tabBar.items?[1].badgeValue = nil
        
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
        setupNavBar()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "JourneyCardCell", bundle: nil), forCellReuseIdentifier: "JourneyReusableCell")
        
    }
    
    func setupNavBar(){
        //large title for navbar
        navigationController?.navigationBar.prefersLargeTitles = true
        
        //navbar background color
        let appearance = UINavigationBarAppearance()
        appearance.configureWithTransparentBackground()
        appearance.backgroundColor = UIColor(red: 0, green: 0.711, blue: 0.867, alpha: 1)
        
        //change title color
        
        appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        
        navigationItem.standardAppearance = appearance
        navigationItem.scrollEdgeAppearance = appearance
        navigationItem.compactAppearance = appearance
        
        //create search bar
        let searchController = UISearchController(searchResultsController: nil)
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.delegate = self
        searchController.searchBar.placeholder = "Search for Activity"
        
        //change search bar color
        let searchBar = searchController.searchBar
        searchBar.tintColor = UIColor.white
        searchBar.barTintColor = UIColor.white
        searchBar.isTranslucent = false
        searchBar.isOpaque = true
        
        //change textfield for search bar color
        if let textfield = searchBar.value(forKey: "searchField") as? UITextField {
            textfield.textColor = UIColor.black
            textfield.backgroundColor = UIColor.white
            textfield.layer.cornerRadius = 10
            textfield.clipsToBounds = true
        }
        
        DispatchQueue.main.async { [weak self] in
            self?.navigationController?.navigationBar.sizeToFit()
        }
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
            if journeyArray.count != 0 {
                
                defaults.set(true, forKey: "IsNotFirstTime")
                if defaults.bool(forKey: "IsNotFirstTime") == true {
                    tabView.isHidden = false
                }
            }
        } catch {
            print("Error fatching from context, \(error)")
        }
        
        tableView.reloadData()
    }
    

}

extension JourneyViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        emptyView.isHidden = true
        if journeyArray.count == 0 {
            emptyView.isHidden = false
            
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
