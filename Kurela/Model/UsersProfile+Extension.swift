//
//  UsersProfile+Extension.swift
//  Kurela
//
//  Created by Feby Lailani on 25/05/20.
//  Copyright © 2020 Group 16 MC2 2020. All rights reserved.
//

import Foundation
import CoreData

extension UsersProfile {
    static func saveProfile(viewContext: NSManagedObjectContext, profileAbout: ProfileAbout, profileMedical: ProfileMedical, profileDocument: ProfileDocument, profileEmergency: ProfileEmergency) {
        do {
            // check & delete previous core data before save new one
            let request: NSFetchRequest<UsersProfile> = UsersProfile.fetchRequest()
            let results = try viewContext.fetch(request)
            if (results.count > 0) {
                for userProfile in results {
                    viewContext.delete(userProfile)
                }
            }
            
            // code to save the datas
           let usersProfile = UsersProfile(context: viewContext)
           usersProfile.name = profileAbout.nameAbout
           usersProfile.email = profileAbout.emailAbout
           usersProfile.birthDay = profileAbout.birthdayAbout
           usersProfile.phone = profileAbout.phoneAbout
           usersProfile.genderIsMale = profileAbout.genderAbout ?? false
           usersProfile.address = profileAbout.addressAbout
           usersProfile.bloodType = profileMedical.bloodTypesMed
           usersProfile.weight = profileMedical.weightMed
           usersProfile.height = profileMedical.heightMed
           usersProfile.insurance = profileMedical.insuranceMed
           usersProfile.allergy = profileMedical.allergyMed
           usersProfile.medicalSheet = profileMedical.medicalSheetMed
           usersProfile.curriculumVitae = profileDocument.curriculumVitaeDoc
           usersProfile.portfolio = profileDocument.portfolioDoc
           usersProfile.emergencyName = profileEmergency.nameEmergency
           usersProfile.relative = profileEmergency.relativeEmergency
           usersProfile.emergencyPhone = profileEmergency.phoneEmergency
           usersProfile.emergencyAddress = profileEmergency.addressEmergency
           print(usersProfile)
            
            // confirm save datas to core data
            try viewContext.save()
        } catch {
            print("ERROR SAVE PROFILE")
        }
    }
    
    static func fetchData(viewContext: NSManagedObjectContext) -> UsersProfile? {        
        let request: NSFetchRequest<UsersProfile> = UsersProfile.fetchRequest()
        do {
            let results = try viewContext.fetch(request)
            if results.count > 0 {
                return results[0]
            } else {
                return nil
            }
        } catch {
            return nil
        }
    }
}

