//
//  CategoryCell.swift
//  Kurela
//
//  Created by Felicia Juwantoro on 13/05/20.
//  Copyright © 2020 Group 16 MC2 2020. All rights reserved.
//

import UIKit

class CategoryCell: UICollectionViewCell {

    @IBOutlet weak var categoryIcon: UIImageView!
    @IBOutlet weak var categoryLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    
    func categorySet(icons: UIImage, categoryname: String) {
        categoryIcon.image = icons
        categoryLabel.text = categoryname
    }
}
