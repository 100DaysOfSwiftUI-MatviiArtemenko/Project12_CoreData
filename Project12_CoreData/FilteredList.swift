//
//  FilteredList.swift
//  Project12_CoreData
//
//  Created by admin on 25.08.2022.
//

import SwiftUI
import CoreData

struct FilteredList<T: NSManagedObject, Content: View>: View {
    @FetchRequest var fetchRequest: FetchedResults<T>
    let content: (T) -> Content
    var body: some View {
        List {
            ForEach(fetchRequest, id: \.self) { item in
                self.content(item)
            }
        }
    }
    init(filterKey: String, filterValue: String, sortDescriptor: [NSSortDescriptor], predicate: String, @ViewBuilder content: @escaping (T) -> Content) {
        if predicate != "All" {
            _fetchRequest = FetchRequest<T>(sortDescriptors: sortDescriptor, predicate: NSPredicate(format: "%K \(predicate) %@", filterKey, filterValue))
        } else {
            _fetchRequest = FetchRequest<T>(sortDescriptors: sortDescriptor)

        }
        self.content = content
    }
}

