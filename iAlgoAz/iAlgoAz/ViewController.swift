//
//  ViewController.swift
//  iAlgoAz
//
//  Created by Abbas Lutvaliyev on 08.06.23.
//

import UIKit
import WebKit
class ViewController: UIViewController {
    let webview: WKWebView = {
        let prefs = WKWebpagePreferences()
        prefs.allowsContentJavaScript = true
        let configuration = WKWebViewConfiguration()
        configuration.defaultWebpagePreferences = prefs
        let webview = WKWebView(frame: .zero, configuration: configuration)
        return webview
    }();
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(webview)
        guard let url = URL(string: "https://z3ven.github.io/ialgoaz.github.io/") else {
            return // be safe
        }
        webview.load(URLRequest(url: url))
        DispatchQueue.main.asyncAfter(deadline: .now()+5) {
            self.webview.evaluateJavaScript("document.body.innerHTML") {result, error in
                guard let html = result as? String, error == nil else{
                    return
                }
                print(html)
            }
        }
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        webview.frame = view.bounds
        
    }

}

