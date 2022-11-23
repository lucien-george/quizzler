//
//  Question.swift
//  Quizzler-iOS13
//
//  Created by Lucien George on 23/11/2022.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import Foundation

struct Question {
    let text: String
    let answers: [String]
    let correctAnswer: String
    init(text: String, answers: [String], correctAnswer: String) {
        self.text = text
        self.answers = answers
        self.correctAnswer = correctAnswer
    }
}
