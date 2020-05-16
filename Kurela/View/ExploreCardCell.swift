//
//  ExploreCardCell.swift
//  Kurela
//
//  Created by M Habib Ali Akbar on 14/05/20.
//  Copyright © 2020 Group 16 MC2 2020. All rights reserved.
//

import UIKit

class ExploreCardCell: UITableViewCell {

    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var imageCardView: UIImageView!
    @IBOutlet weak var organizationImageView: UIImageView!
    @IBOutlet weak var viewTransparent: UIView!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var infoNameLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var daysLeftLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        cardView.layer.cornerRadius = 20
        cardView.layer.shadowColor = UIColor.gray.cgColor
        cardView.layer.shadowOpacity = 0.5
        cardView.layer.shadowRadius = 10.89
        cardView.layer.shadowOffset = CGSize(width: 0.0, height: 2.25)
        
        imageCardView.layer.cornerRadius = 20
        organizationImageView.layer.cornerRadius = 20
        
        viewTransparent.layer.cornerRadius = 20
        viewTransparent.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
