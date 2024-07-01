//
//  CreatePDFs.swift
//  Kretus 2.0
//
//  Created by Nick Wiltshire on 6/28/24.
//

import Foundation
import PDFKit
import SwiftUI
import UniformTypeIdentifiers

extension PDFDocument: Transferable {
    public static var transferRepresentation: some TransferRepresentation {
        DataRepresentation(contentType: .pdf) { pdf in
                if let data = pdf.dataRepresentation() {
                    return data
                } else {
                    return Data()
                }
            } importing: { data in
                if let pdf = PDFDocument(data: data) {
                    return pdf
                } else {
                    return PDFDocument()
                }
            }
        DataRepresentation(exportedContentType: .pdf) { pdf in
            if let data = pdf.dataRepresentation() {
                return data
            } else {
                return Data()
            }
        }
     }
}

func createPDF() -> Data {
    // 1
    let pdfMetaData = [
        kCGPDFContextCreator: "Kretus App Estimate",
        kCGPDFContextAuthor: "User"
    ]
    let format = UIGraphicsPDFRendererFormat()
    format.documentInfo = pdfMetaData as [String: Any]

    // 2
    let pageWidth = 8.5 * 72.0
    let pageHeight = 11 * 72.0
    let pageRect = CGRect(x: 0, y: 0, width: pageWidth, height: pageHeight)

    // 3
    let renderer = UIGraphicsPDFRenderer(bounds: pageRect, format: format)
    // 4
    let data = renderer.pdfData { (context) in
        // 5
        context.beginPage()
        // 6
        let attributes = [
            NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 72)
        ]
        let text = "I'm a PDF!"
        text.draw(at: CGPoint(x: 0, y: 0), withAttributes: attributes)
    }

    return data
}

/*
 func createPDF(withTexts texts: [String]) -> Data {
     let pdfMetaData = [
         kCGPDFContextCreator: "Kretus App Estimate",
         kCGPDFContextAuthor: "User"
     ]
     let format = UIGraphicsPDFRendererFormat()
     format.documentInfo = pdfMetaData as [String: Any]

     let pageWidth = 8.5 * 72.0
     let pageHeight = 11 * 72.0
     let pageRect = CGRect(x: 0, y: 0, width: pageWidth, height: pageHeight)

     let renderer = UIGraphicsPDFRenderer(bounds: pageRect, format: format)
     
     let data = renderer.pdfData { (context) in
         context.beginPage()
         
         let attributes = [
             NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 72)
         ]
         
         var yOffset: CGFloat = 0
         for text in texts {
             let stringSize = text.size(withAttributes: attributes)
             text.draw(at: CGPoint(x: 0, y: yOffset), withAttributes: attributes)
             yOffset += stringSize.height
         }
     }

     return data
 }
 */
