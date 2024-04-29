//
//  CamraDiveApp.swift
//  CamraDive Watch App
//
//  Created by James Cellars on 25/04/24.
//

import SwiftUI

@main
struct CamraDive_Watch_AppApp: App {
    @StateObject var managerClass = ManagerClass()
    
    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(managerClass)
            TimeDataView(stopwatchData: $managerClass.stopwatchData)
                .environmentObject(managerClass)
        }
    }
}
