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
            if (!systems.isEmpty) {
                List {
                    ForEach(systems) { system in
                        NavigationLink(
                            destination: DetailView(system: system),
                            label: {
                                Text(system.nameFromUser)
                            }
                        )}
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

struct DetailView: View {
  let system: SystemData

    var body: some View {
        NavigationStack {
            VStack {
                Text("System Type: \(system.name)")
                    .font(.headline)
                Text("Description: \(system.descriptionFromUser)")
                Text("Square Feet: \(system.squareFt)")
                Text("System Color: \(system.systemColor)")
                VStack {
                    Text("\nTotal Kits Needed:")
                    HStack {
                        Text("ID")
                        Spacer()
                        Text("Name")
                        Spacer()
                        Text("Quantity")
                    }
                    ForEach(system.kitsNeeded, id: \.id) { kit in
                        VStack {
                            HStack {
                                Text(kit.id)
                                    .font(.caption)
                                Spacer()
                                Text(kit.name)
                                    .font(.caption)
                                Spacer()
                                Text(kit.quantity.description)
                                    .font(.caption)
                            }
                        }
                    }
                }
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color(system.viewColor).opacity(0.25))
                )
            }
            .navigationTitle(system.nameFromUser)
        }
    }
}

struct SystemListView_Previews: PreviewProvider {
  static var previews: some View {
    SystemListView()
  }
}
