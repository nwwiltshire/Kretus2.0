//
//  PDFViewer.swift
//  Kretus 2.0
//
//  Created by Nick Wiltshire on 5/16/24.
//

import SwiftUI
import PDFKit

struct PDFViewer: UIViewRepresentable {
    
    let url: URL
    
    func makeUIView(context: Context) -> PDFView {
        let pdfView = PDFView()

        pdfView.document = PDFDocument(url: self.url)

        pdfView.autoScales = true
        return pdfView
    }
    
    func updateUIView(_ pdfView: PDFView, context: Context) {
        // Update the view if needed (If you change the pdf)
    }
}

struct PDFFileViewer: UIViewRepresentable {
    
    let document: PDFDocument
    
    func makeUIView(context: Context) -> PDFView {
        let pdfView = PDFView()

        pdfView.document = self.document

        pdfView.autoScales = true
        return pdfView
    }
    
    func updateUIView(_ pdfView: PDFView, context: Context) {
        // Update the view if needed (If you change the pdf)
    }
}

