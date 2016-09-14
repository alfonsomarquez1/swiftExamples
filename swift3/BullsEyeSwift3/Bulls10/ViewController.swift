//
//  ViewController.swift
//  Bulls10
//
//  Created by Luis Alfonso Marquez Lecona on 9/9/16.
//  Copyright © 2016 Softclick. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // MARK: IBOutlets
    @IBOutlet weak var targetLabel: UILabel!
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var roundLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    
    // MARK: Atributes
    var target: Int?
    var score: Int?
    var round: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        pimpMySlide()
        newGame()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: Logic
    func newGame() {
        target = 0
        score = 0
        round = 0
        slider.value = 50.0
        nextRound()
    }
    
    func nextRound() {
        slider.value = 50.0
        target = Int(arc4random_uniform(100))
        if let roundValue = round {
            round = roundValue + 1
        }
        updateLabels()
    }
    
    func updateLabels() {
        guard let target = target, let score = score, let round = round else { return }
        targetLabel.text = "\(target)"
        scoreLabel.text = "\(score)"
        roundLabel.text = "\(round)"
    }
    
    func getPoints() {
        guard let target = target, let scoreValue = score else { return }
        
        let sliderValue = Int(slider.value)
        let difference = abs(target - sliderValue)
        let (title, message, points, buttonTitle) = getStats(difference)
        score = scoreValue + points
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: buttonTitle, style: .default) { (action) in
            self.nextRound()
        }
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    func getStats(_ difference: Int) -> (title: String, message: String, points: Int, buttonTitle: String) {
        var points = 0
        switch difference {
        case 0:
            points = 500
            return ("Legen...dario!", "Obtuviste \(points) puntos", points, "Iiincreibleee!")
        case 1...10:
            points = 200 - difference
            return ("Excelete!", "Obtuviste \(points) puntos", points, "Yeah!")
        case 11...25:
            points = 100 - difference
            return ("Nada mal!", "Obtuviste \(points) puntos", points, "Siguiente!")
        default:
            return ("Apestaaaa!", "Obtuviste \(points)", points, "Largo!!")
        }
    }
    
    // MARK: IBActions

    @IBAction func hitMe(_ sender: UIButton) {
        getPoints()
    }

    @IBAction func restart(_ sender: UIButton) {
        newGame()
    }
    
}

extension ViewController {
    func pimpMySlide() {
        let sliderThumbNormal = UIImage(named: "SliderThumb-Normal")
        let sliderThumbHighlighted = UIImage(named: "SliderThumb-Highlighted")
        slider.setThumbImage(sliderThumbNormal, for: .normal)
        slider.setThumbImage(sliderThumbHighlighted, for: .highlighted)
        
        let insets = UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14)
        
        if let sliderTrackLeft = UIImage(named: "SliderTrackLeft") {
            let sliderResizableLeft = sliderTrackLeft.resizableImage(withCapInsets: insets)
            slider.setMinimumTrackImage(sliderResizableLeft, for: .normal)
        }
        
        if let sliderTrackRight = UIImage(named: "SliderTrackRight") {
            let sliderResizableRight = sliderTrackRight.resizableImage(withCapInsets: insets)
            slider.setMaximumTrackImage(sliderResizableRight, for: .normal)
        }
    }
}

