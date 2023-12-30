//
//  GamesViewController.swift
//  Cazinozist Games
//
//  Created by Ravil on 30.12.2023.
//

import UIKit

class GamesViewController: UIViewController {
    
    let scrollView = UIScrollView()
    let buttonPoker = UIButton(type: .custom)
    let buttonBlackjack = UIButton(type: .custom)
    let buttonRoulette = UIButton(type: .custom)
    let buttonBaccarat = UIButton(type: .custom)
    let buttonBingo = UIButton(type: .custom)
    let buttonCraps = UIButton(type: .custom)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cgUI()
        cgBar()
        view.backgroundColor = UIColor(named: "backgroundCust")
    }
    
    private func cgUI() {
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(scrollView)
        scrollView.addSubview(buttonPoker)
        scrollView.addSubview(buttonBlackjack)
        scrollView.addSubview(buttonRoulette)
        scrollView.addSubview(buttonBaccarat)
        scrollView.addSubview(buttonBingo)
        scrollView.addSubview(buttonCraps)
        
        buttonPoker.setImage(UIImage(named: "poker"), for: .normal)
        buttonPoker.translatesAutoresizingMaskIntoConstraints = false
        
        buttonBlackjack.setImage(UIImage(named: "blackjack"), for: .normal)
        buttonBlackjack.translatesAutoresizingMaskIntoConstraints = false
        
        buttonRoulette.setImage(UIImage(named: "roulette"), for: .normal)
        buttonRoulette.translatesAutoresizingMaskIntoConstraints = false
        
        buttonBaccarat.setImage(UIImage(named: "baccarat"), for: .normal)
        buttonBaccarat.translatesAutoresizingMaskIntoConstraints = false
        
        buttonBingo.setImage(UIImage(named: "bingo"), for: .normal)
        buttonBingo.translatesAutoresizingMaskIntoConstraints = false
        
        buttonCraps.setImage(UIImage(named: "craps"), for: .normal)
        buttonCraps.translatesAutoresizingMaskIntoConstraints = false
        
        buttonPoker.addTarget(self, action: #selector(levelsMetod), for: .touchUpInside)
        buttonBlackjack.addTarget(self, action: #selector(levelsMetod), for: .touchUpInside)
        buttonRoulette.addTarget(self, action: #selector(levelsMetod), for: .touchUpInside)
        buttonBaccarat.addTarget(self, action: #selector(levelsMetod), for: .touchUpInside)
        buttonBingo.addTarget(self, action: #selector(levelsMetod), for: .touchUpInside)
        buttonCraps.addTarget(self, action: #selector(levelsMetod), for: .touchUpInside)

        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            buttonPoker.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 20),
            buttonPoker.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            buttonBlackjack.topAnchor.constraint(equalTo: buttonPoker.bottomAnchor, constant: 16),
            buttonBlackjack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            buttonRoulette.topAnchor.constraint(equalTo: buttonBlackjack.bottomAnchor, constant: 16),
            buttonRoulette.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            
            buttonBaccarat.topAnchor.constraint(equalTo: buttonBlackjack.bottomAnchor, constant: 16),
            buttonBaccarat.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            buttonBingo.topAnchor.constraint(equalTo: buttonRoulette.bottomAnchor, constant: 16),
            buttonBingo.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            buttonBingo.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -16),
            
            buttonCraps.topAnchor.constraint(equalTo: buttonBaccarat.bottomAnchor, constant: 16),
            buttonCraps.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            buttonCraps.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -16)
        ])
    }
    
    @objc private func levelsMetod() {
        let levelsVC = LevelsViewController()
        self.navigationController?.pushViewController(levelsVC, animated: true)
    }
    
    private func cgBar() {
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        
        let imageView = UIImageView(image: UIImage(named: "cgLogo"))
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        navigationItem.leftBarButtonItems = [UIBarButtonItem(customView: imageView), flexibleSpace]
    }
}
