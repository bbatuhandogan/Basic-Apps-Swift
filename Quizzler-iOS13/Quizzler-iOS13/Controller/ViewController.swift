//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var oldScoreLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var answerOneOutlet: UIButton!
    @IBOutlet weak var answerTwoOutlet: UIButton!
    @IBOutlet weak var answerThreeOutlet: UIButton!
    
    var quizBrain = QuizBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        progressBar.progress = quizBrain.getProgress()
        answerOneOutlet.layer.cornerRadius = 20
        answerTwoOutlet.layer.cornerRadius = 20
        answerThreeOutlet.layer.cornerRadius = 20
        updateUI()
    }

    @IBAction func answerButtonPressed(_ sender: UIButton) {
        
        let userAnswer = sender.currentTitle!
        
        if quizBrain.checkAnswer(userAnswer) == true {
            sender.backgroundColor = .green
        } else {
            sender.backgroundColor = .red
        }
        
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
        
    }
    
    @objc func updateUI() {
        questionLabel.text = quizBrain.getQuestionText()
        
        answerOneOutlet.setTitle(quizBrain.getAnswersText()[0], for: UIControl.State.normal)
        answerTwoOutlet.setTitle(quizBrain.getAnswersText()[1], for: UIControl.State.normal)
        answerThreeOutlet.setTitle(quizBrain.getAnswersText()[2], for: UIControl.State.normal)

        answerOneOutlet.backgroundColor = .clear
        answerTwoOutlet.backgroundColor = .clear
        answerThreeOutlet.backgroundColor = .clear
        scoreLabel.text = quizBrain.getScore()
        oldScoreLabel.text = quizBrain.getOldScore()
        progressBar.progress = quizBrain.getProgress()
    }
}
