//
//  WebPDFView.swift
//  Kretus 2.0
//
//  Created by Nick Wiltshire on 6/11/24.
//

import Foundation
import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
 let url: URL
 func makeUIView(context: Context) -> WKWebView  {
 let wkwebView = WKWebView()
 let request = URLRequest(url: url)
 wkwebView.load(request)
 return wkwebView
 }
 func updateUIView(_ uiView: WKWebView, context: Context) {
 }
}
