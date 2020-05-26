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
    
    @IBOutlet weak var descriptionTextLabel: UILabel!
    @IBOutlet weak var requirementTextLabel: UILabel!
    @IBOutlet weak var contactTextLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var websiteLabel: UILabel!
    @IBOutlet weak var organizationInfoLabel: UILabel!
    
    @IBOutlet weak var descriptionView: UIView!
    @IBOutlet weak var requirementView: UIView!
    @IBOutlet weak var contactView: UIView!
    
    @IBOutlet weak var descriptionButtonLabel: UILabel!
    @IBOutlet weak var requirementButtonLabel: UILabel!
    @IBOutlet weak var contactButtonLabel: UILabel!
    
    @IBOutlet weak var descriptionButton: UIButton!
    
    @IBOutlet weak var stateButton: UIButton!
    @IBOutlet weak var requirementButton: UIButton!
    @IBOutlet weak var contactButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        stateButton.layer.cornerRadius = 15

    }

    @IBAction func descriptionButton(_ sender: UIButton) {
        
        descriptionButton.setImage(#imageLiteral(resourceName: "profileactive3"), for: .normal)
        requirementButton.setImage(#imageLiteral(resourceName: "iconinactive2"), for: .normal)
        contactButton.setImage(#imageLiteral(resourceName: "iconinactive3"), for: .normal)
        
        descriptionButtonLabel.textColor = UIColor(named: "AppColor")
        requirementButtonLabel.textColor = .black
        contactButtonLabel.textColor = .black
        
        descriptionView.isHidden = false
        requirementView.isHidden = true
        contactView.isHidden = true
    }
    
    @IBAction func requirementButton(_ sender: UIButton) {
        
        descriptionButton.setImage(#imageLiteral(resourceName: "profileinactive3"), for: .normal)
        requirementButton.setImage(#imageLiteral(resourceName: "iconactive2"), for: .normal)
        contactButton.setImage(#imageLiteral(resourceName: "iconinactive3"), for: .normal)
        
        descriptionButtonLabel.textColor = .black
        requirementButtonLabel.textColor = UIColor(named: "AppColor")
        contactButtonLabel.textColor = .black
        
        descriptionView.isHidden = true
        requirementView.isHidden = false
        contactView.isHidden = true
    }
    
    @IBAction func contactButton(_ sender: UIButton) {
        
        descriptionButton.setImage(#imageLiteral(resourceName: "iconinactive1"), for: .normal)
        requirementButton.setImage(#imageLiteral(resourceName: "iconinactive2"), for: .normal)
        contactButton.setImage(#imageLiteral(resourceName: "iconactive3"), for: .normal)
        
        descriptionButtonLabel.textColor = .black
        requirementButtonLabel.textColor = .black
        contactButtonLabel.textColor = UIColor(named: "AppColor")
        
        descriptionView.isHidden = true
        requirementView.isHidden = true
        contactView.isHidden = false
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
