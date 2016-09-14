//
//  AboutViewController.swift
//  Bulls10
//
//  Created by Luis Alfonso Marquez Lecona on 9/9/16.
//  Copyright © 2016 Softclick. All rights reserved.
//

import UIKit

class AboutViewController: UIViewController {
    
    // MARK: IBOutlets
    @IBOutlet weak var webView: UIWebView!

    override func viewDidLoad() {
        super.viewDidLoad()


        pimpMyWebView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: IBActions
    @IBAction func back(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}

extension AboutViewController {
    func pimpMyWebView() {
        if let htmlFile = Bundle.main.url(forResource: "BullsEye", withExtension: "html") {
            do {
                let htmlData = try Data(contentsOf: htmlFile)
                let baseURL = Bundle.main.bundleURL
                
                webView.load(htmlData, mimeType: "text/html", textEncodingName: "UTF-8", baseURL: baseURL)
            } catch {
                print("error")
            }
        }
    }
}
