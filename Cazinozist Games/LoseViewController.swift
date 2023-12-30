//
//  LoseViewController.swift
//  Cazinozist Games
//
//  Created by Ravil on 30.12.2023.
//

import UIKit

class LoseViewController: UIViewController {

    let winResult = UIImageView()
    let imageScore = UIImageView()
    let buttonStep = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        cgUI()
    }
    
    private func cgUI() {
        winResult.image = UIImage(named: "loseResult")
        winResult.layer.masksToBounds = true
        winResult.contentMode = .scaleAspectFill
        winResult.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(winResult)
        
        imageScore.image = UIImage(named: "win1")
        imageScore.layer.masksToBounds = true
        imageScore.contentMode = .scaleAspectFill
        imageScore.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(imageScore)
        
        buttonStep.setImage(UIImage(named: "readAgain"), for: .normal)
        buttonStep.translatesAutoresizingMaskIntoConstraints = false
        buttonStep.addTarget(self, action: #selector(buttonStepTapped), for: .touchUpInside)
        view.addSubview(buttonStep)
        
        NSLayoutConstraint.activate([
            winResult.topAnchor.constraint(equalTo: view.topAnchor),
            winResult.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            winResult.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            winResult.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            imageScore.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            buttonStep.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
        
        if UIScreen.main.bounds.size.height >= 812 {
            NSLayoutConstraint.activate([
                buttonStep.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -24),
                imageScore.bottomAnchor.constraint(equalTo: buttonStep.topAnchor, constant: -24),

            ])
        } else {
            NSLayoutConstraint.activate([
                buttonStep.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
                imageScore.bottomAnchor.constraint(equalTo: buttonStep.topAnchor, constant: 24),

            ])
        }
    }
    
    @objc private func buttonStepTapped() {
        let tabbarVC = TabBarController()
        tabbarVC.navigationItem.hidesBackButton = true
        self.navigationController?.pushViewController(tabbarVC, animated: true)
    }
}
