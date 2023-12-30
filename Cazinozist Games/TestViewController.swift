//
//  TestViewController.swift
//  QXTrading
//
//  Created by Ravil on 05.12.2023.
//

import UIKit

final class TestViewController: UIViewController {
    
    private var questionResults = [Bool]()
    
    var onQuizCompletion: ((Int, Int) -> Void)?
    private var totalQuestions = 0
    private var userCorrectAnswers = 0
    let arrowLeft = UIButton()
    private var answeredQuestionsCount = 0
    let tableView = UITableView(frame: .zero, style: .plain)


    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(named: "backgroundCust")
        cgUI()
        cgBar()
    }
    
    private func cgUI() {
        tableView.register(TestCell.self, forCellReuseIdentifier: TestCell.reuseID)
        tableView.layer.cornerRadius = 26
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = .clear
        tableView.rowHeight = 700
        tableView.showsVerticalScrollIndicator = false
        tableView.separatorStyle = .none
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)
        
        arrowLeft.setImage(UIImage(named: "arrowLeft"), for: .normal)
        arrowLeft.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
    
    private func navigateToLeaderboard() {
        if userCorrectAnswers == 5 {
            let winVC = WinViewController()
            winVC.hidesBottomBarWhenPushed = true
            winVC.navigationItem.hidesBackButton = true
            self.navigationController?.pushViewController(winVC, animated: true)
        } else {
            let loseVC = LoseViewController()
            loseVC.userCorrectAnswers = userCorrectAnswers
            loseVC.navigationItem.hidesBackButton = true
            loseVC.hidesBottomBarWhenPushed = true
            self.navigationController?.pushViewController(loseVC, animated: true)
        }
    }

    
    private func cgBar() {
        let titleLabel = UILabel()
        titleLabel.text = "Test"
        titleLabel.textColor = UIColor(named: "grayCust")
        titleLabel.font = UIFont(name: "Archivo-Medium", size: 14)
        navigationItem.titleView = titleLabel
        
        let arrowLeftButton = UIBarButtonItem(customView: arrowLeft)
        navigationItem.leftBarButtonItem = arrowLeftButton
        arrowLeft.addTarget(self, action: #selector(arrowLeftTapped), for: .touchUpInside)
    }

    @objc private func arrowLeftTapped() {
        self.navigationController?.popViewController(animated: true)
    }
}

extension TestViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TestCell.reuseID, for: indexPath) as? TestCell else {
            fatalError("Could not cast to QuizTestTableViewCell")
        }
        cell.navigationController = self.navigationController
        cell.totalQuestions = 5
        cell.selectionStyle = .none
        cell.backgroundColor = .clear
        cell.delegate = self
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension TestViewController: CazinozistProtocol {
    func didAnswerQuestion(correctAnswers: Int, totalQuestions: Int) {
        self.userCorrectAnswers = correctAnswers
        self.totalQuestions = totalQuestions
        tableView.reloadData()
        
        if answeredQuestionsCount == totalQuestions {
            navigateToLeaderboard()
        }
    }

    func didCompleteQuestion(isCorrect: Bool) {
        questionResults.append(isCorrect) 

        answeredQuestionsCount += 1
        if answeredQuestionsCount == totalQuestions {
            navigateToLeaderboard()
        }
    }
}

