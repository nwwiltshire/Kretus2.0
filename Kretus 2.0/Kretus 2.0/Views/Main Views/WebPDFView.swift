//
//  WebPDFView.swift
//  Kretus 2.0
//
//  Created by Nick Wiltshire on 6/11/24.
//

import Foundation
import SwiftUI
import WebKit

/*
struct RemotePDFView: View {

  let pdfURLString: String

  var body: some View {
    ZStack {
      WKWebView(frame: .zero, configuration: WKWebViewConfiguration()) { webView in
        guard let url = URL(string: pdfURLString) else { return }
        webView.load(URLRequest(url: url))
      }
      // Add a placeholder view while loading (optional)
      ProgressView()
        .opacity(0.5)
    }
  }
}


class MyViewController: UIViewController {

  private var webView: WKWebView!
  let pdfURLString = "https://www.example.com/your_pdf.pdf" // Replace with your actual URL

  override func viewDidLoad() {
    super.viewDidLoad()
    setupWebView()
    loadPDF()
  }

  private func setupWebView() {
    webView = WKWebView(frame: view.frame)
    view.addSubview(webView)
  }

  private func loadPDF() {
    guard let pdfURL = URL(string: pdfURLString) else {
      // Handle invalid URL error
      return
    }
    let request = URLRequest(url: pdfURL)
    webView.load(request)
  }
}
*/

