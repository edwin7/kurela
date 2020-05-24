//
//  ActivityViewController.swift
//  Kurela
//
//  Created by Edwin Sendjaja on 5/16/20.
//  Copyright © 2020 Group 16 MC2 2020. All rights reserved.
//

import UIKit
import AVKit
import CoreData


class ActivityViewController: UIViewController {

    @IBOutlet weak var activityTableView: UITableView!
    @IBOutlet weak var organizationImage: UIImageView!
    
    @IBOutlet weak var headerView: UIView!
    
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    var activityTitle: String = ""
    var information_text: String = ""
    
    var data: VolunteeringInfo?
    
    var mediaImages: [UIImage] = []
    var mediaResources = Dictionary<String, Any>()
    var videoUrl = ""
    
    let rightButton : UIButton = UIButton(type: UIButton.ButtonType.custom)

    @IBOutlet weak var organizationImageView: UIImageView!
    
    @IBOutlet weak var mediaCollectionView: UICollectionView!
    
    @IBOutlet weak var mediaPageControl: UIPageControl!
    
    var timer = Timer()
    var counter = 0
    
    var mediaImagesData: [Data] = []

    var mediaResourcesCollections: [Dictionary<String, Any>] = []

    func createDummyData() {
        
        mediaResources["images"] = data!.activityImage!
        mediaResources["videoUrl"] = data!.activityVideoUrl!
        
        mediaResourcesCollections.append(mediaResources)
        
        mediaResources["images"] = data!.activityImage2!
        mediaResources["videoUrl"] = ""
        mediaResourcesCollections.append(mediaResources)
        
        
        mediaResources["images"] = data!.activityImage3!
        mediaResources["videoUrl"] = ""
        mediaResourcesCollections.append(mediaResources)
              
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        activityTableView.delegate = self
        activityTableView.dataSource = self
        
        mediaCollectionView.delegate = self
        mediaCollectionView.dataSource = self
        

        setData()
        
        mediaPageControl.numberOfPages = mediaResourcesCollections.count
        mediaPageControl.currentPage = 0
        
        //TImer to change image automatically
//        DispatchQueue.main.async {
//            self.timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(self.changeImage), userInfo: nil, repeats: true)
//        }
//

    }
    
//    @objc func changeImage() {
//
//        let indexPath = IndexPath.init(item: counter, section: 0)
//
//        if counter < mediaResourcesCollections.count {
    //        self.mediaCollectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
//            counter += 1
//        } else {
//            counter = 0
    //        self.mediaCollectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
//        }
//    }
    
//    @IBAction func backButtonPressed(_ sender: Any) {
//        self.navigationController?.popViewController(animated:true)
//    }
    
    @IBAction func applyButtonPressed(_ sender: UIButton) {
        
        let newJourney = UserJourney(context: self.context)
        newJourney.infoDetail = data
        newJourney.status = 1
        newJourney.applyDate = Date()
        saveData()
        
        sender.setTitle("Applied", for: .normal)
        sender.isEnabled = false
        sender.backgroundColor = .gray
        
        rightButton.setTitle("Applied", for: .normal)
        rightButton.isEnabled = false
        rightButton.backgroundColor = .gray
        
        let alert = UIAlertController(title: "Added to your Journey", message: "Open the Journey page to see your status", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
        //        alert.addAction(UIAlertAction(title: "Go to Journey", style: .default, handler: { (alert) in
        //            tabBarController.selectedIndex = indexToWhichYouWantToMove;
        //        }))
        
        self.present(alert, animated: true)
    }
    
    func setData() {
        
        createDummyData()
        organizationImage.image = UIImage(data: data!.organizationImage!)
    }

}

// MARK: Collection View Extension
extension ActivityViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let scrollPos = scrollView.contentOffset.x / view.frame.width
                mediaPageControl.currentPage = Int(scrollPos)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

        return mediaResourcesCollections.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell = mediaCollectionView.dequeueReusableCell(withReuseIdentifier: "mediaCell", for: indexPath) as! ActivityMediaCollectionViewCell
            
            let imageView = UIImage(data: mediaResourcesCollections[indexPath.row]["images"] as! Data)
            
            cell.configure(controller: self, media: imageView!, videoURL: mediaResourcesCollections[indexPath.row]["videoUrl"] as! String)
        
        return cell
    }
    
}

extension ActivityViewController: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        let size = collectionView.frame.size
 
        return CGSize(width: size.width, height: size.height)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }
}

//MARK: Table View Extension
extension ActivityViewController: UITableViewDelegate, UITableViewDataSource {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {

        let maximumVerticalOffset = CGFloat(135)
        let currentVerticalOffset = scrollView.contentOffset.y
        let percentageVerticalOffset = currentVerticalOffset / maximumVerticalOffset

