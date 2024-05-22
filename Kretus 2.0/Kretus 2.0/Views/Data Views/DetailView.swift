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
    
    static var pdfURLS: [PDFUrl] = [PDFUrl(url: Bundle.main.url(forResource: "Kretus-Product-Catalog", withExtension: "pdf")!, title: "Product Catalog", group: .general, type: .general),
                                    PDFUrl(url: Bundle.main.url(forResource: "UPC-IG", withExtension: "pdf")!, title: "UPC 1-Coat Installation Guide", group: .upc, type: .ig),
                                    PDFUrl(url: Bundle.main.url(forResource: "UPC-SDS-Colorant", withExtension: "pdf")!, title: "UPC Colorant Safety Data Sheet", group: .upc, type: .sds),
                                    PDFUrl(url: Bundle.main.url(forResource: "UPC-TDS-WC-FC", withExtension: "pdf")!, title: "UPC: WC-FC", group: .upc, type: .tds),
                                    PDFUrl(url: Bundle.main.url(forResource: "UPC-TDS-WC-EZ", withExtension: "pdf")!, title: "UPC: WC-EZ", group: .upc, type: .tds),
                                    PDFUrl(url: Bundle.main.url(forResource: "UPC-TDS-WC-AP", withExtension: "pdf")!, title: "UPC: WC-AP", group: .upc, type: .tds),
                                    PDFUrl(url: Bundle.main.url(forResource: "UPC-TDS-VC-FC", withExtension: "pdf")!, title: "UPC: VC-FC", group: .upc, type: .tds),
                                    PDFUrl(url: Bundle.main.url(forResource: "UPC-TDS-VC-EZ", withExtension: "pdf")!, title: "UPC: VC-EZ", group: .upc, type: .tds),
                                    PDFUrl(url: Bundle.main.url(forResource: "UPC-TDS-VC-AP", withExtension: "pdf")!, title: "UPC: VC-AP", group: .upc, type: .tds),
                                    PDFUrl(url: Bundle.main.url(forResource: "UPC-TDS-TT-FC", withExtension: "pdf")!, title: "UPC: TT-FC", group: .upc, type: .tds),
                                    PDFUrl(url: Bundle.main.url(forResource: "UPC-TDS-TT-EZ", withExtension: "pdf")!, title: "UPC: TT-EZ", group: .upc, type: .tds),
                                    PDFUrl(url: Bundle.main.url(forResource: "UPC-TDS-TT-AP", withExtension: "pdf")!, title: "UPC: TT-AP", group: .upc, type: .tds),
                                    PDFUrl(url: Bundle.main.url(forResource: "UPC-TDS-SL-FC", withExtension: "pdf")!, title: "UPC: SL-FC", group: .upc, type: .tds),
                                    PDFUrl(url: Bundle.main.url(forResource: "UPC-TDS-SL-EZ", withExtension: "pdf")!, title: "UPC: SL-EZ", group: .upc, type: .tds),
                                    PDFUrl(url: Bundle.main.url(forResource: "UPC-TDS-SL-AP", withExtension: "pdf")!, title: "UPC: SL-AP", group: .upc, type: .tds),
                                    PDFUrl(url: Bundle.main.url(forResource: "UPC-TDS-RC-FC", withExtension: "pdf")!, title: "UPC: RC-FC", group: .upc, type: .tds),
                                    PDFUrl(url: Bundle.main.url(forResource: "UPC-TDS-RC-EZ", withExtension: "pdf")!, title: "UPC: RC-EZ", group: .upc, type: .tds),
                                    PDFUrl(url: Bundle.main.url(forResource: "UPC-TDS-RC-AP", withExtension: "pdf")!, title: "UPC: RC-AP", group: .upc, type: .tds),
                                    PDFUrl(url: Bundle.main.url(forResource: "UPC-TDS-MF-FC", withExtension: "pdf")!, title: "UPC: MF-FC", group: .upc, type: .tds),
                                    PDFUrl(url: Bundle.main.url(forResource: "UPC-TDS-MF-EZ", withExtension: "pdf")!, title: "UPC: MF-EZ", group: .upc, type: .tds),
                                    PDFUrl(url: Bundle.main.url(forResource: "UPC-TDS-MF-AP", withExtension: "pdf")!, title: "UPC: MF-AP", group: .upc, type: .tds)]

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
                    ForEach(system.kits, id: \.id) { kitRelationship in
                        VStack {
                            HStack {
                                Text(kitRelationship.kit.id)
                                    .font(.caption)
                                Spacer()
                                Text(kitRelationship.kit.name)
                                    .font(.caption)
                                Spacer()
                                Text(kitRelationship.kit.quantity.description)
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
        var addresses: [String] = []
        var baseSpeed = ""
        var tempSubType = ""
        var tempSpeed = ""
        let subType = String(system.subType.prefix(2))
        
        appendIfNotExists(string: "UPC 1-Coat Installation Guide", to: &addresses)
        appendIfNotExists(string: "UPC Colorant Safety Data Sheet", to: &addresses)
        
        if (system.name == "UPC 1-Coat") {
            for coat in system.coats {
                
                tempSubType = String(coat.subType.prefix(2))
                    
                tempSpeed = String(coat.speed.prefix(2))
                
                appendIfNotExists(string: "UPC: \(tempSubType)-\(tempSpeed)", to: &addresses)
                
            }
            
            for address in addresses {
                if let pdfUrl = DetailView.pdfURLS.first(where: { $0.title == address }) {
                    pdfs.append(pdfUrl)
                }
            }
        }
        
        return pdfs
    }
    
    func appendIfNotExists(string: String, to array: inout [String]) {
      if !array.contains(string) {
        array.append(string)
      }
    }
    
}
