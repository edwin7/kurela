//
//  ExploreViewController.swift
//  Kurela
//
//  Created by M Habib Ali Akbar on 08/05/20.
//  Copyright © 2020 Group 16 MC2 2020. All rights reserved.
//

import UIKit
import CoreData


class ExploreViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
   
    @IBOutlet weak var categoryCollectionView: UICollectionView!
    @IBOutlet weak var cardTableView: UITableView!
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    var infoArray = [VolunteeringInfo]()
    
    var selectedIndex: Int?
//    content in card table view
//    let pictures: [UIImage] = [UIImage(named: "card1.png")!, UIImage(named: "card2.png")!, UIImage(named: "card3.png")!, UIImage(named: "card4.png")!, UIImage(named: "card5.png")!, UIImage(named: "card6.png")!,]
//    let titles: [String] = ["Relawan Siaga Erupsi Gunung Merapi", "Kado untuk Anak Jalanan Sekitar Kita", "Berbagi Sembako untuk Driver Online", "Donor Darah untuk Pasien COVID-19", "Sosialisasi Huruf Braille untuk Teman Netra", "Donasi Masker dan Gloves COVID-19"]
//    let date: [String] = ["20 Mei 2020", "30 Mei 2020", "15 Mei 2020", "15 Mei 2020", "1 Juni 2020", "30 Juni 2020"]
//    let location: [String] = ["DIY Yogyakarta", "DKI Jakarta", "Tangerang Selatan", "Jakarta Pusat", "Sumatera Selatan", "Bali"]
//    let tag: [UIImage] = [UIImage(named: "tag.png")!,UIImage(named: "tag.png")!,UIImage(named: "tag.png")!,UIImage(named: "tag.png")!,UIImage(named: "tag.png")!,UIImage(named: "tag.png")!,]
//    let due: [String] = ["3 days left", "5 days left", "10 Mei 2020", "8 Mei 2020", "20 Mei 2020", "1 Juni 2020"]
//    let logo: [UIImage] = [UIImage(named: "logo1.png")!,UIImage(named: "logo2.png")!,UIImage(named: "logo3.png")!,UIImage(named: "logo4.png")!,UIImage(named: "logo5.png")!,UIImage(named: "logo6.png")!,]
//
    //content in category collection view
    let icon: [UIImage] = [UIImage(named: "category1.png")!,UIImage(named: "category2.png")!,UIImage(named: "category3.png")!,UIImage(named: "category4.png")!,UIImage(named: "category5.png")!,UIImage(named: "category6.png")!,UIImage(named: "category7.png")!,UIImage(named: "category8.png")!]
    let category: [String] = ["Highlight", "COVID-19", "Children", "Education", "Disablity", "Disaster", "Donation", "On-Site"]

    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavBar()
        view.backgroundColor = .white
        setupNavBar()
       //navigationController?.navigationBar.barStyle = .black
       // navigationController?.navigationBar.isTranslucent = false
        navigationItem.largeTitleDisplayMode = .always
        //edgesForExtendedLayout = []
        //navigationController?.navigationBar.isTranslucent = false
        saveFirstData()
        loadData()
        categoryCollectionView.delegate = self
    }
 
    
    func setupNavBar(){
        //large title for navbar
        navigationController?.navigationBar.prefersLargeTitles = true
        
        //navbar background color
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor(red: 0, green: 0.711, blue: 0.867, alpha: 1)
        
        //change title color

        appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        
        navigationItem.standardAppearance = appearance
        navigationItem.scrollEdgeAppearance = appearance
        navigationItem.compactAppearance = appearance
      
        //create search bar
        let searchController = UISearchController(searchResultsController: nil)
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.delegate = self

        //change search bar color
        let searchBar = searchController.searchBar
        searchBar.tintColor = UIColor.white
        searchBar.barTintColor = UIColor.white
        searchBar.isTranslucent = false
        searchBar.isOpaque = true
        
        //change textfield for search bar color
        if let textfield = searchBar.value(forKey: "searchField") as? UITextField {
            textfield.textColor = UIColor.black
            textfield.backgroundColor = UIColor.white
            textfield.layer.cornerRadius = 10
            textfield.clipsToBounds = true
        }
       
    }
    
    // How many rows in the table view
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return infoArray.count
    }
    
    //Defines what cells are being used
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "exploreCardCell", for: indexPath) as! ExploreCardCell
        
