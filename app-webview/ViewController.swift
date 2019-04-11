//
//  ViewController.swift
//  app-webview
//
//  Created by João Pedro Fabiano Franco on 11/04/19.
//  Copyright © 2019 João Pedro Fabiano Franco. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController {
    var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 1
        let url = URL(string: "https://devnf-invistacompi.cs14.force.com/s/")!
        webView.load(URLRequest(url: url))
        
        // 2
        let refresh = UIBarButtonItem(barButtonSystemItem: .refresh, target: webView, action: #selector(webView.reload))
        toolbarItems = [refresh]
        navigationController?.isToolbarHidden = false
    }
}

extension ViewController: WKNavigationDelegate {
    override func loadView() {
        webView = WKWebView()
        webView.navigationDelegate = self
        view = webView
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        title = webView.title
    }
}

