//
//  ExploreViewController.swift
//  Kurela
//
//  Created by M Habib Ali Akbar on 08/05/20.
//  Copyright © 2020 Group 16 MC2 2020. All rights reserved.
//

import UIKit

class ExploreViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var cards: [Card] = [
        Card(infoName: "Judul Berita 1", location: "Jakarta"),
        Card(infoName: "Judul Berita 2", location: "Jakarta"),
        Card(infoName: "Judul Berita 3", location: "Jakarta")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let searchController = UISearchController(searchResultsController: nil)
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false

        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.register(UINib(nibName: "CardCell", bundle: nil), forCellReuseIdentifier: "ReusableCell")
    }
    
}

extension ExploreViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        print("3")
    }
}

extension ExploreViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ReusableCell", for: indexPath) as! CardCell
        
        cell.infoLabel.text = cards[indexPath.row].infoName
        return cell
    }
    
    
    
}
