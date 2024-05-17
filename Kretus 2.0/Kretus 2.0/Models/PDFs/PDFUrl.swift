//
//  PDFUrls.swift
//  Kretus 2.0
//
//  Created by Nick Wiltshire on 5/16/24.
//

import Foundation

struct PDFUrl: Identifiable {
    
    var id = UUID()
    var url: URL
    var title: String = "Default"
    var group: PDFGroup
    var type: PDFType
    
    
    enum PDFGroup: CaseIterable, Codable, Identifiable, CustomStringConvertible, Comparable {
        case general, upc

        var id: Self { self }

        var description: String {
            switch self {
            case .general: return "General Documentation"
            case .upc: return "UPC 1-Coat"
            }
        }

        static func < (lhs: PDFGroup, rhs: PDFGroup) -> Bool {
            lhs.description < rhs.description
        }
    }

    
    enum PDFType: CaseIterable, Codable, Identifiable, CustomStringConvertible, Comparable {
        case general, sds, tds, ig

        var id: Self { self }

        var description: String {
            switch self {
            case .general: return "General Documentation"
            case .tds: return "Technical Data Sheets"
            case .sds: return "Safety Data Sheets"
            case .ig: return "Installation Guides"
            }
        }

        static func < (lhs: PDFType, rhs: PDFType) -> Bool {
            lhs.description < rhs.description
        }
    }


}
