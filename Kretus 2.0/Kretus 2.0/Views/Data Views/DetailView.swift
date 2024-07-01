//
//  DetailView.swift
//  Kretus 2.0
//
//  Created by Nick Wiltshire on 5/16/24.
//

import Foundation
import SwiftUI
import PDFKit

struct DetailView: View {
    
    let system: SystemData
    
    @State var relevantPDFs: [PDFUrl] = []
    @State private var pdfData: Data? = nil
    @State private var showShareSheet = false
    
    let document = PDFDocument(data: createPDF())
    
    
    static var pdfURLs: [PDFUrl] = [PDFUrl(url: Bundle.main.url(forResource: "Kretus-Product-Catalog", withExtension: "pdf")!, title: "Product Catalog", group: .general, type: .general),
                                    PDFUrl(url: Bundle.main.url(forResource: "Kretus-Systems-Brochure", withExtension: "pdf")!, title: "Systems Brochure", group: .general, type: .brochure),
                                    PDFUrl(url: Bundle.main.url(forResource: "UPC-IG", withExtension: "pdf")!, title: "UPC 1-Coat Installation Guide", group: .upc, type: .ig),
                                    PDFUrl(url: Bundle.main.url(forResource: "UPC-SDS-Colorant", withExtension: "pdf")!, title: "UPC Colorant Safety Data Sheet", group: .upc, type: .sds),
                                    PDFUrl(url: Bundle.main.url(forResource: "UPC-TDS-WC-FC", withExtension: "pdf")!, title: "UPC WC-FC", group: .upc, type: .tds),
                                    PDFUrl(url: Bundle.main.url(forResource: "UPC-TDS-WC-EZ", withExtension: "pdf")!, title: "UPC WC-EZ", group: .upc, type: .tds),
                                    PDFUrl(url: Bundle.main.url(forResource: "UPC-TDS-WC-AP", withExtension: "pdf")!, title: "UPC WC-AP", group: .upc, type: .tds),
                                    PDFUrl(url: Bundle.main.url(forResource: "UPC-TDS-VC-FC", withExtension: "pdf")!, title: "UPC VC-FC", group: .upc, type: .tds),
                                    PDFUrl(url: Bundle.main.url(forResource: "UPC-TDS-VC-EZ", withExtension: "pdf")!, title: "UPC VC-EZ", group: .upc, type: .tds),
                                    PDFUrl(url: Bundle.main.url(forResource: "UPC-TDS-VC-AP", withExtension: "pdf")!, title: "UPC VC-AP", group: .upc, type: .tds),
                                    PDFUrl(url: Bundle.main.url(forResource: "UPC-TDS-TT-FC", withExtension: "pdf")!, title: "UPC TT-FC", group: .upc, type: .tds),
                                    PDFUrl(url: Bundle.main.url(forResource: "UPC-TDS-TT-EZ", withExtension: "pdf")!, title: "UPC TT-EZ", group: .upc, type: .tds),
                                    PDFUrl(url: Bundle.main.url(forResource: "UPC-TDS-TT-AP", withExtension: "pdf")!, title: "UPC TT-AP", group: .upc, type: .tds),
                                    PDFUrl(url: Bundle.main.url(forResource: "UPC-TDS-SL-FC", withExtension: "pdf")!, title: "UPC SL-FC", group: .upc, type: .tds),
                                    PDFUrl(url: Bundle.main.url(forResource: "UPC-TDS-SL-EZ", withExtension: "pdf")!, title: "UPC SL-EZ", group: .upc, type: .tds),
                                    PDFUrl(url: Bundle.main.url(forResource: "UPC-TDS-SL-AP", withExtension: "pdf")!, title: "UPC SL-AP", group: .upc, type: .tds),
                                    PDFUrl(url: Bundle.main.url(forResource: "UPC-TDS-RC-FC", withExtension: "pdf")!, title: "UPC RC-FC", group: .upc, type: .tds),
                                    PDFUrl(url: Bundle.main.url(forResource: "UPC-TDS-RC-EZ", withExtension: "pdf")!, title: "UPC RC-EZ", group: .upc, type: .tds),
                                    PDFUrl(url: Bundle.main.url(forResource: "UPC-TDS-RC-AP", withExtension: "pdf")!, title: "UPC RC-AP", group: .upc, type: .tds),
                                    PDFUrl(url: Bundle.main.url(forResource: "UPC-TDS-MF-FC", withExtension: "pdf")!, title: "UPC MF-FC", group: .upc, type: .tds),
                                    PDFUrl(url: Bundle.main.url(forResource: "UPC-TDS-MF-EZ", withExtension: "pdf")!, title: "UPC MF-EZ", group: .upc, type: .tds),
                                    PDFUrl(url: Bundle.main.url(forResource: "UPC-TDS-MF-AP", withExtension: "pdf")!, title: "UPC MF-AP", group: .upc, type: .tds),
                                    PDFUrl(url: Bundle.main.url(forResource: "SDS-UPC-A-RCTT-SLMF-WCVC", withExtension: "pdf")!, title: "UPC Part A", group: .upc, type: .sds),
                                    PDFUrl(url: Bundle.main.url(forResource: "SDS-UPC-B-RCTT-SLMF-WCVC-AP-EZ-FC", withExtension: "pdf")!, title: "UPC Part B", group: .upc, type: .sds),
                                    PDFUrl(url: Bundle.main.url(forResource: "SDS-UPC-B-RCUVAP", withExtension: "pdf")!, title: "UPC Part B (RCUV)", group: .upc, type: .sds),
                                    PDFUrl(url: Bundle.main.url(forResource: "SDS-UPC-C-RC-TT-SL-MF-WC-VC", withExtension: "pdf")!, title: "UPC Part C", group: .upc, type: .sds),
                                    PDFUrl(url: Bundle.main.url(forResource: "Color-Chip-Brochure", withExtension: "pdf")!, title: "Color Chip Brochure", group: .general, type: .brochure),
                                    PDFUrl(url: Bundle.main.url(forResource: "Color-Chip-Installation-Guide", withExtension: "pdf")!, title: "Color Chip Installation Guide", group: .colorChip, type: .ig),
                                    PDFUrl(url: Bundle.main.url(forResource: "SDS-Poly-Accelerant", withExtension: "pdf")!, title: "Poly Accelerant", group: .pa, type: .sds),
                                    PDFUrl(url: Bundle.main.url(forResource: "SDS-Polyaspartic72-85-A", withExtension: "pdf")!, title: "Polyaspartic Part A (72, 85)", group: .pa, type: .sds),
                                    PDFUrl(url: Bundle.main.url(forResource: "SDS-Polyaspartic92LO-A", withExtension: "pdf")!, title: "Polyaspartic Part A (92 Low Odor)", group: .pa, type: .sds),
                                    PDFUrl(url: Bundle.main.url(forResource: "SDS-Polyaspartic72-85-B", withExtension: "pdf")!, title: "Polyaspartic Part B (72, 85)", group: .pa, type: .sds),
                                    PDFUrl(url: Bundle.main.url(forResource: "SDS-Polyaspartic92LO-B", withExtension: "pdf")!, title: "Polyaspartic Part B (92 Low Odor)", group: .pa, type: .sds),
                                    PDFUrl(url: Bundle.main.url(forResource: "SDS-Power-Cleaner", withExtension: "pdf")!, title: "Power Cleaner", group: .colorChip, type: .sds),
                                    PDFUrl(url: Bundle.main.url(forResource: "SDS-Solvent-Cleaner", withExtension: "pdf")!, title: "Solvent Cleaner", group: .colorChip, type: .sds),
                                    PDFUrl(url: Bundle.main.url(forResource: "SDS-TopShelf-A", withExtension: "pdf")!, title: "Top Shelf Epoxy Part A", group: .ts, type: .sds),
                                    PDFUrl(url: Bundle.main.url(forResource: "SDS-TopShelf-B-Accelerant", withExtension: "pdf")!, title: "Top Shelf Epoxy Part B", group: .ts, type: .sds),
                                    PDFUrl(url: Bundle.main.url(forResource: "TDS-PUHP-GLOSS", withExtension: "pdf")!, title: "Polyurethane HP Gloss", group: .pu, type: .tds),
                                    PDFUrl(url: Bundle.main.url(forResource: "TDS-PUHP-SATIN", withExtension: "pdf")!, title: "Polyurethane HP Satin", group: .pu, type: .tds),
                                    PDFUrl(url: Bundle.main.url(forResource: "TDS-PUHS-EZ", withExtension: "pdf")!, title: "Polyurethane HS EZ", group: .pu, type: .tds),
                                    PDFUrl(url: Bundle.main.url(forResource: "TDS-PUHS-FC", withExtension: "pdf")!, title: "Polyurethane HS FC", group: .pu, type: .tds),
                                    PDFUrl(url: Bundle.main.url(forResource: "TDS-TSE-A-AP", withExtension: "pdf")!, title: "Top Shelf Epoxy A AP", group: .ts, type: .tds),
                                    PDFUrl(url: Bundle.main.url(forResource: "TDS-TSE-A-EZ", withExtension: "pdf")!, title: "Top Shelf Epoxy A EZ", group: .ts, type: .tds),
                                    PDFUrl(url: Bundle.main.url(forResource: "TDS-TSE-A-FAST", withExtension: "pdf")!, title: "Top Shelf Epoxy A FAST", group: .ts, type: .tds),
                                    PDFUrl(url: Bundle.main.url(forResource: "TDS-TSE-A-MVR-EZ", withExtension: "pdf")!, title: "Top Shelf Epoxy A MVR EZ", group: .ts, type: .tds),
                                    PDFUrl(url: Bundle.main.url(forResource: "TDS-TSE-A-MVR-FC", withExtension: "pdf")!, title: "Top Shelf Epoxy A MVR FC", group: .ts, type: .tds),
                                    PDFUrl(url: Bundle.main.url(forResource: "TDS-TSE-A-TH", withExtension: "pdf")!, title: "Top Shelf Epoxy A TH", group: .ts, type: .tds),
                                    PDFUrl(url: Bundle.main.url(forResource: "TDS-TSE-CR-FAST", withExtension: "pdf")!, title: "Top Shelf Epoxy CR FAST", group: .ts, type: .tds),
                                    PDFUrl(url: Bundle.main.url(forResource: "TDS-TSE-CR-MVR-EZ", withExtension: "pdf")!, title: "Top Shelf Epoxy CR MVR EZ", group: .ts, type: .tds),
                                    PDFUrl(url: Bundle.main.url(forResource: "TDS-TSE-CR-MVR-FC", withExtension: "pdf")!, title: "Top Shelf Epoxy CR MVR FC", group: .ts, type: .tds),
                                    PDFUrl(url: Bundle.main.url(forResource: "TDS-PA-72-EZ", withExtension: "pdf")!, title: "Polyaspartic 72 EZ", group: .pa, type: .tds),
                                    PDFUrl(url: Bundle.main.url(forResource: "TDS-PA-72-FAST", withExtension: "pdf")!, title: "Polyaspartic 72 FAST", group: .pa, type: .tds),
                                    PDFUrl(url: Bundle.main.url(forResource: "TDS-PA-85-EZ", withExtension: "pdf")!, title: "Polyaspartic 85 EZ", group: .pa, type: .tds),
                                    PDFUrl(url: Bundle.main.url(forResource: "TDS-PA-85-FAST", withExtension: "pdf")!, title: "Polyaspartic 85 FAST", group: .pa, type: .tds),
                                    PDFUrl(url: Bundle.main.url(forResource: "TDS-PA-92-EZ", withExtension: "pdf")!, title: "Polyaspartic 92 EZ", group: .pa, type: .tds),
                                    PDFUrl(url: Bundle.main.url(forResource: "TDS-PA-92-FAST", withExtension: "pdf")!, title: "Polyaspartic 92 FAST", group: .pa, type: .tds)]

