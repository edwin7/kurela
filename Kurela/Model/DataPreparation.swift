//
//  DataPreparation.swift
//  Kurela
//
//  Created by M Habib Ali Akbar on 16/05/20.
//  Copyright © 2020 Group 16 MC2 2020. All rights reserved.
//

import Foundation
import UIKit
import CoreData

struct DataPreparation {
    
    let activityImage: UIImage
    let activityImage2: UIImage
    let activityImage3: UIImage
    let activityVideoUrl: String
    let activityName: String
    let category: String
    let contactDetail: String
    let date: Date
    let daysLeft: Int
    let descriptions: String
    let location: String
    let organizationAddress: String
    let organizationEmail: String
    let organizationImage: UIImage
    let organizationName: String
    let organizationPhone: String
    let organizationWebsite: String
    let peopleApplied: Int
    let requirement: String
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    static func saveFirstData() {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

           let request: NSFetchRequest<VolunteeringInfo> = VolunteeringInfo.fetchRequest()
           do {
               let data = try context.fetch(request)
               if data.count == 0 {
                   let formatter = DateFormatter()
                   formatter.dateFormat = "yyyy/MM/dd"
                   
                   let dataArray = [
                       DataPreparation(activityImage: #imageLiteral(resourceName: "card3"),
                                       activityImage2: #imageLiteral(resourceName: "Berbagi Sembako 2"),
                                       activityImage3: #imageLiteral(resourceName: "Berbagi Sembako 3"),
                                       activityVideoUrl: "https://assets.mixkit.co/videos/preview/mixkit-elegant-casinos-in-monaco-4300-large.mp4",

                                       activityName: "Berbagi Sembako untuk Driver Online",
                                       category: "Donation",
                                       contactDetail: "WHO merupakan organisasi dunia yang berfokus pada hal yang mempunyai impact di kesehatan. Untuk mengenal komunitas kami lebih jauh, Anda dapat mengunjungi alawat web diatas.",
                                       date: formatter.date(from: "2020/5/29")!,
                                       daysLeft: 4,
                                       descriptions: """
                                           Dalam bagian dari solusi menghadapi krisis Pandemic Covid-19, program ini merupakan program berbagi 5kg beras kepada driver online di Sumatera Barat khususnya untuk driver yang sedang kesulitan untuk memenuhi kebutuhan sehari-hari.

                                           Tugas Relawan:

                                           - Menyiapkan paket beras 5kg (dana dari organisasi kami)
                                           - Melaksanakan kegiatan pembagian paket beras kepada penerima manfaat yaitu driver online
                                           - Mendokumentasikan berupa foto dan video serta melaporkan kegiatan pembagian paket beras.

                                           Perlengkapan Relawan:

                                           - Kamera (HP)
                                           - Papan nama (design akan disiapkan)

                                           Kondisi Lapangan:

                                           Mayoritas driver online menunggu order di tempat-tempat umum misalnya mall, apartemen dimana daerah tersebut cukup ramai. Oleh karena itu relawan diharapkan menerapkan protokol kesehatan ketika membagikan sembako. Masker dan sarung akan kami bagikan di lokasi titik kumpul

                                           """,
                                       location: "Sumatera Barat",
                                       organizationAddress: "Jl. Prof. Dr. Hamka No.2A, Air Tawar Tim., Kec. Padang Utara, Kota Padang, Sumatera Barat 25173",
                                       organizationEmail: "-",
                                       organizationImage: #imageLiteral(resourceName: "logo3"),
                                       organizationName: "World Health Organization",
                                       organizationPhone: "Mega (0869-3645-3733-2344)",
                                       organizationWebsite: "https://www.who.int/",
                                       peopleApplied: 115,
                                       requirement: """
                                           Adapun kriteria relawan yang kami butuhkan:

                                           - Berjiwa sosial
                                           - Jujur
                                           - Supel
                                           - Dapat dipercaya (amanah)
                                           - Semangat dalam tujuan membantu sesama
                                           - Mampu menerapkan praktek \"social distancing\" dalam setiap aktivitas penyaluran bantuan
                                           """),
                       
                       DataPreparation(activityImage: #imageLiteral(resourceName: "card1"),
                                       activityImage2: #imageLiteral(resourceName: "Gunung Merapi 2"),
                                       activityImage3: #imageLiteral(resourceName: "Gunung Merapi 3"),
                                       activityVideoUrl: "https://assets.mixkit.co/videos/preview/mixkit-active-volcano-smoking-during-the-starry-night-4428-large.mp4",
                                       activityName: "Relawan Siaga Erupsi Gunung Merapi",
                                       category: "Disaster",
                                       contactDetail: "BNPB (Badan Nasional Penanggulangan Bencana) merupakan Lembaga yang memberikan pedoman dan pengarahan terhadap usaha penanggulangan bencana yang mencakup pencegahan bencana, penanganan keadaan darurat bencana, rehabilitasi, dan rekonstruksi secara adil dan setara",
                                       date: formatter.date(from: "2020/8/17")!,
                                       daysLeft: 3,
                                       descriptions: """
                                           Sudah kembali menjadi fitrahnya bahwa hidup di Indonesia akan dikelilingi oleh gunung berapi aktif. Akhir-akhir ini aktivitas gunang merapi belum menunjukkan untuk mereda.

                                           Belajar dari pengalaman meletusnya Gunung Merapi tahun 1994 dimana terdapat korban jiwa, sejak tanggal 14 Agustus 2020 proses pengungsian sudah dimulai untuk para warga yang tinggal di radius 2-5 km dari kawah gunung api.

                                           Sekitar kurang lebih 1000 warga saat ini berkumpul di tenda pengungsian.

                                           Tugas Relawan:

                                           Kegiatan relawan saat ini memantau aktivitas Gunung Merapi dan memberikan informasi serta menjalankan proses evakusi kepada warga sekitar apabila terjadi erupsi. Selain itu relawan juga menyiapkan dapur umum dan membangunkan tenda pengungsian.

                                           Perlengkapan relawan:

                                           Persediaan logistik (makanan dan air minum)
                                           lampu senter beserta baterai cadangan
                                           uang tunai secukupnya
                                           obat-obatan
                                           masker jenis N95
                                           kacamata

                                           Kondisi lapangan:

                                           Saat ini kami mempunyai basecamp dalam radius 10km dari kawah gunung api. Dimana terdapat tempat pengungsian sementara untuk warga yang tinggal berada di radius 2-5 km dari kawah gunung api. Kini warga tersebut tingga di tenda pengungsian sederhana. Tempat pengungsian saat ini cukup padat dan minum air bersih. Selain itu tempat sanitasi juga masih minim.

                                           Informasi tambahan:

                                           Bahaya letusan gunung api dapat berupa awan panas, lontaran material (pijar), hujan abu lebat, lava, gas racun dan banjir lahar.
                                           """,
                                       location: "DIY Yogyakarta",
                                       organizationAddress: "Graha BNPB - Jl. Pramuka Kav.38 Jakarta Timur 13120",
                                       organizationEmail: "contact@bnpb.go.id",
                                       organizationImage: #imageLiteral(resourceName: "logo1"),
                                       organizationName: "Badan National Penanggulangan Bencana",
                                       organizationPhone: "Pusdalop BNPB (+62 21 29827444)",
                                       organizationWebsite: "https://bnpb.go.id/",
                                       peopleApplied: 89,
                                       requirement: """
                                           Persyaratan:

                                           - Telah berumur lebih dari 18 tahun
                                           - Sehat secara fisik dan mental
                                           - Tidak mudah menyerah
                                           - Siap untuk berkontribusi lebih
                                           - Memahami penggunaan alat perlindungan diri
                                           - Memahami skenario evakuasi jika terjadi erupsi
                                           """),
                       
                       DataPreparation(activityImage: #imageLiteral(resourceName: "Donasi Masker"),
                                       activityImage2: #imageLiteral(resourceName: "Donas Masker 2"),
                                       activityImage3: #imageLiteral(resourceName: "Donasi Masker 3"),
                                       activityVideoUrl: "https://assets.mixkit.co/videos/preview/mixkit-scientist-wearing-masks-and-gloves-in-a-laboratory-4707-large.mp4",
                                       activityName: "Donasi Masker & Gloves",
                                       category: "COVID-19",
                                       contactDetail: "Apple Peduli merupakan NGO yang bergerak di bidang sosial dan kesehatan. Concern saat ini adalah untuk memenuhi perlengkapan tenaga medis antara lain masker, APD, sarung tangan, kacamata, dll. Untuk disalurkan ke RS yang sedang kekurangan perlengkapan tenaga medis.",
                                       date: formatter.date(from: "2020/5/18")!,
                                       daysLeft: 4,
                                       descriptions: """
                                           Yuk #BerjuangDariRumah hadapi Corona dengan ikutan donasi masker dan sarung tangan untuk Rumah Sakit rujukan yang sedang kesulitan mendapatkan masker dan sarung tangan untuk menangani pasien positif covid-19. Ini adalah kesempatan kamu bersolidaritas untuk bangsa ini dengan cara dirumah aja dan membantu tim medis untuk tetap terjaga dari Covid-19. #Berjuangdarirumah #hadapicorona

                                           Langkah donasi:

                                           Donasi dapat dilakukan dengan nominal seikhlasnya. Donasi dapat dikirimkan ke nomor rekening dibawah ini.
                                           Mandiri : (008) 1234 5678 9098 7654 321
                                           BNI : (009) 1234 5678 9098 7654 321
                                           BRI : (002) 1234 5678 9098 7654 321

                                           Informasi tambahan:

                                           Donasi yang terkumpul akan dibelikan masker dan sarung tangan yang kemudian di salurkan ke RS Mitra Abadi, RS Mega Jaya, RS Duren Runtuh, RS Yuk Sehat Yuk yang merupakan Rumah Sakit rujukan dari Pemerintah untuk pasien covid-19.
                                           """,
                                       location: "Jakarta Selatan",
                                       organizationAddress: "Jl. Kemang Raya No.10, RT.9/RW.1, Bangka, Kec. Mampang Prapatan, Kota Jakarta Selatan 12730",
                                       organizationEmail: "contact@applepeduli.id",
                                       organizationImage: #imageLiteral(resourceName: "logo6"),
                                       organizationName: "Apple Peduli",
                                       organizationPhone: "(+62 5194 8414 944)",
                                       organizationWebsite: "-",
                                       peopleApplied: 47,
                                       requirement: """
                                           Persyaratan:

                                           - Berjiwa sosial
                                           - Berdonasi seikhlasnya
                                           """),
                       
                       DataPreparation(activityImage: #imageLiteral(resourceName: "card2"),
                                       activityImage2: #imageLiteral(resourceName: "Kado anak Jalanan 2"),
                                       activityImage3: #imageLiteral(resourceName: "Kado anak Jalanan 3"),
                                       activityVideoUrl: "https://assets.mixkit.co/videos/preview/mixkit-little-girl-crying-4543-large.mp4",
                                       activityName: "Kado untuk Anak Jalanan",
                                       category: "Children",
                                       contactDetail: "Sahabat Anak merupakan NGO yang bergerak di bidang sosial kemanusiaan. Concern utamanya tertuju pada anak jalanan dan anak yatim piatu. Melihat semakin banyaknya anak jalanan di Kota Kendari khususnya di seputaran kawasan pusat perekonomian seperti pasar ataupun pertokoan yang bekerja pada saat saat sekolah, dimana mereka seharusnya mendapatkan pendidikan yang layak, mendapatkan hak untuk bermain, dan hak-hak anak lainnya tidak diperoleh, namun karena kondisi ekonomi yang tidak memungkinkan maka memaksa mereka untuk memenuhi kebutuhan diri sendiri dan keluarganya. Hal inilah yang memotivasi kami untuk menghimpun dan mewadahi mereka.",
                                       date: formatter.date(from: "2020/6/9")!,
                                       daysLeft: 7,
                                       descriptions: "Kado untuk anak jalanan merupakan program rutin setiap 3 bulan untuk memberikan kado kepada anak jalanan yang telah kami himpun. Saat ini Sahabat Anak telah menghimpun kurang lebih 50 anak jalanan. Kami ingin memberikan rasa keceriaan kepada anak-anak kami ditengah wabah covid-19 dengan memberikan kado surprise untuk mereka.",
                                       location: "Jakarta Barat",
                                       organizationAddress: "Jl. Kemang Raya No.10, RT.9/RW.1, Bangka, Kec. Mampang Prapatan, Kota Jakarta Selatan 12730",
                                       organizationEmail: "info@sahabatanak.com",
                                       organizationImage: #imageLiteral(resourceName: "logo2"),
                                       organizationName: "Sahabat Anak",
                                       organizationPhone: "(+62 21 3918505)",
                                       organizationWebsite: "https://sahabatanak.org/",
                                       peopleApplied: 56,
                                       requirement: """
                                           Persyaratan:

                                           - Berjiwa sosial
                                           - Memberikan kado yang dibungkus rapi dengan harga minimal 20.000 rupiah
                                           - Semangat dalam tujuan membantu sesama
                                           - Mampu menerapkan praktek "social distancing" dalam setiap aktivitas memberikan kado
                                           """),
                       DataPreparation(activityImage: #imageLiteral(resourceName: "Sosialisasi Huruf 1"),
                                       activityImage2: #imageLiteral(resourceName: "Sosialisasi Huruf 2"),
                                       activityImage3: #imageLiteral(resourceName: "Sosialisasi Huruf 3"),
                                       activityVideoUrl: "https://assets.mixkit.co/videos/preview/mixkit-boy-with-face-mask-coughs-and-rubs-his-eyes-4799-large.mp4",
                                       activityName: "Sosialisasi Huruf Braille",
                                       category: "Disable",
                                       contactDetail: "",
                                       date: formatter.date(from: "2020/6/30")!,
                                       daysLeft: 8,
                                       descriptions: """
                                           Setiap anak memiliki hak yang sama dalam memperoleh pendidikan, dan itu tidak
                                           terbatas hanya untuk anak reguler. Anak-anak dengan hambatan penglihatan yang
                                           menggunakan media baca tulis dengan huruf Braille juga memiliki hak yang sama untuk
                                           mengenyam pendidikan seperti yang didapatkan oleh anak-anak reguler.

                                           Pendidikan inklusif memberikan hak pendidikan yang sama antara anak reguler dan anak
                                           berkebutuhan khusus untuk menerima hak pendidikan sesuai dengan kondisi dan kemam
                                           puan masing-masing anak.
                                           
                                           Tulisan Braille dikembangkan sebagai media baca dan tulis bagi anak-anak dengan
                                           hambatan penglihatan yang memiliki kesulitan membaca dan menulis dengan tulisan
                                           awas.

                                           Tulisan Braille memiliki karakteristik titik-titik timbul, sehingga dapat diraba oleh siswa dengan hambatan penglihatan untuk dapat diketahui maknanya.
                                           
                                           Tugas relawan:

                                           - mengajarkan cara membaca dasar menggunakan huruf braille kepada 3 ABK (anak berkebutuhan khusus)
                                           - memberikan ujian singkat mengenai huruf braille
                                           """,
                                       location: "Maluku Utara",
                                       organizationAddress: "Jln. Pengabdian No. 1 Porniti Kota Jailolo 97752",
                                       organizationEmail: "contact@peduliabk.id",
                                       organizationImage: #imageLiteral(resourceName: "logo5"),
                                       organizationName: "Payung Pantai",
                                       organizationPhone: "(+62 5194 2164 984)",
                                       organizationWebsite: "-",
                                       peopleApplied: 23,
                                       requirement: """
                                           Persyaratan:

                                           - Usia lebih dari 18 tahun
                                           - Memahami cara mengajar huruf braille
                                           - Semangat membantu ABK
                                           - Sabar
                                           """),
                       
                       DataPreparation(activityImage: #imageLiteral(resourceName: "Donor Darah untuk Dinda 1"),
                                     activityImage2: #imageLiteral(resourceName: "Donor Darah untuk Dinda 2"),
                                     activityImage3: #imageLiteral(resourceName: "Donor Darah untuk Dinda 3"),
                                     activityVideoUrl: "https://dm0qx8t0i9gc9.cloudfront.net/watermarks/video/qmraJpx/volunteers-making-blood-donation-in-hospital_ejc_xpjf__ffd8c611a09510ab070eb4545ef40c63__P360.mp4",
                                     activityName: "Donor Darah untuk Dinda",
                                     category: "Donation",
                                     contactDetail: "",
                                     date: formatter.date(from: "2020/6/15")!,
                                     daysLeft: 1,
                                     descriptions: """
                                         Adek kita Dinda sedang dalam masa kritis. Dinda sedang membutuhkan banyak darah AB. Mari kita mulai aksi baikmu dengan mendonorkan darahmu kepada Adek Dinda. Setetes darahmu akan memberikan manfaat yang sangat berarti untuk menyelamatkan Adek Dinda.
                                         
                                         Tugas Relawan:

                                         Relawan donor darah akan bertugas untuk mendonorkan darahnya
                                         
                                         Perlengkapan Relawan:

                                         - Kondisi fisik yang prima
                                         - Sarapan dalam melakukan kegiatan donor darah
                                         """,
                                     location: "Kalimantan Timur",
                                     organizationAddress: "Jl. Palang Merah No.1 Komp. RSU Samarinda Kalimantan Timur 75123",
                                     organizationEmail: "hrd@pmi.or.id",
                                     organizationImage: #imageLiteral(resourceName: "Donor Darah untuk Dinda Logo"),
                                     organizationName: "Palang Merah Indonesia",
                                     organizationPhone: "(+62 021 7992325)",
                                     organizationWebsite: "http://www.pmi.or.id/",
                                     peopleApplied: 12,
                                     requirement: """
                                         Persyaratan:

                                         - Berusia lebih dari 18 tahun
                                         - Sehat fisik dan rohani
                                         - Tidak memiliki riwayat penyakit kronis
                                         - Memiliki golongan darah AB
                                         - Memenuhi syarat medis yang sudah ditentukan oleh Palang Merah Indonesia
                                         - Makan sebelum melakukan kegiatan donor darah
                                         - Siap untuk melakukan kegiatan donor darah
                                         """),
                       
                           DataPreparation(activityImage: #imageLiteral(resourceName: "Donasi APD 1"),
                                           activityImage2: #imageLiteral(resourceName: "Donasi APD 2"),
                                           activityImage3: #imageLiteral(resourceName: "Donasi APD 3"),
                                           activityVideoUrl: "https://st3.depositphotos.com/11169126/36091/v/600/depositphotos_360913558-stock-video-portrait-of-a-male-doctor.mp4",
                                           activityName: "Donasi APD & Disinfektan",
                                           category: "COVID-19",
                                           contactDetail: "Apple Peduli merupakan NGO yang bergerak di bidang sosial dan kesehatan. Concern saat ini adalah untuk memenuhi perlengkapan tenaga medis antara lain masker, APD, sarung tangan, kacamata, dll. Untuk disalurkan ke RS yang sedang kekurangan perlengkapan tenaga medis.",
                                           date: formatter.date(from: "2020/5/15")!,
                                           daysLeft: 9,
                                           descriptions: """
                                               Yuk #BerjuangDariRumah hadapi Corona dengan ikutan donasi APD dan disinfektan untuk Rumah Sakit rujukan yang sedang kesulitan mendapatkan APD dan disinfektan untuk menangani pasien positif covid-19. Ini adalah kesempatan kamu bersolidaritas untuk bangsa ini dengan cara dirumah aja dan membantu tim medis untuk tetap terjaga dari Covid-19.  #Berjuangdarirumah #hadapicorona
                                               
                                               Langkah donasi:

                                               Donasi dapat dilakukan dengan nominal seikhlasnya. Donasi dapat dikirimkan ke nomor rekening dibawah ini.
                                               Mandiri : (008) 1234 5678 9098 7654 321
                                               BNI : (009) 1234 5678 9098 7654 321
                                               BRI : (002) 1234 5678 9098 7654 321
                                               
                                               Informasi tambahan:

                                               Donasi yang terkumpul akan dibelikan APD (Alat Pelindung Diri) dan disinfektan yang kemudian di salurkan ke RS Kali Adem, RS Kita Semua, RS Bunga Biru dan RS Peduli Sahabat yang merupakan Rumah Sakit dengan pasien covid terbanyak.
                                               """,
                                           location: "Jakarta Selatan",
                                           organizationAddress: "Jl. Kemang Raya No.10, RT.9/RW.1, Bangka, Kec. Mampang Prapatan, Kota Jakarta Selatan 12730",
                                           organizationEmail: "contact@applepeduli.id",
                                           organizationImage: #imageLiteral(resourceName: "Donasi APD Logo"),
                                           organizationName: "Apple Peduli",
                                           organizationPhone: "(+62 5194 8414 944)",
                                           organizationWebsite: "-",
                                           peopleApplied: 147,
                                           requirement: """
                                               Persyaratan:

                                               - Berjiwa sosial
                                               - Berdonasi seikhlasnya
                                               """),
                           DataPreparation(activityImage: #imageLiteral(resourceName: "Pelatihan Internet 1"),
                                           activityImage2: #imageLiteral(resourceName: "Pelatihan Internet 2"),
                                           activityImage3: #imageLiteral(resourceName: "Pelatihan Internet 3"),
                                           activityVideoUrl: "https://depositphotos.com/69102873/stock-video-african-lady-teaching-a-village.html",
                                           activityName: "Relawan Pelatihan Internet untuk Desa Kapak",
                                           category: "Education",
                                           contactDetail: "",
                                           date: formatter.date(from: "2020/5/29")!,
                                           daysLeft: 10,
                                           descriptions: """
                                               Minimnya fasilitas jaringan internet dan listrik bukan berarti menutup diri dari pembelaran berbasis TIK. Penggunaan komputer dan internet sudah bisa dirasakan oleh masyarakat sekalipun di daerah terpencil. Masyarakat di pedalaman, khususnya di tempat saya mengajar, salah satu daerah terpencil di Papua Nugini. Banyak yang memiliki ketertarikan akan penggunaan internet, karena dirasa juga bisa lebih banyak informasi yang didapat serta lebih mudah dalam menunjang segala aspek, salah satunya pendidikan.
                                               
                                               Tugas Relawan:

                                               Memberikan pelatihan komputer dan internet kepada pemuda-pemudi kurang lebih 50 orang di Desa Kapak Rimba selama 7 hari.
                                               
                                               Kondisi Lapangan:

                                               Daerah sosialisasi merupakan daerah perdesaan yang dikelilingi oleh gunung dan hutan. Kemungkinan besar diperlukan jalan kaki sepanjang 3km dari jalan raya. Relawan akan tinggal selama 7 hari di rumah kepala desa.
                                               
                                               Perlengkapan Relawan:

                                               - Persediaan logistik (makanan dan air minum)
                                               - Lampu senter beserta baterai cadangan
                                               - Uang tunai secukupnya
                                               - Obat-obatan
                                               - Sleeping bag
                                               - Tas carrier
                                               """,
                                           location: "Papua Nugini",
                                           organizationAddress: "Waigani Drive, Port Moresby 121 Papua New Guinea",
                                           organizationEmail: "-",
                                           organizationImage: #imageLiteral(resourceName: "Donasi APD Logo"),
                                           organizationName: "WHO",
                                           organizationPhone: "John (0869-3645-3733-2344)",
                                           organizationWebsite: "https://www.who.int/",
                                           peopleApplied: 141,
                                           requirement: """
                                               Persyaratan:

                                               - Berumur lebih dari 18 tahun
                                               - Memiliki fisik dan mental yang sehat
                                               - Mempunyai laptop
                                               - Mampu mengoperasikan komputer
                                               - Memiliki semangat mengajar
                                               - Memiliki jiwa petualanagan
                                               """),
                   ]
                   
                   for index in 0..<dataArray.count {
                       let newInfoData = VolunteeringInfo(context: context)
                       newInfoData.activityImage = dataArray[index].activityImage.pngData()
                       newInfoData.activityImage2 = dataArray[index].activityImage2.pngData()
                       newInfoData.activityImage3 = dataArray[index].activityImage3.pngData()
                       newInfoData.activityVideoUrl = dataArray[index].activityVideoUrl
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
                       newInfoData.organizationWebsite = dataArray[index].organizationWebsite
                       newInfoData.peopleApplied = Int32(dataArray[index].peopleApplied)
                       newInfoData.requirement = dataArray[index].requirement
                       
                       saveData()
                   }
                   
                   
               }
           } catch {
               print("Error fetching data from contex, \(error)")
           }
       }
    
    static func saveData() {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

        
        do {
            try context.save()
        } catch {
            print("Error saving data from context, \(error)")
        }
    }
}