//        cell.configure(picture: pictures[indexPath.row], date: date[indexPath.row], title: titles[indexPath.row], location: location[indexPath.row], tags: tag[indexPath.row], duedate: due[indexPath.row], logos: logo[indexPath.row])
        
        cell.pictureView.image = UIImage(data: infoArray[indexPath.row].activityImage!)
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE, d MMM yyyy"
        cell.dateLabel.text = formatter.string(from: infoArray[indexPath.row].date!)
        cell.titleLabel.text = infoArray[indexPath.row].activityName
        cell.locationLabel.text = infoArray[indexPath.row].location
        cell.tagLabel.text = "\(infoArray[indexPath.row].daysLeft) days left"
        cell.logoView.image = UIImage(data: infoArray[indexPath.row].organizationImage!)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        selectedIndex = indexPath.row
        performSegue(withIdentifier: "goToDetail", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! ActivityViewController
        if let indexPath = selectedIndex {
            destinationVC.data = infoArray[indexPath]
        }

    }

    //How many items in collection view
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
           return 8
       }
       
    //Defines the content of the collection view
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
           let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "categoriesCell", for: indexPath) as! CategoryCell
        
            cell.categorySet(icons: icon[indexPath.row], categoryname: category[indexPath.row])
           return cell
       }
    
    //Select collection view cell
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
            print("Selected Category: \(category[indexPath.row])")
        
       }
       
    
    //MARK: - Core Data
    
    func loadData(predicate: NSPredicate? = nil) {
        let request: NSFetchRequest<VolunteeringInfo> = VolunteeringInfo.fetchRequest()
        request.sortDescriptors = [NSSortDescriptor(key: "daysLeft", ascending: true)]

        if let additonalPredicate = predicate {
            request.predicate = additonalPredicate
        }
        do {
            infoArray = try context.fetch(request)

        } catch {
            print("Error fetching VolunterringInfo, \(error)")
        }

        cardTableView.reloadData()
    }
    
    func saveData() {
        do {
            try context.save()
        } catch {
            print("Error saving data from context, \(error)")
        }
    }
    
    //MARK: - Persiapan data awal ke Core Data
    
    func saveFirstData() {
        let request: NSFetchRequest<VolunteeringInfo> = VolunteeringInfo.fetchRequest()
        do {
            let data = try context.fetch(request)
            if data.count == 0 {
                let formatter = DateFormatter()
                formatter.dateFormat = "yyyy/MM/dd"
                
                let dataArray = [
                    DataPreparation(activityImage: #imageLiteral(resourceName: "card3"), activityName: "Berbagi Sembako untuk Driver Online", category: "Donation", contactDetail: "WHO merupakan organisasi dunia yang berfokus pada hal yang mempunyai impact di kesehatan. Untuk mengenal komunitas kami lebih jauh, Anda dapat mengunjungi alawat web diatas.", date: formatter.date(from: "2020/5/29")!, daysLeft: 4, descriptions: "Dalam bagian dari solusi menghadapi krisis Pandemic Covid-19, program ini merupakan program berbagi 5a wef awef weaf ewaf aewf awef awef efwa ewfa wfae wfaew aefw efaw aefw eaf wefaawe feawfef wa efwa faew aew aefw awef a afew awefa ewfawe fa ewa wefa wefa wefa ewfawawe f  wefa wefa wefa ewfawawe f  wefa wefa wefa ewfawawe f  wefa wefa wefa ewfawawe f  wefa wefa wefa ewfawawe f  wefa wefa wefa ewfawawe f  wefa wefa wefa ewfawawe f  wefa wefa wefa ewfawawe f  wefa wefa wefa ewfawawe f  wefa wefa wefa ewfawawe f  wefa wefa wefa ewfawawe f  wefa wefa wefa ewfawawe f  wefa wefa wefa ewfawawe f  wefa wefa wefa ewfawawe f  wefa wefa wefa ewfawawe f  wefa wefa wefa ewfawawe f  wefa wefa wefa ewfawawe f  wefa wefa wefa ewfawawe f  wefa wefa wefa ewfawawe f  wefa wefa wefa ewfawawe f  wefa wefa wefa ewfawawe f ae awef awfea fewaw ef wefa wefa wefa wefaw fa wefa we awe eawf aefw afwea wea wefa ew aewa wea wea wefa wefa ewfkg beras kepada driver online di Sumatera Barat khususnya untuk driver yang sedang kesulitan untuk memenuhi kebutuhan sehari-hari.", location: "Sumatera Barat", organizationAddress: "Jl. Prof. Dr. Hamka No.2A, Air Tawar Tim., Kec. Padang Utara, Kota Padang, Sumatera Barat 25173", organizationEmail: "https://www.who.int/", organizationImage: #imageLiteral(resourceName: "logo3"), organizationName: "WHO", organizationPhone: "Mega (0869-3645-3733-2344)", peopleApplied: 115, requirement: "Dalam bagian dari solusi menghadapi krisis Pandemic Covid-19, program ini merupakan program berbagi 5a wef awef weaf ewaf aewf awef awef efwa ewfa"),
                    DataPreparation(activityImage: #imageLiteral(resourceName: "card3"), activityName: "Berbagi Sembako untuk Driver Online", category: "Donation", contactDetail: "WHO merupakan organisasi dunia yang berfokus pada hal yang mempunyai impact di kesehatan. Untuk mengenal komunitas kami lebih jauh, Anda dapat mengunjungi alawat web diatas.", date: formatter.date(from: "2020/5/29")!, daysLeft: 4, descriptions: "Dalam bagian dari solusi menghadapi krisis Pandemic Covid-19, program ini merupakan program berbagi 5kg beras kepada driver online di Sumatera Barat khususnya untuk driver yang sedang kesulitan untuk memenuhi kebutuhan sehari-hari.", location: "Sumatera Barat", organizationAddress: "Jl. Prof. Dr. Hamka No.2A, Air Tawar Tim., Kec. Padang Utara, Kota Padang, Sumatera Barat 25173", organizationEmail: "https://www.who.int/", organizationImage: #imageLiteral(resourceName: "logo3"), organizationName: "WHO", organizationPhone: "Mega (0869-3645-3733-2344)", peopleApplied: 115, requirement: "Adapun kriteria relawan yang kami butuhkan\n- Berjiwa sosial\n- Jujur\n- Supel\n- Dapat dipercaya (amanah)\n- Semangat dalam tujuan membantu sesama\n- Mampu menerapkan praktek \"social distancing\" dalam setiap aktivitas penyaluran bantuan"),
                    DataPreparation(activityImage: #imageLiteral(resourceName: "card1"), activityName: "Relawan Siaga Erupsi Gunung Merapi", category: "Disaster", contactDetail: "BNPB (Badan Nasional Penanggulangan Bencana) merupakan Lembaga yang memberikan pedoman dan pengarahan terhadap usaha penanggulangan bencana yang mencakup pencegahan bencana, penanganan keadaan darurat bencana, rehabilitasi, dan rekonstruksi secara adil dan setara", date: formatter.date(from: "2020/8/17")!, daysLeft: 3, descriptions: "udah kembali menjadi fitrahnya bahwa hidup di Indonesia akan dikelilingi oleh gunung berapi aktif. Akhir-akhir ini aktivitas gunang merapi belum menunjukkan untuk mereda. Oleh karena itu kegiatan relawan saat ini memantau aktivitas Gunung Merapi dan memberikan informasi serta menjalankan evakusi kepada warga sekitar apabila terjadi erupsi.", location: "DIY Yogyakarta", organizationAddress: "Graha BNPB - Jl. Pramuka Kav.38 Jakarta Timur 13120", organizationEmail: "contact@bnpb.go.id", organizationImage: #imageLiteral(resourceName: "logo1"), organizationName: "BNPB", organizationPhone: "Pusdalop BNPB (+62 21 29827444)", peopleApplied: 89, requirement: "Requirement :\n- Telah berumur lebih dari 18 tahun\n- Sehat secara fisik dan mental\n- Tidak mudah menyerah\n- Siap untuk berkontribusi lebih\n- Memahami penggunaan alat perlindungan diri\n- Memahami skenario evakuasi jika terjadi erupsi"),
                    DataPreparation(activityImage: #imageLiteral(resourceName: "card6"), activityName: "Donasi Masker & Gloves", category: "COVID-19", contactDetail: "Apple Peduli merupakan NGO yang bergerak di bidang sosial dan kesehatan. Concern saat ini adalah untuk memenuhi perlengkapan tenaga medis antara lain masker, APD, sarung tangan, kacamata, dll. Untuk disalurkan ke RS yang sedang kekurangan perlengkapan tenaga medis.", date: formatter.date(from: "2020/5/18")!, daysLeft: 4, descriptions: "Yuk #BerjuangDariRumah hadapi Corona dengan ikutan donasi masker dan sarung tangan untuk Rumah Sakit rujukan yang sedang kesulitan mendapatkan masker dan sarung tangan untuk menangani pasien positif covid-19. Ini adalah kesempatan kamu bersolidaritas untuk bangsa ini dengan cara dirumah aja dan membantu tim medis untuk tetap terjaga dari Covid-19. #Berjuangdarirumah #hadapicorona", location: "Jakarta Selatan", organizationAddress: "Jl. Kemang Raya No.10, RT.9/RW.1, Bangka, Kec. Mampang Prapatan, Kota Jakarta Selatan 12730", organizationEmail: "contact@applepeduli.id", organizationImage: #imageLiteral(resourceName: "logo6"), organizationName: "Apple Peduli", organizationPhone: "(+62 5194 8414 944)", peopleApplied: 47, requirement: "Requirement :\n- Berjiwa sosial\n- Berdonasi seikhlasnya"),
                    DataPreparation(activityImage: #imageLiteral(resourceName: "card2"), activityName: "Kado untuk Anak Jalanan", category: "Children", contactDetail: "Sahabat Anak merupakan NGO yang bergerak di bidang sosial kemanusiaan. Concern utamanya tertuju pada anak jalanan dan anak yatim piatu. Melihat semakin banyaknya anak jalanan di Kota Kendari khususnya di seputaran kawasan pusat perekonomian seperti pasar ataupun pertokoan yang bekerja pada saat saat sekolah, dimana mereka seharusnya mendapatkan pendidikan yang layak, mendapatkan hak untuk bermain, dan hak-hak anak lainnya tidak diperoleh, namun karena kondisi ekonomi yang tidak memungkinkan maka memaksa mereka untuk memenuhi kebutuhan diri sendiri dan keluarganya. Hal inilah yang memotivasi kami untuk menghimpun dan mewadahi mereka.", date: formatter.date(from: "2020/6/9")!, daysLeft: 7, descriptions: "Kado untuk anak jalanan merupakan program rutin setiap 3 bulan untuk memberikan kado kepada anak jalanan yang telah kami himpun. Saat ini Sahabat Anak telah menghimpun kurang lebih 50 anak jalanan. Kami ingin memberikan rasa keceriaan kepada anak-anak kami ditengah wabah covid-19 dengan memberikan kado surprise untuk mereka.", location: "Jakarta Barat", organizationAddress: "Jl. Kemang Raya No.10, RT.9/RW.1, Bangka, Kec. Mampang Prapatan, Kota Jakarta Selatan 12730", organizationEmail: "contact@sahabatanak.id", organizationImage: #imageLiteral(resourceName: "logo2"), organizationName: "ahabat Anak", organizationPhone: "(+62 2129 8274 944)", peopleApplied: 56, requirement: "Requirement :\n- Berjiwa sosial\n- Memberikan kado yang dibungkus rapi dengan harga minimal 20.000 rupiah\n- Semangat dalam tujuan membantu sesama\n- Mampu menerapkan praktek \"social distancing\" dalam setiap aktivitas memberikan kado")
                ]
                
                for index in 0..<dataArray.count {
                    let newInfoData = VolunteeringInfo(context: self.context)
                    newInfoData.activityImage = dataArray[index].activityImage.pngData()
                    newInfoData.activityName = dataArray[index].activityName
                    newInfoData.category = dataArray[index].category
                    newInfoData.contactDetail = dataArray[index].contactDetail
                    newInfoData.date = dataArray[index].date
                    newInfoData.daysLeft = Int16(dataArray[index].daysLeft)
                    newInfoData.descriptions = dataArray[index].descriptions
                    newInfoData.location = dataArray[index].location
                    newInfoData.organizationAddress = dataArray[index].organizationAddress
                    newInfoData.organizationEmail = dataArray[index].organizationEmail
                    newInfoData.organizationImage = dataArray[index].organizationImage.pngData()
                    newInfoData.organizationName = dataArray[index].organizationName
                    newInfoData.organizationPhone = dataArray[index].organizationPhone
                    newInfoData.peopleApplied = Int32(dataArray[index].peopleApplied)
                    newInfoData.requirement = dataArray[index].requirement
                    
                    saveData()
                }
                
                
            }
        } catch {
            print("Error fetching data from contex, \(error)")
        }
    }
    
    //MARK: - Search
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        let predicate = NSPredicate(format: "activityName CONTAINS[cd] %@", searchBar.text!)
        loadData(predicate: predicate)
        
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        loadData()
    }

}

    
