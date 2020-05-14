//
//  CardCell.swift
//  Kurela
//
//  Created by M Habib Ali Akbar on 08/05/20.
//  Copyright © 2020 Group 16 MC2 2020. All rights reserved.
//

import UIKit

class CardCell: UITableViewCell {

    @IBOutlet weak var view: UIView!
    @IBOutlet weak var infoImage: UIImageView!
    @IBOutlet weak var infoLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        view.layer.cornerRadius = 20
        
        view.layer.shadowColor = UIColor.gray.cgColor
        view.layer.shadowOpacity = 0.2
        view.layer.shadowRadius = 10.89
        view.layer.shadowOffset = CGSize(width: 0.0, height: 2.25)
        
        infoImage.layer.cornerRadius = 20
        infoImage.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
