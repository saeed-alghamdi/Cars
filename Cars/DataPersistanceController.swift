//
//  DataPersistanceController.swift
//  Cars
//
//  Created by RMP on 26/11/1447 AH.
//

import Foundation
import CoreData


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
