//
//  ActivityMediaCollectionViewCell.swift
//  Kurela
//
//  Created by Edwin Sendjaja on 5/22/20.
//  Copyright © 2020 Group 16 MC2 2020. All rights reserved.
//

import UIKit
import AVKit

class ActivityMediaCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var mediaImageView: UIImageView!
    @IBOutlet weak var playMediaButton: UIButton!
    
    weak var activityViewController : ActivityViewController?

    var videoURL: String = ""
    
    override func awakeFromNib() {
//        print(mediaImageView.frame.width)
//        print(mediaImageView.frame.height)
       }
    
    @IBAction func playMediaButton(_ sender: UIButton) {
        playVideo(videoURL)
    }
    
    func configure(controller: ActivityViewController, media: UIImage, videoURL: String) {
        activityViewController = controller
        mediaImageView.image = media
        mediaImageView.contentMode = .scaleToFill
        
        if (videoURL.isEmpty){
            playMediaButton.isHidden = true
        } else {
            self.videoURL = videoURL
        }
    }
    
    func playVideo(_ videoUrl: String) {
           
           guard let url = URL(string: videoUrl) else {
               return
           }
           // Create an AVPlayer, passing it the HTTP Live Streaming URL.
           let player = AVPlayer(url: url)

           // Create a new AVPlayerViewController and pass it a reference to the player.
           let controller = AVPlayerViewController()
           controller.player = player

           // Modally present the player and call the player's play() method when complete.
        self.activityViewController!.present(controller, animated: true) {
               player.play()
           }
        
//        let playerLayer = AVPlayerLayer(player: player)
//        playerLayer.frame = self.super.bounds
//        self.view.layer.addSublayer(playerLayer)
//        self.controller
//        player.play()
//           
           
       }
    
}
