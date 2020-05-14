//
//  ExploreViewController.swift
//  Kurela
//
//  Created by M Habib Ali Akbar on 08/05/20.
//  Copyright © 2020 Group 16 MC2 2020. All rights reserved.
//

import UIKit


class  ExploreViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchControllerDelegate {
    
    @IBOutlet weak var cardTableView: UITableView!
    
    let pictures: [UIImage] = [UIImage(named: "card1.png")!, UIImage(named: "card2.png")!, UIImage(named: "card3.png")!, UIImage(named: "card4.png")!]
    let titles: [String] = ["Relawan Siaga Erupsi Gunung Merapi", "Kado untuk Anak Jalanan di Sekitar Kita", "Berbagi Sembako untuk Driver Online", "Donor Darah untuk Pasien COVID-19" ]
    let date: [String] = ["20 Mei 2020", "30 Mei 2020", "15 Mei 2020", "15 Mei 2020" ]
    let location: [String] = ["DIY Yogyakarta", "DKI Jakarta", "Tangerang Selatan", "Jakarta Pusat"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupNavBar()
        navigationController?.navigationBar.barStyle = .black
        
    }
 
    
    func setupNavBar(){
        navigationController?.navigationBar.prefersLargeTitles = true

        
        //navbar background color
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor(red: 0, green: 0.711, blue: 0.867, alpha: 1)
        navigationItem.standardAppearance = appearance
        navigationItem.scrollEdgeAppearance = appearance
        navigationItem.compactAppearance = appearance
        appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]

        
        //create search bar
        let searchController = UISearchController(searchResultsController: nil)
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        searchController.delegate = self
        
        
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
    
    // How many rows in the table view
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pictures.count
    }
    
    //Defines what cells are being used
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "exploreCardCell", for: indexPath) as! ExploreCardCell
        
        cell.configure(picture: pictures[indexPath.row], date: date[indexPath.row], title: titles[indexPath.row], location: location[indexPath.row])
        
        
        return cell
}



    

}
