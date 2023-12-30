//
//  MenuViewController.swift
//  Cazinozist Games
//
//  Created by Ravil on 30.12.2023.
//

import UIKit
import StoreKit

class MenuViewController: UIViewController {

    let settings1 = UIButton()
    let settings2 = UIButton()
    let settings3 = UIButton()
    let settings4 = UIButton()
    let checkMark = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor(named: "backgroundCust")
        setupValue()
        valueConstraints()
        cgBar()
    }
    
    private func setupValue() {
        view.addSubview(settings1)
        view.addSubview(settings2)
        view.addSubview(settings3)
        view.addSubview(settings4)
        
        settings1.setImage(UIImage(named: "set1"), for: .normal)
        settings1.translatesAutoresizingMaskIntoConstraints = false
        
        settings2.setImage(UIImage(named: "set2"), for: .normal)
        settings2.translatesAutoresizingMaskIntoConstraints = false
        
        settings3.setImage(UIImage(named: "set3"), for: .normal)
        settings3.translatesAutoresizingMaskIntoConstraints = false
        
        settings4.setImage(UIImage(named: "set4"), for: .normal)
        settings4.translatesAutoresizingMaskIntoConstraints = false
        
        checkMark.image = UIImage(named: "checkmark")
        checkMark.layer.masksToBounds = true
        checkMark.contentMode = .scaleAspectFit
        checkMark.translatesAutoresizingMaskIntoConstraints = false
        checkMark.isHidden = true
        view.addSubview(checkMark)

        settings1.addTarget(self, action: #selector(settings1Metod), for: .touchUpInside)
        settings2.addTarget(self, action: #selector(settings2Metod), for: .touchUpInside)
        settings3.addTarget(self, action: #selector(settings3Metod), for: .touchUpInside)
        settings4.addTarget(self, action: #selector(settings4Metod), for: .touchUpInside)
    }
    
    private func valueConstraints() {
        NSLayoutConstraint.activate([
            settings1.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            settings2.topAnchor.constraint(equalTo: settings1.bottomAnchor),
            settings2.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            settings3.topAnchor.constraint(equalTo: settings2.bottomAnchor),
            settings3.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            settings4.topAnchor.constraint(equalTo: settings3.bottomAnchor),
            settings4.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            checkMark.trailingAnchor.constraint(equalTo: settings1.trailingAnchor, constant: -16),
            checkMark.centerYAnchor.constraint(equalTo: settings1.centerYAnchor),
        ])
        
        if UIScreen.main.bounds.size.height >= 812 {
            NSLayoutConstraint.activate([
                settings1.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            ])
        } else {
            NSLayoutConstraint.activate([
                settings1.topAnchor.constraint(equalTo: view.topAnchor, constant: 80),
            ])
        }
    }
    
    private func cgBar() {
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        
        let titleLabel = UILabel()
        titleLabel.text = "Menu"
        titleLabel.textColor = UIColor(named: "blueCust")
        titleLabel.font = UIFont(name: "Archivo-Medium", size: 28)
        navigationItem.titleView = titleLabel
    }
    
    @objc private func settings1Metod() {
        if checkMark.isHidden {
            checkMark.isHidden = false
            checkMark.isUserInteractionEnabled = true
        } else {
            checkMark.isHidden = true
            checkMark.isUserInteractionEnabled = false
        }
    }

    
    @objc private func settings2Metod() {
        let textToShare = "Check out this awesome app!"
        let appURL = URL(string: "https://www.yourappstorelink.com")!
        
        let activityViewController = UIActivityViewController(activityItems: [textToShare, appURL], applicationActivities: nil)
        present(activityViewController, animated: true, completion: nil)
    }
    
    @objc func settings3Metod() {
        SKStoreReviewController.requestReview()
    }
    
    @objc func settings4Metod() {
        let controller = PrivacyController()
        self.navigationController?.pushViewController(controller, animated: true)
    }
}
