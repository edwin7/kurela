//
//  JourneyDetailViewController.swift
//  Kurela
//
//  Created by M Habib Ali Akbar on 19/05/20.
//  Copyright © 2020 Group 16 MC2 2020. All rights reserved.
//

import UIKit
import CoreData

class JourneyDetailViewController: UIViewController {

    @IBOutlet weak var detailButton: UIButton!
    @IBOutlet weak var ilustrationImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var firstTabButton: UIButton!
    @IBOutlet weak var secondTabButton: UIButton!
    @IBOutlet weak var thirdTabButton: UIButton!
    @IBOutlet weak var fourthTabButton: UIButton!
    @IBOutlet weak var oneTwoView: UIView!
    @IBOutlet weak var twoThreeView: UIView!
    @IBOutlet weak var threeFourView: UIView!
    @IBOutlet weak var bottomDetailView: UIView!
    @IBOutlet weak var journeyDetailLabel: UILabel!
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    var journeyDetail: UserJourney?
    var sendParameter: [VolunteeringInfo]?
    
    let statusStrings = ["Terima kasih pendaftaran Anda sudah diverifikasi. Mohon menunggu untuk proses screening berdasarkan data diri dan CV Anda.", "Selamat !! Anda masuk lolos ketahap selanjutnya yaitu interview. Untuk interview akan dilakukan secara online pada link dibawah.", "Terima kasih telah mengikuti proses wawancara. Hasil wawancara masih kami review. Silahkan menunggu untuk keseluruhan proses seleksi relawan. Hasil seleksi akan diinfokan pada Rabu, 10 Juni 2020.", "Selamat! Anda lolos dalam proses seleksi menjadi relawan. Selanjutnya, silahkan cek email anda untuk info selanjutnya"]
    let statusRejected = "Terima kasih atas partisipasi Anda, tetapi mohon maaf Anda belum bisa bergabung dengan kami saat ini karena Anda belum memenuhi ekspektasi kami untuk bergabung dalam kegiatan ini. Kami mengharapkan partisipasi Anda pada lain waktu."
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.tintColor = UIColor(named: "AppColor")
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        
        customUi()
        tabBarUpdate(journeyDetail!.status)
        // Do any additional setup after loading the view.
    }
    
    func customUi() {
        firstTabButton.backgroundColor = .systemGray6
        secondTabButton.backgroundColor = .systemGray6
        thirdTabButton.backgroundColor = .systemGray6
        fourthTabButton.backgroundColor = .systemGray6
        
        firstTabButton.layer.cornerRadius = firstTabButton.frame.height / 2
        secondTabButton.layer.cornerRadius = firstTabButton.frame.height / 2
        thirdTabButton.layer.cornerRadius = firstTabButton.frame.height / 2
        fourthTabButton.layer.cornerRadius = firstTabButton.frame.height / 2
        detailButton.layer.cornerRadius = 15
        
        if journeyDetail!.status == Int16(2) {
            oneTwoView.backgroundColor = UIColor(named: "AppColor")
        } else if journeyDetail!.status == Int16(3) {
            oneTwoView.backgroundColor = UIColor(named: "AppColor")
            twoThreeView.backgroundColor = UIColor(named: "AppColor")
        } else if journeyDetail!.status == Int16(4) {
            oneTwoView.backgroundColor = UIColor(named: "AppColor")
            twoThreeView.backgroundColor = UIColor(named: "AppColor")
            threeFourView.backgroundColor = UIColor(named: "AppColor")
        }
        
        if journeyDetail?.rejectedStatus == Int16(1) {
            oneTwoView.backgroundColor = UIColor(named: "AppRejectedColor")
            twoThreeView.backgroundColor = UIColor(named: "AppRejectedColor")
            threeFourView.backgroundColor = UIColor(named: "AppRejectedColor")
        } else if journeyDetail?.rejectedStatus == Int16(2) {
            twoThreeView.backgroundColor = UIColor(named: "AppRejectedColor")
            threeFourView.backgroundColor = UIColor(named: "AppRejectedColor")
        } else if journeyDetail?.rejectedStatus == Int16(3) {
            threeFourView.backgroundColor = UIColor(named: "AppRejectedColor")
        }
        
        
        
        
        titleLabel.text = journeyDetail?.infoDetail?.activityName
    }
    
    
    
    @IBAction func detailPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "journeyToDetail", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! ActivityViewController
        destinationVC.data = journeyDetail?.infoDetail
    
    }
    
    @IBAction func tabProgressPressed(_ sender: UIButton) {
        
        if sender.titleLabel?.text == "1", journeyDetail!.status >= Int16(1) {
            tabBarUpdate(1)
        } else if sender.titleLabel?.text == "2", journeyDetail!.status >= Int16(2) {
            tabBarUpdate(2)
        } else if sender.titleLabel?.text == "3", journeyDetail!.status >= Int16(3) {
            tabBarUpdate(3)
        } else if sender.titleLabel?.text == "4", journeyDetail!.status >= Int16(4) {
            tabBarUpdate(4)
        }
        
    }
    
    func tabBarUpdate(_ tabBarId: Int16) {
        
        
        if tabBarId == 1 {
            ilustrationImage.image = #imageLiteral(resourceName: "journey1")
            updateTab(1)

        } else if tabBarId == 2 {
            ilustrationImage.image = #imageLiteral(resourceName: "journey2")
            updateTab(2)

        } else if tabBarId == 3 {
            ilustrationImage.image = #imageLiteral(resourceName: "journey3")
            updateTab(3)

        } else if tabBarId == 4 {
            ilustrationImage.image = #imageLiteral(resourceName: "journey4")
            updateTab(4)
        }
        
        
        
    }
    
    func updateTab(_ tabId: Int) {
        if journeyDetail!.status >= Int16(1) {
            firstTabButton.backgroundColor = UIColor(named: "AppColor")
            firstTabButton.setTitleColor(.white, for: .normal)
        }
        if journeyDetail!.status >= Int16(2) {
            if journeyDetail!.rejectedStatus <= Int16(1), journeyDetail!.rejectedStatus > Int16(0) {
                secondTabButton.backgroundColor = UIColor(named: "AppRejectedColor")
            } else {
                secondTabButton.backgroundColor = UIColor(named: "AppColor")
            }
            secondTabButton.setTitleColor(.white, for: .normal)
        }
        if journeyDetail!.status >= Int16(3) {
            if journeyDetail!.rejectedStatus <= Int16(2), journeyDetail!.rejectedStatus > Int16(0) {
                thirdTabButton.backgroundColor = UIColor(named: "AppRejectedColor")
            } else {
                thirdTabButton.backgroundColor = UIColor(named: "AppColor")
            }
            thirdTabButton.setTitleColor(.white, for: .normal)
        }
        if journeyDetail!.status >= Int16(4) {
            if journeyDetail!.rejectedStatus <= Int16(3), journeyDetail!.rejectedStatus > Int16(0) {
                fourthTabButton.backgroundColor = UIColor(named: "AppRejectedColor")
            } else {
                fourthTabButton.backgroundColor = UIColor(named: "AppColor")
            }
            fourthTabButton.setTitleColor(.white, for: .normal)
        }
        
        
        switch tabId {
        case 1:
            firstTabButton.backgroundColor = UIColor(named: "AppSecondColor")
            journeyDetailLabel.text = statusStrings[0]
            bottomDetailView.isHidden = true
        case 2:
            if journeyDetail!.rejectedStatus <= Int16(1), journeyDetail!.rejectedStatus > Int16(0) {
                secondTabButton.backgroundColor = UIColor(named: "AppRejectedSecondColor")
                journeyDetailLabel.text = statusRejected
                bottomDetailView.isHidden = true
            } else {
                secondTabButton.backgroundColor = UIColor(named: "AppSecondColor")
                journeyDetailLabel.text = statusStrings[1]
                bottomDetailView.isHidden = false
            }
            
        case 3:
            bottomDetailView.isHidden = true
            if journeyDetail!.rejectedStatus <= Int16(2), journeyDetail!.rejectedStatus > Int16(0) {
                thirdTabButton.backgroundColor = UIColor(named: "AppRejectedSecondColor")
                journeyDetailLabel.text = statusRejected
            } else {
                thirdTabButton.backgroundColor = UIColor(named: "AppSecondColor")
                journeyDetailLabel.text = statusStrings[2]
            }
        case 4:
            bottomDetailView.isHidden = true
            if journeyDetail!.rejectedStatus <= Int16(3), journeyDetail!.rejectedStatus > Int16(0) {
                fourthTabButton.backgroundColor = UIColor(named: "AppRejectedSecondColor")
                journeyDetailLabel.text = statusRejected
            } else {
                fourthTabButton.backgroundColor = UIColor(named: "AppSecondColor")
                journeyDetailLabel.text = statusStrings[3]
            }
        default:
            print("Next update")
        }
    }
    
    func saveData() {
        do {
            try context.save()
        } catch {
            print(error)
        }
    }
    
    
    
    @IBAction func hiddenPressed(_ sender: UIButton) {
        if journeyDetail!.status < Int16(4) {
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy/MM/dd"
            
            journeyDetail?.status += 1
            switch journeyDetail?.status {
            case 2:
                journeyDetail?.interviewDate = formatter.date(from: "2020/6/1")!
            case 3:
                journeyDetail?.inreviewDate = formatter.date(from: "2020/6/10")!
            case 4:
                journeyDetail?.resultDate = formatter.date(from: "2020/6/13")!
            default:
                print("Error")
            }
            saveData()
            customUi()
            tabBarUpdate(journeyDetail!.status)
        }
    }
    @IBAction func hiddenRejectedPressed(_ sender: UIButton) {
        if journeyDetail!.status < Int(4) {
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy/MM/dd"
            
            journeyDetail?.rejectedStatus = journeyDetail!.status
            journeyDetail?.status = 4
            journeyDetail?.resultDate = formatter.date(from: "2020/6/13")!
            saveData()
            customUi()
            tabBarUpdate(4)
        }
    }
    
    
}


