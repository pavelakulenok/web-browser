//
//  ViewController.swift
//  web browser
//
//  Created by Pavel Akulenak on 13.05.21.
//

import UIKit
import WebKit

class ViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var webView: WKWebView!

    override func viewDidLoad() {
        super.viewDidLoad()
        webView.allowsBackForwardNavigationGestures = true
    }

    @IBAction func onGoButton(_ sender: Any) {
        guard let text = textField.text else {
            return
        }
        if text.starts(with: "https://") {
            if let url = URL(string: text) {
                let request = URLRequest(url: url)
                webView.load(request)
            }
        } else if let url = URL(string: "https://\(text)") {
            let request = URLRequest(url: url)
            webView.load(request)
        }
    }

    @IBAction func onSearchOnGoogleButton(_ sender: Any) {
        if let text = textField.text {
            let textComponents = text.components(separatedBy: " ")
            let searchString = textComponents.joined(separator: "+")
            let url = URL(string: "https://www.google.com/search?q=" + searchString)
            let urlRequest = URLRequest(url: url!)
            webView.load(urlRequest)
        }
    }
    
    @IBAction func onReloadButton(_ sender: Any) {
        webView.reload()
    }

    @IBAction func onStopButton(_ sender: Any) {
        webView.stopLoading()
    }

    @IBAction func onGoForwardButton(_ sender: Any) {
        webView.goForward()
    }

    @IBAction func onGoBackButton(_ sender: Any) {
        webView.goBack()
    }
}
