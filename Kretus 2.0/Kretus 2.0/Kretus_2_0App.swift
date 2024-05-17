//
//  Kretus_2_0App.swift
//  Kretus 2.0
//
//  Created by Nick Wiltshire on 1/17/24.
//

import SwiftUI
import SwiftData

@main
struct Kretus_2_0App: App {
    
    var body: some Scene {
        WindowGroup {
            SplashView()
        }
        .modelContainer(for: SystemData.self)
    }
    
    static var pdfURLS: [PDFUrl] = [PDFUrl(url: Bundle.main.url(forResource: "Kretus-Product-Catalog", withExtension: "pdf")!, title: "Product Catalog", group: .general, type: .general),
                                    PDFUrl(url: Bundle.main.url(forResource: "UPC-Installation-Guide", withExtension: "pdf")!, title: "UPC 1-Coat Installation Guide", group: .upc, type: .ig),
                                    PDFUrl(url: Bundle.main.url(forResource: "UPC-SDS-Colorant", withExtension: "pdf")!, title: "UPC Colorant Safety Data Sheet", group: .upc, type: .sds),
                                    PDFUrl(url: Bundle.main.url(forResource: "UPC-TDS-WC-FC", withExtension: "pdf")!, title: "WC-FC", group: .upc, type: .tds),
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
    
    
    
}
