//
//  RulesViewController.swift
//  NomadFriends
//
//  Created by Ravil on 22.11.2023.
//

import UIKit

class RulesViewController: UIViewController {
    
    let scrollView = UIScrollView()
    let arrowLeft = UIButton()
    let imageRules = UIImageView()
    let buttonLeft = UIButton()
    let buttonRight = UIButton()
    let buttonStart = UIButton()
    let firstPage = UILabel()
    let secondPage = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(named: "backgroundCust")
        cgUI()
        cgBar()
    }
    
    private func cgUI() {
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(scrollView)
        scrollView.addSubview(imageRules)
        scrollView.addSubview(buttonLeft)
        scrollView.addSubview(buttonRight)
        scrollView.addSubview(firstPage)
        scrollView.addSubview(secondPage)
        scrollView.addSubview(buttonStart)
        
        arrowLeft.setImage(UIImage(named: "arrowLeft"), for: .normal)
        arrowLeft.translatesAutoresizingMaskIntoConstraints = false
        
        imageRules.image = UIImage(named: "pokerRules")
        imageRules.layer.masksToBounds = true
        imageRules.contentMode = .scaleAspectFit
        imageRules.translatesAutoresizingMaskIntoConstraints = false
        
        buttonLeft.setImage(UIImage(named: "buttonLeftNon"), for: .normal)
        buttonLeft.isEnabled = false
        buttonLeft.translatesAutoresizingMaskIntoConstraints = false
        
        buttonRight.setImage(UIImage(named: "buttonRight"), for: .normal)
        buttonRight.translatesAutoresizingMaskIntoConstraints = false
        
        buttonStart.setImage(UIImage(named: "startQuiz"), for: .normal)
        buttonStart.isHidden = true
        buttonStart.translatesAutoresizingMaskIntoConstraints = false
        
        firstPage.text = "1"
        firstPage.textColor = .white
        firstPage.numberOfLines = 0
        firstPage.font = UIFont(name: "Archivo-Medium", size: 14)
        firstPage.translatesAutoresizingMaskIntoConstraints = false
        
        secondPage.text = "2"
        secondPage.textColor = UIColor(named: "grayCust")
        secondPage.numberOfLines = 0
        secondPage.font = UIFont(name: "Archivo-Medium", size: 14)
        secondPage.translatesAutoresizingMaskIntoConstraints = false
        
        buttonLeft.addTarget(self, action: #selector(buttonLeftTapped), for: .touchUpInside)
        buttonRight.addTarget(self, action: #selector(buttonRightTapped), for: .touchUpInside)
        buttonStart.addTarget(self, action: #selector(buttonStartTapped), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            imageRules.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 20),
            imageRules.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            
            firstPage.topAnchor.constraint(equalTo: imageRules.bottomAnchor, constant: 30),
            firstPage.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -10),
            
            secondPage.topAnchor.constraint(equalTo: imageRules.bottomAnchor, constant: 30),
            secondPage.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 10),
            
            buttonLeft.trailingAnchor.constraint(equalTo: firstPage.leadingAnchor, constant: -32),
            buttonLeft.centerYAnchor.constraint(equalTo: firstPage.centerYAnchor),
            
            buttonStart.topAnchor.constraint(equalTo: firstPage.bottomAnchor, constant: 24),
            buttonStart.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            buttonStart.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -16),
            
            buttonRight.leadingAnchor.constraint(equalTo: secondPage.trailingAnchor, constant: 32),
            buttonRight.centerYAnchor.constraint(equalTo: secondPage.centerYAnchor),
        ])
    }
    
    @objc private func buttonRightTapped() {
        buttonLeft.setImage(UIImage(named: "buttonLeft"), for: .normal)
        buttonLeft.isEnabled = true
        imageRules.image = UIImage(named: "pokerRules2")
        buttonRight.isEnabled = false
        secondPage.textColor = .white
        buttonStart.isHidden = false
    }

    @objc private func buttonLeftTapped() {
        buttonRight.isEnabled = true
        imageRules.image = UIImage(named: "pokerRules")
        buttonLeft.isEnabled = false
        firstPage.textColor = UIColor(named: "grayCust")
        buttonStart.isHidden = true
    }

    @objc private func buttonStartTapped() {
        let testVC = TestViewController()
        self.navigationController?.pushViewController(testVC, animated: true)
    }
    
    private func cgBar() {
        let titleLabel = UILabel()
        titleLabel.text = "Rules"
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
