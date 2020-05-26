//
//  OnboardingViewController.swift
//  Kurela
//
//  Created by Felicia Juwantoro on 23/05/20.
//  Copyright © 2020 Group 16 MC2 2020. All rights reserved.
//

import UIKit

class OnboardingViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var startBtn: UIButton!
    
    var images: [String] = ["onboarding1","onboarding2","onboarding3"]
    var frame = CGRect(x: 0, y: 60, width: 0, height: 0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pageControl.numberOfPages = images.count

        for index in 0..<images.count {
            frame.origin.x = scrollView.frame.size.width * CGFloat(index)
            frame.size = scrollView.frame.size
            
            let imageView = UIImageView(frame: frame)
            imageView.image = UIImage(named: images[index])
            self.scrollView.addSubview(imageView)
            scrollView.translatesAutoresizingMaskIntoConstraints = false
            scrollView.widthAnchor.constraint(equalToConstant: 414).isActive = true
            scrollView.heightAnchor.constraint(equalToConstant: 629).isActive = true
        }
        scrollView.contentSize = CGSize(width: (scrollView.frame.size.width * CGFloat(images.count)), height: scrollView.frame.size.height)
        scrollView.delegate = self
    }
    
    //ScrollView Method
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        var pageNumber = scrollView.contentOffset.x / scrollView.frame.size.width
        pageControl.currentPage = Int(pageNumber)
    }
    
        
    @IBAction func startButton(_ sender: Any) {
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        let tabBarViewController = storyboard.instantiateViewController(withIdentifier: "TabBarIdentifier")
//        let targetNavigationController = UINavigationController(rootViewController: tabBarViewController)
//        targetNavigationController.modalPresentationStyle = .fullScreen
//        targetNavigationController.isModalInPresentation = false
//        present(targetNavigationController, animated: false)
//        
//       // let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "viewController") as! ViewController
//
//        //return vcf
        
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "TabBarIdentifier")
        self.present(controller, animated: false, completion: nil) //ganti animated true kalau mau ada efek dari bawah ke atas

    }
    
  
    
}
