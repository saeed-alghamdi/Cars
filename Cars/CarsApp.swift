//
//  CarsApp.swift
//  Cars
//
//  Created by RMP on 26/06/1444 AH.
//

import SwiftUI

@main
struct CarsApp: App {
    
    @StateObject var dataController = FavoriteDataPersistanceController()
    @AppStorage("showingOnBoarding") var showingOnBoarding = true
    
    var body: some Scene {
        WindowGroup {
            switch showingOnBoarding {
                case true:
                    OnBoardTabView()
                default:
                AllBrandsView().environment(\.managedObjectContext, dataController.controller.viewContext)
            }
        }
    }
}