        let color = UIColor.init(red: 255/255.0, green: 255/255.0, blue: 255/255.0, alpha: percentageVerticalOffset)
        navigationController?.navigationBar.backgroundColor = color
        
        if (percentageVerticalOffset < 1){
            configureNavBarABeforeScroll()
        }
        else {
            configureNavBarAfterScroll()
        }
    }
    
    func setCustomBarButtonItemAppearance() -> UIBarButtonItemAppearance {
         let barButtonItemApperance = UIBarButtonItemAppearance()
         barButtonItemApperance.normal.titleTextAttributes = [.foregroundColor: UIColor.white]

        return barButtonItemApperance
    }
    
    func setCustomNavBarAppearance() -> UINavigationBarAppearance {
        //Custom Standard & Compact Nav Bar
        let newStandardAppearance = UINavigationBarAppearance()
        
        newStandardAppearance.configureWithTransparentBackground()
        
        newStandardAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        newStandardAppearance.buttonAppearance = setCustomBarButtonItemAppearance()
        newStandardAppearance.setBackIndicatorImage(UIImage(systemName: "arrow.left.circle.fill"),
             transitionMaskImage: UIImage(systemName: "arrow.left.circle.fill"))
        
        return newStandardAppearance
    }
    
    func setAfterScrollCustomBarButtonItemAppearance() -> UIBarButtonItemAppearance {
        
        let barButtonItemApperance = UIBarButtonItemAppearance()
        barButtonItemApperance.normal.titleTextAttributes = [.foregroundColor: UIColor(named: "AppColor")!]
        
        return barButtonItemApperance
    }
    
    func setAfterScrollCustomNavBarAppearance() -> UINavigationBarAppearance {

        let newStandardAppearance = UINavigationBarAppearance()
        
        newStandardAppearance.configureWithOpaqueBackground()
        
        newStandardAppearance.buttonAppearance = setAfterScrollCustomBarButtonItemAppearance()
        newStandardAppearance.setBackIndicatorImage(nil,
                                                    transitionMaskImage: nil)
        newStandardAppearance.titleTextAttributes = [.foregroundColor: UIColor.black]

        return newStandardAppearance
    }
    
    func configureNavBarABeforeScroll() {
        
        self.title = ""
        self.navigationItem.titleView = nil
        self.navigationItem.rightBarButtonItem = nil
        
        self.navigationController?.navigationBar.tintColor = .white

        configureBeforeScrollLeftButton()
                
        navigationItem.hidesBackButton = false

        let newStandardAppearance = setCustomNavBarAppearance()

        navigationItem.standardAppearance = newStandardAppearance
        navigationItem.compactAppearance = newStandardAppearance
        navigationItem.scrollEdgeAppearance = newStandardAppearance
        
    }
    
    func configureNavBarAfterScroll() {
                
        self.title = activityTitle
        let tlabel = UILabel(frame: CGRect(x: 0, y: 0, width: 10, height: 40))
        tlabel.text = self.title
        tlabel.textColor = UIColor.black
        tlabel.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        tlabel.backgroundColor = UIColor.clear
        tlabel.adjustsFontSizeToFitWidth = true
        tlabel.textAlignment = .center
        self.navigationItem.titleView = tlabel


        //Configure Standard & Compact Nav Bar
        let newStandardAppearance = setAfterScrollCustomNavBarAppearance()
                   
        navigationItem.standardAppearance = newStandardAppearance
        navigationItem.compactAppearance = newStandardAppearance
        navigationItem.scrollEdgeAppearance = newStandardAppearance

        self.navigationController?.navigationBar.tintColor = UIColor(named: "AppColor")

        configureRightButton()
        configureAfterScrollLeftButton()
    }
    
        
    func configureRightButton() {
        
        navigationItem.hidesBackButton = false

        rightButton.setTitle("Apply", for: .normal)
        
        rightButton.titleLabel!.font = .systemFont(ofSize: 14)
        rightButton.frame.size = CGSize(width: 80, height: 30)
        rightButton.backgroundColor = UIColor(red: 0, green: 0.711, blue: 0.867, alpha: 1)
        rightButton.layer.cornerRadius = 15
        
        var tmp = [UserJourney]()
        let request: NSFetchRequest<UserJourney> = UserJourney.fetchRequest()
        let predicate = NSPredicate(format: "infoDetail.activityName MATCHES %@", data!.activityName!)
        request.predicate = predicate
        do {
            tmp = try context.fetch(request)
            if tmp.count != 0 {
                rightButton.isEnabled = false
                rightButton.setTitle("Applied", for: .normal)
                rightButton.backgroundColor = .gray
            }
        } catch {
            print("Error fetching UserJourney, \(error)")
        }

        let customRightBarButtonItem = UIBarButtonItem(customView: rightButton)
        navigationItem.rightBarButtonItem = customRightBarButtonItem
        
        rightButton.addTarget(self, action: #selector(pressed), for: .touchUpInside)

    }
    
    func configureBeforeScrollLeftButton() {
        
        navigationItem.hidesBackButton = false
        
        let leftButtonCustomView = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 30))
        //let  leftButton = UIButton(frame: CGRect(x: -30, y: 10 , width: 80, height: 30))
        let leftButton = UIButton(frame: CGRect(origin: CGPoint(x: -30, y: 0),
                                                size: CGSize(width: 100, height: 30)))
        
