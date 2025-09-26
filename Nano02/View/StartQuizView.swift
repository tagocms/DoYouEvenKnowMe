//
//  QuizView.swift
//  Nano02
//
//  Created by Tiago Camargo Maciel dos Santos on 26/09/25.
//

import UIKit

class StartQuizView: UIView {
    var onPressButton: () -> Void = { }
    
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
    
    lazy var startQuizButton: CustomLargeButton = {
        let button = CustomLargeButton()
        button.setTitle("Start the Quiz", for: .normal)
        button.isEnabled = true
        button.addTarget(self, action: #selector(didPressButton), for: .touchUpInside)
        
        return button
    }()
    
    // MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemBackground
        
        addSubviews()
        setupConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Adding subviews
    func addSubviews() {
        addSubview(paragraphText)
        addSubview(numberOfQuestions)
        addSubview(startQuizButton)
    }
    
    // MARK: - Constraints
    func setupConstraints() {
        // Constraints
        NSLayoutConstraint.activate([
            paragraphText.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            paragraphText.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            paragraphText.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16),
            
            numberOfQuestions.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            numberOfQuestions.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            numberOfQuestions.topAnchor.constraint(equalTo: paragraphText.bottomAnchor, constant: 10),
            
            startQuizButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            startQuizButton.topAnchor.constraint(equalTo: numberOfQuestions.bottomAnchor, constant: 16),
        ])
    }
    
    // MARK: - Button Action
    @objc func didPressButton() {
        onPressButton()
    }
}
