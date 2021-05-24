//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var question: UILabel!
    @IBOutlet weak var userScore: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    
    @IBOutlet weak var choiceA: UIButton!
    @IBOutlet weak var choiceB: UIButton!
    @IBOutlet weak var choiceC: UIButton!
    
    var questionsData = QuestionsData()
    
    
    var progress: Float = 0.0
    var timer = Timer()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    //button actions when pressed
    @IBAction func answerButton(_ sender: UIButton) {
    
    
        
        let userAnswer = sender.currentTitle!
        
        
        if questionsData.checkAnswer(userAnswer){
            sender.backgroundColor = UIColor.green
        } else {
            sender.backgroundColor = UIColor.red
        }

        timer = Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
        
    
        questionsData.nextQuestion()
    }
    
    
    @objc func updateUI() {
        choiceA.setTitle(questionsData.quiz[questionsData.questionNumber].answer[0], for: .normal)
        choiceB.setTitle(questionsData.quiz[questionsData.questionNumber].answer[1], for: .normal)
        choiceC.setTitle(questionsData.quiz[questionsData.questionNumber].answer[2], for: .normal)
        choiceA.backgroundColor = UIColor.clear
        choiceB.backgroundColor = UIColor.clear
        choiceC.backgroundColor = UIColor.clear
        question.text = questionsData.getQuestionsText()
        progressBar.progress = questionsData.getProgress()
        userScore.text = questionsData.getUserScore()
    }
    
    

}

