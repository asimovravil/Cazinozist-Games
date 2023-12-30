//
//  DictionaryViewController.swift
//  Cazinozist Games
//
//  Created by Ravil on 30.12.2023.
//

import UIKit

class DictionaryViewController: UIViewController {

    let scrollView = UIScrollView()
    let dictionary = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        cgUI()
        cgBar()
        view.backgroundColor = UIColor(named: "backgroundCust")
    }
    
    private func cgUI() {
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(scrollView)
        scrollView.addSubview(dictionary)
        
        dictionary.image = UIImage(named: "dictionary")
        dictionary.layer.masksToBounds = true
        dictionary.contentMode = .scaleAspectFit
        dictionary.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            dictionary.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 10),
            dictionary.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            dictionary.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -16)
        ])
    }
    
    private func cgBar() {
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        
        let titleLabel = UILabel()
        titleLabel.text = "DICTIONARY"
        titleLabel.textColor = UIColor(named: "blueCust")
        titleLabel.font = UIFont(name: "Archivo-Medium", size: 28)
        navigationItem.titleView = titleLabel
    }
}
