//
//  ActivityTableViewCell.swift
//  Kurela
//
//  Created by Edwin Sendjaja on 5/16/20.
//  Copyright © 2020 Group 16 MC2 2020. All rights reserved.
//

import UIKit

class ActivityHeaderTableViewCell: UITableViewCell {

    @IBOutlet weak var activityLabel: UILabel!
    @IBOutlet weak var organizationLabel: UILabel!
    
    @IBOutlet weak var dateEventLabel: UILabel!
    @IBOutlet weak var locationEventLabel: UILabel!
    @IBOutlet weak var appliedPersonLabel: UILabel!
       
    @IBOutlet weak var dayLeftLabel: UILabel!
    
    @IBOutlet weak var informationTextLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
