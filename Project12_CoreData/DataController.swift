//
//  DataController.swift
//  Project12_CoreData
//
//  Created by admin on 25.08.2022.
//

import Foundation
import CoreData

class DataController: ObservableObject {
    let container = NSPersistentContainer(name: "CoreDataProject")
    
    init() {
        container.loadPersistentStores { description, error in
            if let error = error {
                print(error.localizedDescription)
            }
            self.container.viewContext.mergePolicy = NSMergePolicy.mergeByPropertyObjectTrump
        }
    }
}
