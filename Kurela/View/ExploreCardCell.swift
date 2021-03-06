//
//  ExploreCardCell.swift
//  Kurela
//
//  Created by Felicia Juwantoro on 13/05/20.
//  Copyright © 2020 Group 16 MC2 2020. All rights reserved.
//

import UIKit

class ExploreCardCell: UITableViewCell {

    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var pictureView: UIImageView!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var titleView: UIView!
    @IBOutlet weak var flagView: UIImageView!
    @IBOutlet weak var tagLabel: UILabel!
    @IBOutlet weak var logoView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        cardView.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        cardView.layer.shadowOpacity = 1
        cardView.layer.shadowRadius = 10
        titleView.clipsToBounds = true
        titleView.layer.cornerRadius = 10
        titleView.layer.maskedCorners = [.layerMaxXMaxYCorner,.layerMinXMaxYCorner]
    }

    func configure(picture: UIImage, date: String, title: String, location: String, tags: UIImage, duedate: String, logos: UIImage){
        pictureView.image = picture
        dateLabel.text = date
        titleLabel.text = title
        locationLabel.text = location
        flagView.image = tags
        tagLabel.text = duedate
        logoView.image = logos
    }
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        //Configure the view for the selected state
   }
    
}