        //leftButton.alpha = 0.5

        leftButton.setImage(UIImage(systemName: "chevron.left"), for: .normal)
        leftButton.setTitle("Back", for: .normal)
        
        leftButton.titleLabel!.font = .systemFont(ofSize: 14)
        //leftButton.frame.size = CGSize(width: 80, height: 30)
        //leftButton.frame = CGRect.init(x: -40, y: 0, width: 130, height: 30)
        leftButton.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.65)
        leftButton.layer.cornerRadius = 13
        leftButton.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMaxXMaxYCorner]

        leftButton.transform = CGAffineTransform(translationX: -5, y: 0)
        leftButton.addTarget(self, action: #selector(backAction), for: .touchUpInside)

        leftButtonCustomView.addSubview(leftButton)

        let customLeftBarButtonItem = UIBarButtonItem(customView: leftButtonCustomView)
        navigationItem.leftBarButtonItem = customLeftBarButtonItem
        
     }
    
    func configureAfterScrollLeftButton() {
        navigationItem.leftBarButtonItem = nil
     }
    
    @objc func backAction() {
        self.navigationController?.popViewController(animated:true)
    }
    
    @objc func pressed(sender: UIButton!) {
        var tmp = [UserJourney]()
        let request: NSFetchRequest<UserJourney> = UserJourney.fetchRequest()
        let predicate = NSPredicate(format: "infoDetail.activityName MATCHES %@", data!.activityName!)
        request.predicate = predicate
        do {
            tmp = try context.fetch(request)
            if tmp.count == 0 {
                let newJourney = UserJourney(context: self.context)
                newJourney.infoDetail = data
                newJourney.status = 1
                newJourney.applyDate = Date()
                saveData()
                sender.setTitle("Applied", for: .normal)
                sender.isEnabled = false
                sender.backgroundColor = .gray
                
                let alert = UIAlertController(title: "Added to your Journey", message: "Open the Journey page to see your status", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
                //        alert.addAction(UIAlertAction(title: "Go to Journey", style: .default, handler: { (alert) in
                //            tabBarController.selectedIndex = indexToWhichYouWantToMove;
                //        }))
                
                self.present(alert, animated: true)
                
                activityTableView.reloadData()
            }
        } catch {
            print("Error fetching UserJourney, \(error)")
        }
        
        
    }
    
    func saveData() {
        do {
            try context.save()
        } catch {
            print(error)
        }
    }
    
 
    @objc func back(sender: UIBarButtonItem) {
              self.navigationController?.popViewController(animated:true)
          
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
                
        let cell = activityTableView.dequeueReusableCell(withIdentifier: "activityCell", for: indexPath) as! ActivityHeaderTableViewCell
        
        activityTitle = "Berbagi "

        cell.activityLabel.text = data?.activityName
        cell.organizationLabel.text = data?.organizationName
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE, d MMM yyyy"
        cell.dateEventLabel.text = formatter.string(from: data!.date!)
        cell.appliedPersonLabel.text = "\(data!.peopleApplied) applied"
        cell.locationEventLabel.text = data?.location
        cell.dayLeftLabel.text = "\(data!.daysLeft) days left"
        cell.descriptionTextLabel.text = data?.descriptions
        cell.requirementTextLabel.text = data?.requirement
        cell.phoneLabel.text = data?.organizationPhone
        cell.emailLabel.text = data?.organizationEmail
        cell.addressLabel.text = data?.organizationAddress

        var tmp = [UserJourney]()
        let request: NSFetchRequest<UserJourney> = UserJourney.fetchRequest()
        let predicate = NSPredicate(format: "infoDetail.activityName MATCHES %@", data!.activityName!)
        request.predicate = predicate
        do {
            tmp = try context.fetch(request)
            if tmp.count != 0 {
                cell.stateButton.isEnabled = false
                cell.stateButton.backgroundColor = .gray
                cell.stateButton.setTitle("Applied", for: .normal)
            }
        } catch {
            print("Error fetching UserJourney, \(error)")
        }
        
        return cell

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
        present(controller, animated: true) {
            player.play()
        }
        
        
    }
    
    
}
