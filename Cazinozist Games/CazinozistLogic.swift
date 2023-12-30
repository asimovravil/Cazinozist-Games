//
//  QuizBrain.swift
//  QXTrading
//
//  Created by Ravil on 05.12.2023.
//

import Foundation

struct CazinozistLogic {
    
    var questionNumber = 0
    var score = 0
    
    let quiz = [
        QuestionCazinozist(q: "What is the term for a forced bet placed by two players before each hand to initiate betting?", a: ["Ante", "Blind", "Raise"], correctAnswer: "Ante"),
        QuestionCazinozist(q: "In poker, what is the name of the five-card hand that consists of a pair of one rank and a three-of-a-kind of another rank?", a: ["Flush", "Full House", "Straight"], correctAnswer: "Full House"),
        QuestionCazinozist(q: "What casino game involves rolling two dice and betting on the outcome of the roll?", a: ["Roulette", "Blackjack", "Craps"], correctAnswer: "Craps"),
        QuestionCazinozist(q: "What is the term for a card game in which players bet on the strength of their hands, with the best hand winning the pot?", a: ["Bridge", "Poker", "Solitaire"], correctAnswer: "Poker"),
        QuestionCazinozist(q: "What is the name of the casino game where players try to beat the dealer's hand without going over 21?", a: ["Baccarat", "Blackjack", "Texas Hold'em"], correctAnswer: "Blackjack")
    ];

    mutating func prevQuestion() {
        if questionNumber > 0 {
            questionNumber -= 1
        }
    }

    func getQuestionText() -> String {
        return quiz[questionNumber].text
    }
    
    //Need a way of fetching the answer choices.
    func getAnswers() -> [String] {
        return quiz[questionNumber].answers
    }
    
    func getProgress() -> Float {
        return Float(questionNumber) / Float(quiz.count)
    }
    
    mutating func getScore() -> Int {
        return score
    }
    
     mutating func nextQuestion() {
        
        if questionNumber + 1 < quiz.count {
            questionNumber += 1
        } else {
            questionNumber = 0
        }
    }
    
    mutating func checkAnswer(userAnswer: String) -> Bool {
        //Need to change answer to rightAnswer here.
        if userAnswer == quiz[questionNumber].rightAnswer {
            score += 1
            return true
        } else {
            return false
        }
    }
}
