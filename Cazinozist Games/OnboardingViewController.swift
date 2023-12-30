//
//  OnboardingViewController.swift
//  Cazinozist Games
//
//  Created by Ravil on 30.12.2023.
//

import UIKit

class OnboardingViewController: UIViewController {
    
    var sectionPageList = 0
    
    let onboardingImage = UIImageView()
    let onboardingTitle = UILabel()
    let onboardingSubTitle = UILabel()
    let onboardingPage = UIPageControl()
    let onboardingNext = UIButton()
    let onboardingSkip = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateContentForPage(sectionPageList)
        setupUI()
        setupNavBar()
        view.backgroundColor = UIColor(named: "backgroundCust")
    }
    
    func setupUI() {
        onboardingSkip.setImage(UIImage(named: "skip"), for: .normal)
        view.addSubview(onboardingSkip)
        
        onboardingImage.layer.masksToBounds = true
        onboardingImage.contentMode = .scaleAspectFit
        onboardingImage.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(onboardingImage)
        
        onboardingTitle.textAlignment = .center
        onboardingTitle.textColor = .white
        onboardingTitle.numberOfLines = 0
        onboardingTitle.font = UIFont(name: "Archivo-Black", size: 28)
        onboardingTitle.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(onboardingTitle)
        
        onboardingSubTitle.textAlignment = .center
        onboardingSubTitle.textColor = .white
        onboardingSubTitle.numberOfLines = 0
        onboardingSubTitle.alpha = 0.40
        onboardingSubTitle.font = UIFont(name: "Archivo-Regular", size: 16)
        onboardingSubTitle.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(onboardingSubTitle)
        
        onboardingPage.numberOfPages = onboardingList.count
        onboardingPage.currentPage = sectionPageList
        onboardingPage.currentPageIndicatorTintColor = .blue
        onboardingPage.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(onboardingPage)
        
        onboardingNext.setImage(UIImage(named: "next"), for: .normal)
        onboardingNext.addTarget(self, action: #selector(sectionNextClapped), for: .touchUpInside)
        onboardingNext.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(onboardingNext)
        
        if UIScreen.main.bounds.size.height >= 812 {
            NSLayoutConstraint.activate([
                onboardingNext.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50),
                onboardingPage.bottomAnchor.constraint(equalTo: onboardingNext.topAnchor, constant: -16),
                onboardingSubTitle.bottomAnchor.constraint(equalTo: onboardingPage.topAnchor, constant: -24),
                onboardingTitle.bottomAnchor.constraint(equalTo: onboardingSubTitle.topAnchor, constant: -16),
                onboardingImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 60),
            ])
        } else {
            NSLayoutConstraint.activate([
                onboardingImage.topAnchor.constraint(equalTo: view.topAnchor),
                onboardingNext.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
                onboardingPage.bottomAnchor.constraint(equalTo: onboardingNext.topAnchor, constant: 0),
                onboardingSubTitle.bottomAnchor.constraint(equalTo: onboardingPage.topAnchor, constant: -8),
                onboardingTitle.bottomAnchor.constraint(equalTo: onboardingSubTitle.topAnchor, constant: -8),
            ])
        }
        
        NSLayoutConstraint.activate([
            onboardingImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            onboardingImage.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            onboardingTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            onboardingTitle.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            onboardingSubTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            onboardingSubTitle.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            onboardingPage.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            onboardingNext.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
    }
    
    func updateContentForPage(_ pageonbo: Int) {
        let sectionData = onboardingList[pageonbo]
        let titleText = sectionData.onboardingTitle.uppercased()
        let attributedString = NSMutableAttributedString(string: titleText)

        let colorAttribute = [NSAttributedString.Key.foregroundColor: UIColor(named: "blueCust")]

        let gamesRange = (titleText as NSString).range(of: "GAMES")
        if gamesRange.location != NSNotFound {
            attributedString.addAttributes(colorAttribute as [NSAttributedString.Key : Any], range: gamesRange)
        }
        
        let nowRange = (titleText as NSString).range(of: "NOW")
        if nowRange.location != NSNotFound {
            attributedString.addAttributes(colorAttribute as [NSAttributedString.Key : Any], range: nowRange)
        }
        
        DispatchQueue.main.async {
            self.onboardingTitle.attributedText = attributedString
        }
        
        onboardingSubTitle.text = sectionData.onboardingSubTitle
        onboardingImage.image = UIImage(named: sectionData.onboardingImage)
        
        switch pageonbo {
        case onboardingList.count - 1:
            onboardingNext.setImage(UIImage(named: "start"), for: .normal)
        case onboardingList.count - 2:
            onboardingNext.setImage(UIImage(named: "next"), for: .normal)
                if UIScreen.main.bounds.size.height >= 812 {
                    NSLayoutConstraint.activate([
                        onboardingImage.topAnchor.constraint(equalTo: view.topAnchor),
                    ])
                } else {
                    NSLayoutConstraint.activate([
                        onboardingImage.topAnchor.constraint(equalTo: view.topAnchor, constant: -60),
                    ])
                }
        default:
            onboardingNext.setImage(UIImage(named: "start"), for: .normal)
        }
    }
    
    @objc func sectionNextClapped() {
        if sectionPageList < onboardingList.count - 1 {
            sectionPageList += 1
        } else {
//            let homeVC = HomeViewController()
//            homeVC.navigationItem.hidesBackButton = true
//            self.navigationController?.pushViewController(homeVC, animated: true)
        }
        
        updateContentForPage(sectionPageList)
        onboardingPage.currentPage = sectionPageList
    }
    
    private func setupNavBar() {
        let sectionSkipBarButton = UIBarButtonItem(customView: onboardingSkip)
        navigationItem.rightBarButtonItem = sectionSkipBarButton
        onboardingSkip.addTarget(self, action: #selector(skipButtonTapped), for: .touchUpInside)
    }

    @objc private func skipButtonTapped() {
//        let homeVC = HomeViewController()
//        homeVC.navigationItem.hidesBackButton = true
//        self.navigationController?.pushViewController(homeVC, animated: true)
    }
}

