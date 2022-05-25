//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var progressView: UIProgressView!
    
    var counter = 0
    var totalTime = 0
    
    var player: AVAudioPlayer!
    
    let eggTimes: [String: Int] = ["Soft": 5, "Medium": 7, "Hard": 12]
    
    var timer = Timer()
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        
        let hardness = sender.title(for: .normal)!
        
        totalTime = eggTimes[hardness]!
        titleLabel.text = hardness
        counter = 0
        progressView.progress = 0.0
        
        timer.invalidate()
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
    }

    @objc func updateCounter() {
        //example functionality
        if counter < totalTime {
            print("\(counter) seconds")
            counter += 1
            progressView.progress = Float(counter)/Float(totalTime)
        } else {
            timer.invalidate()
            titleLabel.text = "Done!"
            playSound(fileName: "alarm_sound")
        }
    }
    
    func playSound(fileName: String) {
        let url = Bundle.main.url(forResource: fileName, withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
    }
    
}
