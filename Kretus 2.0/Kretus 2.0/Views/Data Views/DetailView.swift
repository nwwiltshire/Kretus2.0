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
        
        if (system.name == "UPC 1-Coat") {
            if let pdfUrl = DetailView.pdfURLS.first(where: { $0.title == "UPC 1-Coat Installation Guide" }) {
                pdfs.append(pdfUrl)
            }
            if (system.systemColor != "Unpigmented (UPC)") {
                if let pdfUrl = DetailView.pdfURLS.first(where: { $0.title == "UPC Colorant Safety Data Sheet" }) {
                    pdfs.append(pdfUrl)
                }
            }
            
            let baseSpeed = system.speeds[0]
            
            if (system.subType == "RC (Roll Coat)") {
                
                if let pdfUrl = DetailView.pdfURLS.first(where: { $0.title == "UPC: RC-\(baseSpeed)" }) {
                    pdfs.append(pdfUrl)
                }
                
            } else if (system.subType == "TT (Trowel Applied)") {
                
                if let pdfUrl = DetailView.pdfURLS.first(where: { $0.title == "UPC: TT-\(baseSpeed)" }) {
                    pdfs.append(pdfUrl)
                }
                
            } else if (system.subType == "SL (Self Leveling)") {
                
                if let pdfUrl = DetailView.pdfURLS.first(where: { $0.title == "UPC: SL-\(baseSpeed)" }) {
                    pdfs.append(pdfUrl)
                }
                
            } else if (system.subType == "MF (Medium Fill SL)") {
                
                if let pdfUrl = DetailView.pdfURLS.first(where: { $0.title == "UPC: MF-\(baseSpeed)" }) {
                    pdfs.append(pdfUrl)
                }
                
            }
            
            if (system.speeds[1..<system.speeds.count].contains("EZ")) {
                if let pdfUrl = DetailView.pdfURLS.first(where: { $0.title == "UPC: RC-EZ" }) {
                    pdfs.append(pdfUrl)
                }
            }
            
            if (system.speeds[1..<system.speeds.count].contains("AP")) {
                if let pdfUrl = DetailView.pdfURLS.first(where: { $0.title == "UPC: RC-AP" }) {
                    pdfs.append(pdfUrl)
                }
            }
            
            if (system.speeds[1..<system.speeds.count].contains("FC")) {
                if let pdfUrl = DetailView.pdfURLS.first(where: { $0.title == "UPC: RC-FC" }) {
                    pdfs.append(pdfUrl)
                }
            }
        }
        
        return pdfs
    }
}
