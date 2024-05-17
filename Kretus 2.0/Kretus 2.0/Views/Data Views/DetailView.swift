//
//  DetailView.swift
//  Kretus 2.0
//
//  Created by Nick Wiltshire on 5/16/24.
//

import Foundation
import SwiftUI

struct DetailView: View {
    
    let system: SystemData
    
    @State var relevantPDFs: [PDFUrl] = []

    var body: some View {
        
        NavigationStack {
            VStack {
                Text("System Type: \(system.name)")
                    .font(.headline)
                Text("Description: \(system.descriptionFromUser)")
                Text("Square Feet: \(system.squareFt)")
                Text("System Color: \(system.systemColor)")
                Text("SubType: \(system.subType)")
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
            VStack {
                List {
                    Text("Relevant Documentation")
                    .font(.title)
                    ForEach(relevantPDFs) { pdf in
                        NavigationLink(
                            destination: PDFViewer(url: pdf.url),
                            label: {
                                Text(pdf.title)
                            }
                        )}
                }
            }
            .navigationTitle(system.nameFromUser)
        }
        .onAppear() {
            relevantPDFs = checkForPDFs(system: system)
        }
    }
        
    
    private func checkForPDFs(system: SystemData) -> [PDFUrl] {
        
        var pdfs: [PDFUrl] = []
        
        if (system.name == "UPC 1-Coat") {
            if let pdfUrl = Kretus_2_0App.pdfURLS.first(where: { $0.title == "UPC 1-Coat Installation Guide" }) {
                pdfs.append(pdfUrl)
            }
            if (system.systemColor != "Unpigmented (UPC)") {
                if let pdfUrl = Kretus_2_0App.pdfURLS.first(where: { $0.title == "UPC Colorant Safety Data Sheet" }) {
                    pdfs.append(pdfUrl)
                }
            }
        }
        
        return pdfs
    }
}
