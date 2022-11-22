//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var falseButton: UIButton!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var questionLabel: UILabel!
    
    let quiz: [[String]] = [
        ["Four + Two is equal to Six.", "True"],
        ["Five - Three is greater than One.", "True"],
        ["Three + Eight is less than Ten.", "False"]
    ]
    
    var questionNumber: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        updateQuestionLabelText()
        progressBar.progress = 0
    }

    @IBAction func buttonPressed(_ sender: UIButton) {
        let buttonPressed = sender.currentTitle
        let answer = quiz[questionNumber][1]
        if (buttonPressed == answer) {
            sender.backgroundColor = UIColor(red: 0, green: 255, blue: 0, alpha: 1)
        } else {
            sender.backgroundColor = UIColor(red: 255, green: 0, blue: 0, alpha: 1)
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) { [weak self] in
            sender.backgroundColor = nil
            self?.updateQuestionLabelText()
        }

        if (questionNumber == quiz.count - 1) {
            trueButton.isEnabled = false
            falseButton.isEnabled = false
        }
        if (questionNumber < quiz.count) {
            questionNumber += 1
        }
        let progress = Float(questionNumber) / Float(quiz.count)
        progressBar.setProgress(progress, animated: true)
    }
    
    func updateQuestionLabelText() {
        if (questionNumber < quiz.count) {
            questionLabel.text = quiz[questionNumber][0]
        }
    }
}

