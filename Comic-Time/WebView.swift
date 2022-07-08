//
//  WebView.swift
//  Comic-Time
//
//  Created by vatran robert on 2022-07-08.
//

import Foundation
import SwiftUI
import WebKit

struct WebView : UIViewRepresentable {
   
    var url : URL
    
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    
    
    func updateUIView(_ webView: WKWebView, context: Context) {
        let request = URLRequest(url: url)
        webView.load(request)
    }
}

