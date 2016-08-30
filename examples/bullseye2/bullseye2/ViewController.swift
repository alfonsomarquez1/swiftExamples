//
//  ViewController.swift
//  bullseye2
//
//  Created by Luis Alfonso Marquez Lecona on 8/30/16.
//  Copyright © 2016 Softclick. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var targerLabel: UILabel!
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var roundLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        pimpMySlider()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func hitMe(sender: UIButton) {
    }
    
    @IBAction func restart(sender: UIButton) {
    }
    
}
extension ViewController {
    func pimpMySlider() {
        let sliderThumbNormal = UIImage(named: "SliderThumb-Normal")
        let sliderThumbHighlighted = UIImage(named: "SliderThumb-Highlighted")
        slider.setThumbImage(sliderThumbNormal, forState: .Normal)
        slider.setThumbImage(sliderThumbHighlighted, forState: .Highlighted)
        
        let insets = UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14)
        if let sliderTrackLeft = UIImage(named: "SliderTrackLeft") {
            let resizableTrackLeft = sliderTrackLeft.resizableImageWithCapInsets(insets)
            slider.setMinimumTrackImage(resizableTrackLeft, forState: .Normal)
        }
        if let sliderTrackRight = UIImage(named: "SliderTrackRight") {
            let resizableTrackRight = sliderTrackRight.resizableImageWithCapInsets(insets)
            slider.setMaximumTrackImage(resizableTrackRight, forState: .Normal)
            
        }
    }
}

