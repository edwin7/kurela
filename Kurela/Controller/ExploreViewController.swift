//
//  ExploreViewController.swift
//  Kurela
//
//  Created by M Habib Ali Akbar on 08/05/20.
//  Copyright © 2020 Group 16 MC2 2020. All rights reserved.
//

import UIKit
import CoreData

class ExploreViewController: UIViewController{
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var emptyLabel: UILabel!
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    var cards: [Card] = [
        Card(infoName: "Relawan Siaga Erupsi Gunung Merapi", location: "Yogyakarta"),
        Card(infoName: "Judul Berita 2", location: "Jakarta"),
        Card(infoName: "Judul Berita 3", location: "Jakarta")
    ]
    var selectedIndex: Int?
    var infoArray = [VolunteeringInfo]()
    
    var images = ["a", "b", "c"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let searchController = UISearchController(searchResultsController: nil)
//        searchController.searchResultsUpdater = self
        searchController.searchBar.delegate = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Activity"
        navigationItem.searchController = searchController
        definesPresentationContext = true
        navigationItem.hidesSearchBarWhenScrolling = false
        emptyLabel.isHidden = true
        
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.register(UINib(nibName: "ExploreCardCell", bundle: nil), forCellReuseIdentifier: "ExploreReusableCell")
        
        saveFirstData()
        loadData()
        
        
    }
    
    
    func loadData(predicate: NSPredicate? = nil) {
        let request: NSFetchRequest<VolunteeringInfo> = VolunteeringInfo.fetchRequest()
        request.sortDescriptors = [NSSortDescriptor(key: "daysLeft", ascending: true)]
        
        if let additonalPredicate = predicate {
            request.predicate = additonalPredicate
        }
        do {
            infoArray = try context.fetch(request)
            
        } catch {
            print("Error fetching VolunterringInfo, \(error)")
        }
        
        tableView.reloadData()
    }
    
    func saveData() {
        do {
            try context.save()
        } catch {
            print("Error saving context, \(error)")
        }
        
        tableView.reloadData()
    }
    
    //MARK: - Persiapan data awal ke Core Data
    
    func saveFirstData() {
        
        let request: NSFetchRequest<VolunteeringInfo> = VolunteeringInfo.fetchRequest()
        do {
            let data = try context.fetch(request)
            if data.count == 0{
                print("data sedang disimpan ke core data")
                
                let formatter = DateFormatter()
                formatter.dateFormat = "yyyy/MM/dd"
                
                let dataArray = [
                    DataPreparation(activityImage: #imageLiteral(resourceName: "a"), activityName: "Gempa Lombok", category: "Bencana", contact: "123456789012", date: formatter.date(from: "2020/6/08")!, daysLeft: 10, descriptions: "Ini contoh dekripsinya", location: "Lombok, NTB", organizationImage: #imageLiteral(resourceName: "c"), organizationName: "Peduli", peopleApplied: 100, requirement: "Contoh requirement"),
                    DataPreparation(activityImage: #imageLiteral(resourceName: "c"), activityName: "Relawan Siaga Erupsi Gunung Merapi", category: "Budaya", contact: "123456789012", date: formatter.date(from: "2020/7/20")!, daysLeft: 4, descriptions: "Ini contoh dekripsinya", location: "Sumbawa, NTB", organizationImage: #imageLiteral(resourceName: "b"), organizationName: "Peduli", peopleApplied: 100, requirement: "Contoh requirement"),
                    DataPreparation(activityImage: #imageLiteral(resourceName: "b"), activityName: "Berita 3", category: "Budaya", contact: "123456789012", date: formatter.date(from: "2020/6/03")!, daysLeft: 5, descriptions: "Ini contoh dekripsinya", location: "Jakarta", organizationImage: #imageLiteral(resourceName: "c"), organizationName: "Peduli", peopleApplied: 100, requirement: "Contoh requirement")
                ]
                
                
                for index in 0..<dataArray.count {
                    let newInfoData = VolunteeringInfo(context: self.context)
                    newInfoData.activityImage = dataArray[index].activityImage.pngData()
                    newInfoData.activityName = dataArray[index].activityName
                    newInfoData.category = dataArray[index].category
                    newInfoData.contact = dataArray[index].contact
                    newInfoData.date = dataArray[index].date
                    newInfoData.daysLeft = Int16(dataArray[index].daysLeft)
                    newInfoData.descriptions = dataArray[index].descriptions
                    newInfoData.location = dataArray[index].location
                    newInfoData.organizationImage = dataArray[index].organizationImage.pngData()
                    newInfoData.organizationName = dataArray[index].organizationName
                    newInfoData.peopleApplied = Int32(dataArray[index].peopleApplied)
                    newInfoData.requirement = dataArray[index].requirement
                    
                    saveData()
                }
            }
        } catch {
            print("Error fetching data from contex, \(error)")
        }
        
    }
    
}

//MARK: - Table View Delegate
extension ExploreViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        emptyLabel.isHidden = true
        if infoArray.count == 0 {
            emptyLabel.isHidden = false
            print("showwwww")
        }
        return infoArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ExploreReusableCell", for: indexPath) as! ExploreCardCell
        
        cell.imageCardView.image = UIImage(data: infoArray[indexPath.row].activityImage!)
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE, d MMM yyyy"
        cell.dateLabel.text = formatter.string(from: infoArray[indexPath.row].date!)
        cell.infoNameLabel.text = infoArray[indexPath.row].activityName
        cell.locationLabel.text = infoArray[indexPath.row].location
        cell.organizationImageView.image = UIImage(data: infoArray[indexPath.row].organizationImage!)
        cell.daysLeftLabel.text = "\(infoArray[indexPath.row].daysLeft) days left"
    
        return cell
    }
    
}

extension ExploreViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        selectedIndex = indexPath.row
        performSegue(withIdentifier: "goToDetail", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! DetailViewController
        if let indexPath = selectedIndex {
            destinationVC.data = infoArray[indexPath]
        }
        
    }
    
}




extension ExploreViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        let predicate = NSPredicate(format: "activityName CONTAINS[cd] %@", searchBar.text!)
        loadData(predicate: predicate)
        
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        loadData()
    }
}

//extension ExploreViewController: UISearchResultsUpdating {
//    func updateSearchResults(for searchController: UISearchController) {
//        var isSearchBarEmpty: Bool {
//          return searchController.searchBar.text?.isEmpty ?? true
//        }
//
//        print(searchController.searchBar.text!)
//        let predicate = NSPredicate(format: "activityName CONTAINS[cd] %@", searchController.searchBar.text!)
//        loadData(predicate: predicate)
//
//        if isSearchBarEmpty {
//            loadData()
//        }
//
//
//    }
//
//
//}
