//
//  LevelsCell.swift
//  QXTrading
//
//  Created by Ravil on 04.12.2023.
//

import UIKit

final class LevelsCell: UITableViewCell {
    
    static let reuseID = String(describing: LevelsCell.self)
    
    let labelNumber = UILabel()
    let labelQuestions = UILabel()
    let cellImage = UIImageView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        cgUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func cgUI() {
        labelNumber.text = "Level"
        labelNumber.textColor = .white
        labelNumber.numberOfLines = 0
        labelNumber.font = UIFont(name: "Archivo-Medium", size: 20)
        labelNumber.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(labelNumber)
        
        labelQuestions.text = "5 questions"
        labelQuestions.textColor = UIColor(named: "grayCust")
        labelQuestions.numberOfLines = 0
        labelQuestions.font = UIFont(name: "Archivo-Regular", size: 14)
        labelQuestions.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(labelQuestions)
        
        cellImage.image = UIImage(named: "close")
        cellImage.layer.masksToBounds = true
        cellImage.contentMode = .scaleAspectFit
        cellImage.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(cellImage)
        
        NSLayoutConstraint.activate([
            labelNumber.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 24),
            labelNumber.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 24),
            
            labelQuestions.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -24),
            labelQuestions.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 24),
            
            cellImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -24),
            cellImage.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
        ])
    }
}

