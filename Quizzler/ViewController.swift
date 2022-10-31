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
    
    
    let quiz = [ ["4+2 = ?","6"], ["4-2 = ?","2"],["4*2 = ?","8"]]
    var questionNumber = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        choiceButton1.setTitle("6", for: .normal)
        choiceButton2.setTitle("2", for: .normal)
        choiceButton3.setTitle("8", for: .normal)
        updateUI()
    }
    
    
    
    @IBAction func choiceButtonPressed(_ sender: UIButton) {
        
        
        let userAnswer = sender.currentTitle!
        let actualAnswer = quiz[questionNumber][1]
        
        if userAnswer == actualAnswer {
            sender.backgroundColor = UIColor.green
            print("Right")
        } else {
            sender.backgroundColor = UIColor.red
            print("Wrong")
        }
        
        
        questionNumber = (questionNumber+1)%3
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
        //updateUI()
    }
    
    @objc func updateUI(){
        choiceButton1.backgroundColor = UIColor.clear
        choiceButton2.backgroundColor = UIColor.clear
        choiceButton3.backgroundColor = UIColor.clear
        questionLabel.text = quiz[questionNumber][0]
    }

}

