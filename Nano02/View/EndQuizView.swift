//
//  EndQuizView.swift
//  Nano02
//
//  Created by Tiago Camargo Maciel dos Santos on 27/09/25.
//

import UIKit

class EndQuizView: UIView {
    var onReturnToMenuButtonPressed: () -> Void = { }
    var onSaveScoreToLeaderBoardButtonPressed: () -> Void = { }
    
    // MARK: - UI Elements
    lazy var paragraphText: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = ""
        label.numberOfLines = 0
        
        return label
    }()
    
    var numberOfQuestions: InputLabel = {
        let label = InputLabel()
        label.text = ""
        
        return label
    }()
    
    lazy var saveScoreToLeaderboardButton: CustomLargeButton = {
        let button = CustomLargeButton()
        button.setTitle("Save score to Leaderboard", for: .normal)
        button.isEnabled = true
        button.addTarget(self, action: #selector(didPressButton(_:)), for: .touchUpInside)
        
        return button
    }()
    
    lazy var returnToMenuButton: CustomLargeButton = {
        let button = CustomLargeButton()
        button.setTitle("Save attempt", for: .normal)
        button.isEnabled = true
        button.addTarget(self, action: #selector(didPressButton(_:)), for: .touchUpInside)
        
        return button
    }()
    
    // MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemBackground
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup UI Elements and Constraints
    func setupUI() {
        addSubview(paragraphText)
        addSubview(numberOfQuestions)
        addSubview(saveScoreToLeaderboardButton)
        addSubview(returnToMenuButton)
        
        NSLayoutConstraint.activate([
            paragraphText.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16),
            paragraphText.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            paragraphText.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            
            numberOfQuestions.topAnchor.constraint(equalTo: paragraphText.bottomAnchor, constant: 10),
            numberOfQuestions.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            numberOfQuestions.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            
            saveScoreToLeaderboardButton.topAnchor.constraint(equalTo: numberOfQuestions.bottomAnchor, constant: 16),
            saveScoreToLeaderboardButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            returnToMenuButton.topAnchor.constraint(equalTo: saveScoreToLeaderboardButton.bottomAnchor, constant: 16),
            returnToMenuButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            ])
    }
    
    // MARK: - Target functions
    @objc func didPressButton(_ sender: CustomLargeButton) {
        if sender == returnToMenuButton {
            onReturnToMenuButtonPressed()
        } else {
            onSaveScoreToLeaderBoardButtonPressed()
        }
        
    }
}
