//
//  UIViewController+Extension.swift
//  Kurela
//
//  Created by Feby Lailani on 25/05/20.
//  Copyright © 2020 Group 16 MC2 2020. All rights reserved.
//

import Foundation
import CoreData
import UIKit

/**
    This is an extension to get viewContext to access core data more easier.
     U can call getViewContext in any screen to access the coreData model /class
 */
extension UIViewController {
    func getViewContext() -> NSManagedObjectContext {
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        let container = appDelegate?.persistentContainer
        return container!.viewContext
    }
}
