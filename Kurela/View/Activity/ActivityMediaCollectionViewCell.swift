//
//  ActivityMediaCollectionViewCell.swift
//  Kurela
//
//  Created by Edwin Sendjaja on 5/22/20.
//  Copyright © 2020 Group 16 MC2 2020. All rights reserved.
//

import UIKit

class ActivityMediaCollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet weak var mediaImageView: UIImageView!
    @IBOutlet weak var playMediaButton: UIButton!
    
    func configure(media: UIImage, videoURL: String) {
        mediaImageView.image = media
    }
    
}
