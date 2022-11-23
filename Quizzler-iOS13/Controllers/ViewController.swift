//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var firstChoice: UIButton!
    @IBOutlet weak var secondChoice: UIButton!
    @IBOutlet weak var lastChoice: UIButton!
    
    
    var quizRepository: QuizRepository = QuizRepository()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        updateQuestionLabelText()
        setAnswers()
        progressBar.progress = 0
        scoreLabel.text = "Score: 0 / \(quizRepository.quiz.count)"
    }

    @IBAction func buttonPressed(_ sender: UIButton) {
        let userAnswer = sender.currentTitle
        let answerIsCorrect: Bool = quizRepository.checkAnswer(for: userAnswer!)
        if answerIsCorrect {
            sender.backgroundColor = UIColor.green
        } else {
            sender.backgroundColor = UIColor.red
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) { [weak self] in
            sender.backgroundColor = UIColor.clear
            self?.updateQuestionLabelText()
            self?.updateScore()
            self?.setAnswers()
        }

        if (quizRepository.isEnd()) {
            firstChoice.isEnabled = false
            secondChoice.isEnabled = false
            lastChoice.isEnabled = false
        }
        quizRepository.incrementQuestionNumber()
        let progress = quizRepository.getProgress()
        progressBar.setProgress(progress, animated: true)
    }
    
    @IBAction func reset(_ sender: UIButton) {
        quizRepository.reset()
        progressBar.progress = 0
        scoreLabel.text = "Score: 0 / \(quizRepository.quiz.count)"
        updateQuestionLabelText()
    }
    
    func updateQuestionLabelText() {
        questionLabel.text = quizRepository.getText()
    }
    
    func updateScore() {
        scoreLabel.text = "Score: \(quizRepository.score) / \(quizRepository.quiz.count)"
    }
    
    func setAnswers() {
        let question = quizRepository.currentQuestion()
        firstChoice.setTitle(question.answers[0], for: .normal)
        secondChoice.setTitle(question.answers[1], for: .normal)
        lastChoice.setTitle(question.answers[2], for: .normal)
    }
}

