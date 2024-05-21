//
//  DocumentationView.swift
//  Kretus 2.0
//
//  Created by Nick Wiltshire on 1/31/24.
//

import SwiftUI
import PDFKit
import Foundation


struct InformationView: View {
    
    @State var hierarchy: [PDFUrl.PDFGroup: [PDFUrl.PDFType: [PDFUrl]]] = [:]
    
    let groupedByGroup = Dictionary(grouping: DetailView.pdfURLS, by: { $0.group })
    
    var body: some View {
        NavigationStack {
            HStack {
                Text("View official Kretus documentation here.")
                    .multilineTextAlignment(.leading)
                    .font(.subheadline)
                    .padding()
                
                Spacer()
            }
            List {
                ForEach(hierarchy.keys.sorted(), id: \.self) { group in
                    Section(header: Text(group.description)) {
                        ForEach(hierarchy[group]!.keys.sorted(), id: \.self) { type in
                            NavigationLink(destination: PDFTypeView(pdfUrls: hierarchy[group]![type]!)) {
                                Text(type.description)
                            }
                        }
                    }
                }
            }
            .navigationTitle("Information")
        }
        .onAppear() {
            
            for (group, urls) in groupedByGroup {
                let groupedByType = Dictionary(grouping: urls, by: { $0.type })
                hierarchy[group] = groupedByType
            }
        }
    }
}

struct PDFTypeView: View {
    let pdfUrls: [PDFUrl]

    var body: some View {
        List {
            if (pdfUrls[0].type.description != "General Documentation") {
                Text("\(pdfUrls[0].type.description)")
                    .font(.title)
                    .frame(alignment: .leading)
                    .padding()
            }
            ForEach(pdfUrls, id: \.id) { pdfUrl in
                NavigationLink(destination: PDFViewer(url: pdfUrl.url)
                    .navigationTitle("\(pdfUrl.title)")) {
                    Text(pdfUrl.title)
                }
            }
            .navigationBarTitle(pdfUrls[0].group.description)
        }
    }
}

struct InformationView_Previews: PreviewProvider {
    static var previews: some View {
        InformationView()
    }
}
