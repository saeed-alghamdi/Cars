//
//  DataPersistanceController.swift
//  Cars
//
//  Created by RMP on 26/11/1447 AH.
//

import Foundation
import CoreData


/*
 
 STEPS TO CREATE COREDATA INTO SWIFTUI
 1- create data model file
 2- inside data model file create entity with some proprites on it
 3- create empty swift file
 4- create class inside empty swift file the class perform ObservableObject protocol
 5- create NSPersistentContainer constant that hold the data model file name
 6-
 
 
 
 
 */

class FavoriteDataPersistanceController: ObservableObject {
    let controller = NSPersistentContainer(name: "Favorite")
    
    init() {
        
        controller.loadPersistentStores { description, error in
            if let error = error {
                fatalError(error.localizedDescription)
            }
        }
        
    }
}
