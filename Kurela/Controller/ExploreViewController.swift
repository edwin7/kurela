//
//  ExploreViewController.swift
//  Kurela
//
//  Created by M Habib Ali Akbar on 08/05/20.
//  Copyright © 2020 Group 16 MC2 2020. All rights reserved.
//

import UIKit


class ExploreViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchControllerDelegate, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
   
    @IBOutlet weak var categoryCollectionView: UICollectionView!
    @IBOutlet weak var cardTableView: UITableView!
    
    //content in card table view
    let pictures: [UIImage] = [UIImage(named: "card1.png")!, UIImage(named: "card2.png")!, UIImage(named: "card3.png")!, UIImage(named: "card4.png")!]
    let titles: [String] = ["Relawan Siaga Erupsi Gunung Merapi", "Kado untuk Anak Jalanan Sekitar Kita", "Berbagi Sembako untuk Driver Online", "Donor Darah untuk Pasien COVID-19" ]
    let date: [String] = ["20 Mei 2020", "30 Mei 2020", "15 Mei 2020", "15 Mei 2020" ]
    let location: [String] = ["DIY Yogyakarta", "DKI Jakarta", "Tangerang Selatan", "Jakarta Pusat"]
    let tag: [UIImage] = [UIImage(named: "tag.png")!,UIImage(named: "tag.png")!,UIImage(named: "tag.png")!,UIImage(named: "tag.png")!,]
    let due: [String] = ["3 days left", "5 days left", "10 Mei 2020", "8 Mei 2020"]
    let logo: [UIImage] = [UIImage(named: "logo1.png")!,UIImage(named: "logo2.png")!,UIImage(named: "logo2.png")!,UIImage(named: "logo3.png")!,]
    
    //content in category collection view
    let icon: [UIImage] = [UIImage(named: "highlight.png")!,UIImage(named: "covid19.png")!,UIImage(named: "education.png")!,UIImage(named: "disability.png")!,UIImage(named: "children.png")!,]
    let category: [String] = ["Highlight", "COVID-19", "Education", "Disability", "Children"]

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        setupNavBar()
       //navigationController?.navigationBar.barStyle = .black
       // navigationController?.navigationBar.isTranslucent = false
        navigationItem.largeTitleDisplayMode = .always
        

    }
 
    
    func setupNavBar(){
        //large title for navbar
        navigationController?.navigationBar.prefersLargeTitles = true
        
        //navbar background color
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor(red: 0, green: 0.711, blue: 0.867, alpha: 1)

        appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        navigationItem.standardAppearance = appearance
        navigationItem.scrollEdgeAppearance = appearance
        navigationItem.compactAppearance = appearance
      
        //create search bar
        let searchController = UISearchController(searchResultsController: nil)
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        searchController.delegate = self

        //change search bar color
        let searchBar = searchController.searchBar
        searchBar.tintColor = UIColor.white
        searchBar.barTintColor = UIColor.white
        searchBar.isTranslucent = false
        searchBar.isOpaque = true

        if let textfield = searchBar.value(forKey: "searchField") as? UITextField {
            textfield.textColor = UIColor.black
            textfield.backgroundColor = UIColor.white
            textfield.layer.cornerRadius = 10
            textfield.clipsToBounds = true
        }
       
    }
    
    //Show header table view
//    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        let headerView = UICollectionView()
//        let headerCell = tableView.dequeueReusableCell(withIdentifier: "categoryCell") as! CategoryCell
//        headerView.addSubview(headerCell)
//        return headerView
//    }
//
    
    // How many rows in the table view
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pictures.count
    }
    
    //Defines what cells are being used
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "exploreCardCell", for: indexPath) as! ExploreCardCell
        
        cell.configure(picture: pictures[indexPath.row], date: date[indexPath.row], title: titles[indexPath.row], location: location[indexPath.row], tags: tag[indexPath.row], duedate: due[indexPath.row], logos: logo[indexPath.row])
        
        return cell
}

    //How many items in collection view
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
           return 5
       }
       
    //Defines the content of the collection view
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
           let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "categoriesCell", for: indexPath) as! CategoryCell
        
            cell.categorySet(icons: icon[indexPath.row], categoryname: category[indexPath.row])
           return cell
       }
}
