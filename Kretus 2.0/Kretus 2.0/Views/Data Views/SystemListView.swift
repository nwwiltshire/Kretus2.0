//
//  SystemListView.swift
//  Kretus 2.0
//
//  Created by Nick Wiltshire on 5/16/24.
//

import SwiftUI
import SwiftData

struct SystemListView: View {
    @Query private var systems: [SystemData]
    @State var selectedSystem: SystemData?
    @Environment(\.modelContext) private var context

    var body: some View {
        NavigationStack {
            if !systems.isEmpty {
                let groupedSystems = Dictionary(grouping: systems, by: { $0.name })
                List {
                    ForEach(groupedSystems.keys.sorted(), id: \.self) { key in
                        Section(header: Text(key)) {
                            ForEach(groupedSystems[key]!, id: \.id) { system in
                                NavigationLink(
                                    destination: DetailView(system: system),
                                    label: {
                                        Text(system.nameFromUser)
                                    }
                                )
                            }
                        }
                    }
                    .onDelete(perform: removeSystem)
                }
            } else {
                Text("No saved systems yet!")
            }

        }
    }
    
    
    private func removeSystem(at indexSet: IndexSet) {
        for index in indexSet {
            let systemsToDelete = systems[index]
            context.delete(systemsToDelete)
        }
    }
}

struct SystemListView_Previews: PreviewProvider {
  static var previews: some View {
    SystemListView()
  }
}
