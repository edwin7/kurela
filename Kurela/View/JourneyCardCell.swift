//
//  JourneyCardCell.swift
//  Kurela
//
//  Created by M Habib Ali Akbar on 14/05/20.
//  Copyright © 2020 Group 16 MC2 2020. All rights reserved.
//

import UIKit

class JourneyCardCell: UITableViewCell {


    @IBOutlet weak var cardView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        cardView.layer.cornerRadius = 20
        
        cardView.layer.shadowColor = UIColor.gray.cgColor
        cardView.layer.shadowOpacity = 0.2
        cardView.layer.shadowRadius = 10.89
        cardView.layer.shadowOffset = CGSize(width: 0.0, height: 2.25)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

