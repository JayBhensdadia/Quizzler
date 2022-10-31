//
//  ViewController.swift
//  Quizzler
//
//  Created by Jay Bhensdadia on 31/10/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var scoreLabel: UILabel!
    
    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var progressBar: UIProgressView!
    
    @IBOutlet weak var choiceButton1: UIButton!
    
    @IBOutlet weak var choiceButton2: UIButton!
    
    @IBOutlet weak var choiceButton3: UIButton!
    
    
    var quizBrain = QuizBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    
    
    @IBAction func choiceButtonPressed(_ sender: UIButton) {
       
        let userAnswer = sender.currentTitle!
        
        let userGotRight = quizBrain.checkAnswer(userAnswer)
        
        if userGotRight{
            sender.backgroundColor = UIColor.green
        }else{
            sender.backgroundColor = UIColor.red
        }
        
        quizBrain.nextQuestion()
        
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
        
       
    }
    
    @objc func updateUI(){
        
        questionLabel.text = quizBrain.getQuestionText()
        
        choiceButton1.setTitle(quizBrain.getOption(op: 0), for: .normal)
        choiceButton2.setTitle(quizBrain.getOption(op: 1), for: .normal)
        choiceButton3.setTitle(quizBrain.getOption(op: 2), for: .normal)
        
        choiceButton1.backgroundColor = UIColor.clear
        choiceButton2.backgroundColor = UIColor.clear
        choiceButton3.backgroundColor = UIColor.clear
        
        progressBar.progress = quizBrain.getProgress()
        
        scoreLabel.text = "Score : \(quizBrain.getScore())"
    }

}

