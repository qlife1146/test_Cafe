//
//  MapViewController.swift
//  test_Cafe
//
//  Created by Luca Park on 2022. 6. 20..
//

import UIKit
import WebKit

class MapViewController: UIViewController {

    @IBOutlet var webView: WKWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        loadWebPage("http://paikdabang.com/store/")
        self.navigationController?.isNavigationBarHidden = false
    }
    
    func loadWebPage(_ url:String) {
        let myURL = URL(string: url)
        let myRequest = URLRequest(url: myURL!)
        webView.load(myRequest)
    }
}