    var body: some View {
        
        NavigationStack {
            ScrollView {
                VStack {
                    ShareLink(item: document!, preview: SharePreview("PDF"))
                    NavigationLink(
                        destination: PDFFileViewer(document: document!),
                        label: {
                            Text("PDF")
                        }
                    )
                    Text("System Type: \(system.name)")
                        .font(.headline)
                    Text("Description: \(system.descriptionFromUser)")
                    Text("Square Feet: \(system.squareFt)")
                    if (system.systemColor != "") {
                        Text("System Color: \(system.systemColor)")
                    }
                    Text("SubType: \(system.subType)")
                    VStack {
                        Text("\nTotal Kits Needed")
                            .font(.headline)
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
                    ForEach(system.coats, id: \.id) { coat in
                        VStack {
                            Text("\(coat.coatType)")
                                .font(.headline)
                            Text("\(coat.coatProduct)")
                            Text("Coverage Rate: \(coat.covRate)")
                            Text("\nTotal Kits Needed:")
                            HStack {
                                Text("ID")
                                Spacer()
                                Text("Name")
                                Spacer()
                                Text("Quantity")
                            }
                            ForEach(coat.kits, id: \.id) { coatKitRelationship in
                                VStack {
                                    HStack {
                                        Text(coatKitRelationship.kit.id)
                                            .font(.caption)
                                        Spacer()
                                        Text(coatKitRelationship.kit.name)
                                            .font(.caption)
                                        Spacer()
                                        Text(coatKitRelationship.kit.quantity.description)
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
                }
                
                VStack {
                    Text("Relevant Documentation:")
                        .font(.title)
                    List {
                        Section(header: Text("Installation Guides")) {
                            ForEach(relevantPDFs.filter { $0.type == .ig }) { pdf in
                                NavigationLink(
                                    destination: PDFViewer(url: pdf.url),
                                    label: {
                                        Text(pdf.title)
                                    }
                                )
                            }
                        }
                        Section(header: Text("Technical Data Sheets")) {
                            ForEach(relevantPDFs.filter { $0.type == .tds }) { pdf in
                                NavigationLink(
                                    destination: PDFViewer(url: pdf.url),
                                    label: {
                                        Text(pdf.title)
                                    }
                                )
                            }
                        }
                        Section(header: Text("Safety Data Sheets")) {
                            ForEach(relevantPDFs.filter { $0.type == .sds }) { pdf in
                                NavigationLink(
                                    destination: PDFViewer(url: pdf.url),
                                    label: {
                                        Text(pdf.title)
                                    }
                                )
                            }
                        }
                    }
                    
                }
                .navigationTitle(system.nameFromUser)
            }
        }
        .onAppear() {
            //relevantPDFs = checkForPDFs(system: system)
        }
    }
        
    // Split into different functions, for each respective coating. Maybe add something to coatData to represent what kind of actual coat or system it belongs to.
    
    /*
    private func checkForPDFs(system: SystemData) -> [PDFUrl] {
        
        var pdfs: [PDFUrl] = []
        var addresses: [String] = []
        var tempSubType = ""
        var tempSpeed = ""
        
        if (system.name == "UPC 1-Coat") {
            
            appendIfNotExists(string: "UPC 1-Coat Installation Guide", to: &addresses)
            appendIfNotExists(string: "UPC Colorant Safety Data Sheet", to: &addresses)
            appendIfNotExists(string: "UPC Part A", to: &addresses)
            appendIfNotExists(string: "UPC Part B", to: &addresses)
            
            
            for coat in system.coats {
                
                tempSubType = String(coat.subType.prefix(2))
                
                tempSpeed = String(coat.speed.prefix(2))
                
                appendIfNotExists(string: "UPC \(tempSubType)-\(tempSpeed)", to: &addresses)
                
            }
        }
        
        // Need to break these down, probably making functions for UPC, TS, PA, PU, etc.
        if (system.name == "Color Chip") {
            
            appendIfNotExists(string: "Color Chip Installation Guide", to: &addresses)
            
            if (system.subType == "RC (Roll Coat)" ||
                system.subType == "RC UV (Roll Coat w/ UV)" ||
                system.subType == "SL (Self Leveling)") {
                
                appendIfNotExists(string: "UPC Part A", to: &addresses)
                appendIfNotExists(string: "UPC Part B", to: &addresses)
                
                for coat in system.coats {
                    
                    tempSubType = String(coat.subType.prefix(2))
                        
                    tempSpeed = String(coat.speed.prefix(2))
                    
                    appendIfNotExists(string: "UPC \(tempSubType)-\(tempSpeed)", to: &addresses)
                    
                }
                
                if (system.subType == "RC UV (Roll Coat w/ UV)") {
                    appendIfNotExists(string: "Poly Accelerant", to: &addresses)
                }
                
            } else if (system.subType == "TS (Top Shelf Epoxy)") {
                
                appendIfNotExists(string: "Top Shelf Epoxy Part A", to: &addresses)
                appendIfNotExists(string: "Top Shelf Epoxy Part B", to: &addresses)
                
                if system.coats.contains(where: { coat in
                    return coat.speed == "AP (Average Pace)"
                }) {
                    appendIfNotExists(string: "Top Shelf Epoxy A AP", to: &addresses)
                }
                
                if system.coats.contains(where: { coat in
                    return coat.speed == "EZ (Easy)"
                }) {
                    appendIfNotExists(string: "Top Shelf Epoxy A EZ", to: &addresses)
                }
                
                if system.coats.contains(where: { coat in
                    return coat.speed == "Fast (Low Temps)"
                }) {
                    appendIfNotExists(string: "Top Shelf Epoxy A FAST", to: &addresses)
                }
                
                if system.coats.contains(where: { coat in
                    return coat.speed == "TH (Traditional)"
                }) {
                    appendIfNotExists(string: "Top Shelf Epoxy A TH", to: &addresses)
                }
                
            }
            
            if system.coats.contains(where: { coat in
              return coat.coatType == "MVR Coat"
            }) {
                appendIfNotExists(string: "Top Shelf Epoxy Part A", to: &addresses)
                appendIfNotExists(string: "Top Shelf Epoxy Part B", to: &addresses)
                appendIfNotExists(string: "Top Shelf Epoxy A MVR EZ", to: &addresses)
                appendIfNotExists(string: "Top Shelf Epoxy A MVR FC", to: &addresses)
            }
            
            if system.coats.contains(where: {coat in
                return (coat.subType == "Polyaspartic 72" || coat.subType == "Polyaspartic 85")
            }) {
                appendIfNotExists(string: "Polyaspartic Part A (72, 85)", to: &addresses)
                appendIfNotExists(string: "Polyaspartic Part B (72, 85)", to: &addresses)
            }
            
            if system.coats.contains(where: {coat in
                return coat.subType == "Polyaspartic 92 Low Odor"
            }) {
                appendIfNotExists(string: "Polyaspartic Part A (92 Low Odor)", to: &addresses)
                appendIfNotExists(string: "Polyaspartic Part B (92 Low Odor)", to: &addresses)
            }
            
            if system.coats.contains(where: { coat in
                return (coat.coatType == "Top Coat 2")
            }) {
                if system.coats.contains(where: { coat in
                    return (coat.subType == "Polyurethane HS" && coat.speed == "EZ - Clear")
                }) {
                    appendIfNotExists(string: "Polyurethane HS EZ", to: &addresses)
                }
                
                if system.coats.contains(where: { coat in
                    return (coat.subType == "Polyurethane HS" && coat.speed == "EZ - Fast")
                }) {
                    appendIfNotExists(string: "Polyurethane HS FC", to: &addresses)
                }
                
                if system.coats.contains(where: { coat in
                    return (coat.subType == "Polyurethane HP Clear Gloss")
                }) {
                    appendIfNotExists(string: "Polyurethane HP Gloss", to: &addresses)
                }
                
                if system.coats.contains(where: { coat in
                    return (coat.subType == "Polyurethane HP Clear Satin")
                }) {
                    appendIfNotExists(string: "Polyurethane HP Satin", to: &addresses)
                }
            }
            
            appendIfNotExists(string: "Power Cleaner", to: &addresses)
            appendIfNotExists(string: "Solvent Cleaner", to: &addresses)
            
        }
        
        for address in addresses {
            if let pdfUrl = DetailView.pdfURLs.first(where: { $0.title == address }) {
                pdfs.append(pdfUrl)
            }
        }
        
        return pdfs
    }
     */
    /*
    func appendIfNotExists(string: String, to array: inout [String]) {
      if !array.contains(string) {
        array.append(string)
      }
    }
     */
    
}
