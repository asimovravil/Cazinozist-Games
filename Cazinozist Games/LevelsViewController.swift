//
//  LevelsViewController.swift
//  QXTrading
//
//  Created by Ravil on 01.12.2023.
//

import UIKit

class LevelsViewController: UIViewController {
    
    let tableView = UITableView(frame: .zero, style: .plain)
    let arrowLeft = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(named: "backgroundCust")
        cgUI()
        cgBar()
    }
    
    
    private func cgUI() {
        tableView.register(LevelsCell.self, forCellReuseIdentifier: LevelsCell.reuseID)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = .clear
        tableView.rowHeight = 93
        tableView.showsVerticalScrollIndicator = false
        tableView.separatorStyle = .none
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)
        
        arrowLeft.setImage(UIImage(named: "arrowLeft"), for: .normal)
        arrowLeft.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 16),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
    
    private func cgBar() {
        let titleLabel = UILabel()
        titleLabel.text = "Choose a level"
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

extension LevelsViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: LevelsCell.reuseID, for: indexPath) as? LevelsCell else {
            fatalError("Could not cast to DaysCell")
        }
        
        cell.labelNumber.text = "Level \(indexPath.row + 1)"
        
        if indexPath.row == 0 {
            cell.cellImage.image = UIImage(named: "arrowRight")
            cell.isUserInteractionEnabled = true
            cell.backgroundColor = .clear
        } else {
            cell.isUserInteractionEnabled = false 
        }
        
        cell.selectionStyle = .none
        cell.backgroundColor = .clear
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let dayCategoryVC = RulesViewController()
        navigationController?.pushViewController(dayCategoryVC, animated: true)
    }
}
