//
//  JourneyViewController.swift
//  Kurela
//
//  Created by M Habib Ali Akbar on 14/05/20.
//  Copyright © 2020 Group 16 MC2 2020. All rights reserved.
//

import UIKit

class JourneyViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let searchBar = UISearchController(searchResultsController: nil)
        navigationItem.searchController = searchBar
        
        tableView.dataSource = self
        tableView.register(UINib(nibName: "JourneyCardCell", bundle: nil), forCellReuseIdentifier: "JourneyReusableCell")

    }


}

extension JourneyViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "JourneyReusableCell", for: indexPath) as! JourneyCardCell
        
        return cell
    }
    
    
}
