//
//  Question.swift
//  Quizzler-iOS13
//
//  Created by Jorge Rincón on 5/24/21.

//

import Foundation

struct Question {
    let questionText: String
    let answer: [String]
    let correctAnswer: String
    
    init(q: String, a: [String], ca: String) {
        questionText = q
        answer = a
        correctAnswer = ca
    }
}
