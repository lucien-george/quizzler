//
//  QuizBrain.swift
//  Quizzler-iOS13
//
//  Created by Lucien George on 23/11/2022.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import Foundation

struct QuizRepository {
    let quiz: [Question] = [
        Question(text: "Which is the largest organ in the human body?", answers: ["Heart", "Skin", "Large Intestine"], correctAnswer: "Skin"),
        Question(text: "Five dollars is worth how many nickels?", answers: ["25", "50", "100"], correctAnswer: "100"),
        Question(text: "What do the letters in the GMT time zone stand for?", answers: ["Global Meridian Time", "Greenwich Mean Time", "General Median Time"], correctAnswer: "Greenwich Mean Time"),
        Question(text: "What is the French word for 'hat'?", answers: ["Chapeau", "Écharpe", "Bonnet"], correctAnswer: "Chapeau"),
        Question(text: "In past times, what would a gentleman keep in his fob pocket?", answers: ["Notebook", "Handkerchief", "Watch"], correctAnswer: "Watch"),
        Question(text: "How would one say goodbye in Spanish?", answers: ["Au Revoir", "Adiós", "Salir"], correctAnswer: "Adiós"),
        Question(text: "Which of these colours is NOT featured in the logo for Google?", answers: ["Green", "Orange", "Blue"], correctAnswer: "Orange"),
        Question(text: "What alcoholic drink is made from molasses?", answers: ["Rum", "Whisky", "Gin"], correctAnswer: "Rum"),
        Question(text: "What type of animal was Harambe?", answers: ["Panda", "Gorilla", "Crocodile"], correctAnswer: "Gorilla"),
        Question(text: "Where is Tasmania located?", answers: ["Indonesia", "Australia", "Scotland"], correctAnswer: "Australia")
    ]
    
    var questionNumber: Int = 0
    var score: Int = 0
    
    mutating func checkAnswer(for userAnswer: String) -> Bool {
        let answerIsRight: Bool = quiz[questionNumber].correctAnswer == userAnswer
        if (answerIsRight) {
            updateScore()
        }
        return answerIsRight
    }
    
    mutating func incrementQuestionNumber() {
        if (questionNumber < quiz.count) {
            self.questionNumber += 1
        }
    }
    
    func getText() -> String {
        if (questionNumber < quiz.count) {
            return quiz[questionNumber].text
        } else {
            return "All done! Congrats 🎉"
        }
    }
    
    func getProgress() -> Float {
        return Float(questionNumber) / Float(quiz.count)
    }
    
    func isEnd() -> Bool {
        return questionNumber == quiz.count - 1
    }
    
    func currentQuestion() -> Question {
        return quiz[questionNumber]
    }

    mutating func updateScore() {
        self.score += 1
    }
    
    mutating func reset() {
        questionNumber = 0
        score = 0
    }
}
