//
//  ContentView.swift
//  Project12_CoreData
//
//  Created by admin on 25.08.2022.
//

import SwiftUI
import CoreData

enum Predicates: String, CaseIterable {
    case beginsWith = "BEGINSWITH"
    case contains = "CONTAINS"
    case beginsWithIgnoreCase = "BEGINSWITH[c]"
    case containsIgnoreCase = "CONTAINS[c]"
}
enum FilterKey: String, CaseIterable {
    case firstName, lastName
}


struct ContentView: View {
    @Environment(\.managedObjectContext) var moc
    @State private var changePredicate: Predicates = .beginsWithIgnoreCase
    @State private var filterValue = "A"
    @State private var filterKey: FilterKey = .firstName
    @State private var sortBy: FilterKey = .firstName
    
    var body: some View {
        VStack {
            FilteredList(filterKey: filterKey.rawValue, filterValue: filterValue, sortDescriptor: [NSSortDescriptor(key: sortBy.rawValue, ascending: true)], predicate: changePredicate.rawValue) { (singer: Singer) in
                Text("\(singer.wrapperdFirstName) \(singer.wrapperdLastName)")
            }
            VStack(alignment: .center) {
            TextField("Search by lettrs", text: $filterValue)
                    .padding(5)
                    .padding(.horizontal)
                Divider()
            HStack {
                Picker("Change Predicate", selection: $changePredicate) {
                    ForEach(Predicates.allCases, id: \.self) { item in
                        Text(item.rawValue)
                    }
                    
                }
                Divider()
                
                Button("Add example") {
                    let singer1 = Singer(context: moc)
                    singer1.firstName = "Adele"
                    singer1.lastName = "Adkins"
                    
                    let singer2 = Singer(context: moc)
                    singer2.firstName = "Ricky"
                    singer2.lastName = "Martin"
                    
                    let singer3 = Singer(context: moc)
                    singer3.firstName = "Kelly"
                    singer3.lastName = "Klarklon"
                    
                    let singer4 = Singer(context: moc)
                    singer4.firstName = "Olivia"
                    singer4.lastName = "Rodrigo"
                    
                    try? moc.save()
                }
                Divider()
                Menu("Change filters") {
                    
                    Menu("Search in \(filterKey.rawValue)") {
                        Picker("Search in : \(filterKey.rawValue)", selection: $filterKey) {
                            ForEach(FilterKey.allCases, id: \.self) { key in
                                Text(key.rawValue)
                                
                            }
                        }
                        
                    }
                    Menu("Order by the \(sortBy.rawValue)") {
                        Picker("Search in : \(sortBy.rawValue)", selection: $sortBy) {
                            ForEach(FilterKey.allCases, id: \.self) { key in
                                Text(key.rawValue)
                                
                            }
                        
                        }
                    }
                }
            }
            
            }
            .frame(maxWidth: .infinity, maxHeight: 100)
            .padding()
            .background(.ultraThickMaterial)
            .foregroundColor(.secondary)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
