//
//  ExploreViewController.swift
//  Kurela
//
//  Created by M Habib Ali Akbar on 08/05/20.
//  Copyright © 2020 Group 16 MC2 2020. All rights reserved.
//

import UIKit
import CoreData


class ExploreViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var categoryCollectionView: UICollectionView!
    @IBOutlet weak var cardTableView: UITableView!
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    var infoArray = [VolunteeringInfo]()
    
    var selectedIndex: Int?
    //    content in card table view
    //    let pictures: [UIImage] = [UIImage(named: "card1.png")!, UIImage(named: "card2.png")!, UIImage(named: "card3.png")!, UIImage(named: "card4.png")!, UIImage(named: "card5.png")!, UIImage(named: "card6.png")!,]
    //    let titles: [String] = ["Relawan Siaga Erupsi Gunung Merapi", "Kado untuk Anak Jalanan Sekitar Kita", "Berbagi Sembako untuk Driver Online", "Donor Darah untuk Pasien COVID-19", "Sosialisasi Huruf Braille untuk Teman Netra", "Donasi Masker dan Gloves COVID-19"]
    //    let date: [String] = ["20 Mei 2020", "30 Mei 2020", "15 Mei 2020", "15 Mei 2020", "1 Juni 2020", "30 Juni 2020"]
    //    let location: [String] = ["DIY Yogyakarta", "DKI Jakarta", "Tangerang Selatan", "Jakarta Pusat", "Sumatera Selatan", "Bali"]
    //    let tag: [UIImage] = [UIImage(named: "tag.png")!,UIImage(named: "tag.png")!,UIImage(named: "tag.png")!,UIImage(named: "tag.png")!,UIImage(named: "tag.png")!,UIImage(named: "tag.png")!,]
    //    let due: [String] = ["3 days left", "5 days left", "10 Mei 2020", "8 Mei 2020", "20 Mei 2020", "1 Juni 2020"]
    //    let logo: [UIImage] = [UIImage(named: "logo1.png")!,UIImage(named: "logo2.png")!,UIImage(named: "logo3.png")!,UIImage(named: "logo4.png")!,UIImage(named: "logo5.png")!,UIImage(named: "logo6.png")!,]
    //
    //content in category collection view
    let icon: [UIImage] = [UIImage(named: "category1inactive.png")!,UIImage(named: "category2.png")!,UIImage(named: "category3.png")!,UIImage(named: "category6.png")!,UIImage(named: "category7.png")!,UIImage(named: "category4.png")!,UIImage(named: "category5.png")!,UIImage(named: "category8.png")!]
    let category: [String] = ["Highlight", "COVID-19", "Children", "Disaster", "Donation", "Education", "Disability", "On-Site"]
    let selectedicon: [UIImage] = [UIImage(named: "category1.png")!,UIImage(named: "category2active.png")!,UIImage(named: "category3active.png")!,UIImage(named: "category6active.png")!,UIImage(named: "category7active.png")!,UIImage(named: "category4active.png")!,UIImage(named: "category5active.png")!,UIImage(named: "category8active.png")!]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavBar()
        view.backgroundColor = .white
        setupNavBar()
        //saveFirstData()
        
        DataPreparation.saveFirstData()
        
        loadData()
        
        //collection view
        categoryCollectionView.register(UINib(nibName: "CategoryCell", bundle: nil), forCellWithReuseIdentifier: "myCell")
        categoryCollectionView.delegate = self
        categoryCollectionView.allowsMultipleSelection = false
        categoryCollectionView.dataSource = self
        let selectedIndexPath = IndexPath(item: 0, section: 0)
          categoryCollectionView.selectItem(at: selectedIndexPath, animated: false, scrollPosition: .left)
        
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
    
    // How many rows in the table view
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return infoArray.count
    }
    
    //Defines what cells are being used
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "exploreCardCell", for: indexPath) as! ExploreCardCell
        
        //        cell.configure(picture: pictures[indexPath.row], date: date[indexPath.row], title: titles[indexPath.row], location: location[indexPath.row], tags: tag[indexPath.row], duedate: due[indexPath.row], logos: logo[indexPath.row])
        
        cell.pictureView.image = UIImage(data: infoArray[indexPath.row].activityImage!)
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE, d MMM yyyy"
        cell.dateLabel.text = formatter.string(from: infoArray[indexPath.row].date!)
        cell.titleLabel.text = infoArray[indexPath.row].activityName
        cell.locationLabel.text = infoArray[indexPath.row].location
        cell.tagLabel.text = "\(infoArray[indexPath.row].daysLeft) days left"
        cell.logoView.image = UIImage(data: infoArray[indexPath.row].organizationImage!)

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        selectedIndex = indexPath.row
        performSegue(withIdentifier: "goToDetail", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! ActivityViewController
        if let indexPath = selectedIndex {
            destinationVC.data = infoArray[indexPath]
        }
        
    }
    
    //How many items in collection view
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 8
    }
    
    //Defines the content of the collection view
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
     let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "myCell", for: indexPath) as! CategoryCell
        cell.categoryDeselect(icons: icon[indexPath.row], categoryname: category[indexPath.row])
        if (indexPath.row == 0) {
            cell.categorySelected(selected: selectedicon[indexPath.row], categoryname: category[indexPath.row])
        }
        return cell
    }
    
    //Select collection view cell
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as? CategoryCell
            cell?.categorySelected(selected: selectedicon[indexPath.row], categoryname: category[indexPath.row])
        if indexPath.row != 0 {
            let predicate = NSPredicate(format: "category = %@", category[indexPath.row])
            loadData(predicate: predicate)
        } else {
            loadData()
        }
    }
    
    //Deselect collection view cell
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as? CategoryCell
        cell?.categoryDeselect(icons: icon[indexPath.row], categoryname: category[indexPath.row])
    }
    

    //MARK: - Core Data
    
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
        
        cardTableView.reloadData()
    }
    
    
    //MARK: - Search
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        let predicate = NSPredicate(format: "activityName CONTAINS[cd] %@", searchBar.text!)
        loadData(predicate: predicate)
        
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        loadData()
    }
    
}


