//
//  Project12_CoreDataApp.swift
//  Project12_CoreData
//
//  Created by admin on 25.08.2022.
//

import SwiftUI

@main
struct Project12_CoreDataApp: App {
    @StateObject private var dataController = DataController()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
