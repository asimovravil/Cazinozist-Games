//
//  TestCell.swift
//  QXTrading
//
//  Created by Ravil on 05.12.2023.
//

import UIKit

protocol CazinozistProtocol: AnyObject {
    func didAnswerQuestion(correctAnswers: Int, totalQuestions: Int)
    func didCompleteQuestion(isCorrect: Bool) 
}

final class TestCell: UITableViewCell {
    
    weak var delegate: CazinozistProtocol?
    weak var quizViewController: TestViewController?
    
    static let reuseID = String(describing: TestCell.self)
    var quizBrain = CazinozistLogic()
    private var answerSelected = false
    var userCorrectAnswers = 0
    var totalQuestions: Int = 0
    weak var navigationController: UINavigationController?
    
    // MARK: - UI
    
    let questionImage = UIImageView()
    let questionLabel = UILabel()
    let firstAnswerButton = UIButton()
    let secondAnswerButton = UIButton()
    let thirdAnswerButton = UIButton()
    
    // MARK: - Lifecycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        cgUI()
        updateUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func cgUI() {
        contentView.addSubview(questionImage)
        contentView.addSubview(questionLabel)
        contentView.addSubview(firstAnswerButton)
        contentView.addSubview(secondAnswerButton)
        contentView.addSubview(thirdAnswerButton)
        
        firstAnswerButton.addTarget(self, action: #selector(answerButtonTapped(_:)), for: .touchUpInside)
        secondAnswerButton.addTarget(self, action: #selector(answerButtonTapped(_:)), for: .touchUpInside)
        thirdAnswerButton.addTarget(self, action: #selector(answerButtonTapped(_:)), for: .touchUpInside)
        
        questionImage.image = UIImage(named: "ques1")
        questionImage.layer.masksToBounds = true
        questionImage.contentMode = .scaleAspectFit
        questionImage.translatesAutoresizingMaskIntoConstraints = false
        
        questionLabel.textColor = .white
        questionLabel.font = UIFont(name: "Archivo-Medium", size: 28)
        questionLabel.textAlignment = .center
        questionLabel.numberOfLines = 0
        questionLabel.translatesAutoresizingMaskIntoConstraints = false
        
        firstAnswerButton.setTitle("1 answer", for: .normal)
        firstAnswerButton.setTitleColor(.white, for: .normal)
        firstAnswerButton.titleLabel?.font = UIFont(name: "Archivo-Bold", size: 18)
        firstAnswerButton.contentHorizontalAlignment = .center
        firstAnswerButton.layer.cornerRadius = 24
        firstAnswerButton.backgroundColor = UIColor(named: "tabbarCust")
        firstAnswerButton.translatesAutoresizingMaskIntoConstraints = false
        
        secondAnswerButton.setTitle("2 answer", for: .normal)
        secondAnswerButton.setTitleColor(.white, for: .normal)
        secondAnswerButton.titleLabel?.font = UIFont(name: "Archivo-Bold", size: 18)
        secondAnswerButton.contentHorizontalAlignment = .center
        secondAnswerButton.layer.cornerRadius = 24
        secondAnswerButton.backgroundColor = UIColor(named: "tabbarCust")
        secondAnswerButton.translatesAutoresizingMaskIntoConstraints = false
        
        thirdAnswerButton.setTitle("3 answer", for: .normal)
        thirdAnswerButton.setTitleColor(.white, for: .normal)
        thirdAnswerButton.titleLabel?.font = UIFont(name: "Archivo-Bold", size: 18)
        thirdAnswerButton.contentHorizontalAlignment = .center
        thirdAnswerButton.layer.cornerRadius = 24
        thirdAnswerButton.backgroundColor = UIColor(named: "tabbarCust")
        thirdAnswerButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            questionImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            questionImage.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            
            questionLabel.topAnchor.constraint(equalTo: questionImage.bottomAnchor, constant: 24),
            questionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            questionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            firstAnswerButton.bottomAnchor.constraint(equalTo: secondAnswerButton.topAnchor, constant: -16),
            firstAnswerButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            firstAnswerButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            firstAnswerButton.heightAnchor.constraint(equalToConstant: 70),
            
            secondAnswerButton.bottomAnchor.constraint(equalTo: thirdAnswerButton.topAnchor, constant: -16),
            secondAnswerButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            secondAnswerButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            secondAnswerButton.heightAnchor.constraint(equalToConstant: 70),
            
            thirdAnswerButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -40),
            thirdAnswerButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            thirdAnswerButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            thirdAnswerButton.heightAnchor.constraint(equalToConstant: 70),
            
        ])
    }
    
    // MARK: - Actions
    
    @objc private func quitQuizButtonTapped() {
        if quizBrain.questionNumber > 0 {
            quizBrain.prevQuestion()
            updateUI()
        }
    }
    
    @objc public func updateUI() {
        let questionText = quizBrain.getQuestionText()
        let answers = quizBrain.getAnswers()
        
        let currentQuestionNumber = quizBrain.questionNumber + 1
        questionImage.image = UIImage(named: "ques\(currentQuestionNumber)")
        
        questionLabel.text = questionText
        firstAnswerButton.setTitle(answers[0], for: .normal)
        secondAnswerButton.setTitle(answers[1], for: .normal)
        thirdAnswerButton.setTitle(answers[2], for: .normal)
                
        firstAnswerButton.backgroundColor = UIColor(named: "tabbarCust")
        secondAnswerButton.backgroundColor = UIColor(named: "tabbarCust")
        thirdAnswerButton.backgroundColor = UIColor(named: "tabbarCust")
        
        answerSelected = false
    }

    
    @objc private func answerButtonTapped(_ sender: UIButton) {
        if !answerSelected {
            let userAnswer = sender.currentTitle!
            let userGotItRight = quizBrain.checkAnswer(userAnswer: userAnswer)

            if userGotItRight {
                sender.backgroundColor = UIColor(named: "blueCust")
                userCorrectAnswers += 1
            } else {
                sender.backgroundColor = UIColor(named: "blueCust")
            }
            
            sender.layer.cornerRadius = 24
            answerSelected = true

            // Добавление задержки перед показом следующего вопроса
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                self.quizBrain.nextQuestion()
                self.updateUI()
                self.answerSelected = false
                self.delegate?.didAnswerQuestion(correctAnswers: self.userCorrectAnswers, totalQuestions: self.totalQuestions)
                self.delegate?.didCompleteQuestion(isCorrect: userGotItRight)
            }
        }
    }
}

