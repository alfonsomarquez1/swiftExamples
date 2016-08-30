//
//  AboutViewController.swift
//  bullseye2
//
//  Created by Luis Alfonso Marquez Lecona on 8/30/16.
//  Copyright © 2016 Softclick. All rights reserved.
//
import UIKit

class AboutViewController: UIViewController {

    @IBOutlet weak var webView: UIWebView!
    
    @IBAction func back(sender: UIButton) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        updateWebView()	
    }
}

extension AboutViewController {
    func updateWebView() {
//        let i = 0
////        let i3: Int = nil
//        var i2: Int? = 3
//        var resultado = 4 + (i2 ?? 6)
//        if let i2 = i2 {
//            print("\(i2)")
//        }
//        guard let i3 = i2 else {
//            return
//        }
//        print("\(i3)")

        
        
        if let webFile = NSBundle.mainBundle().pathForResource("BullsEye", ofType: "html") {
            if let webData = NSData(contentsOfFile: webFile) {
                let baseURL = NSBundle.mainBundle().bundleURL
                webView.loadData(webData, MIMEType: "text/html", textEncodingName: "UTF-8", baseURL: baseURL)
            }
        }
    }
}
