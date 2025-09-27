//
//  QuizView.swift
//  Nano02
//
//  Created by Tiago Camargo Maciel dos Santos on 26/09/25.
//

import UIKit

class QuizView: UIView {
    // MARK: - UI Elements
    lazy var questionLabel: InputLabel = {
        let label = InputLabel()
        
        return label
    }()
    
    lazy var imageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill
        image.layer.cornerRadius = 12
        image.clipsToBounds = true
        
        return image
    }()
    
    lazy var answerStackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.spacing = 10
        
        return stack
    }()
    
    // MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Helper functions
    private func setupUI() {
        addSubview(questionLabel)
        addSubview(imageView)
        addSubview(answerStackView)
        
        // Constraints
        NSLayoutConstraint.activate([
            questionLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16),
            questionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            questionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            
            imageView.topAnchor.constraint(equalTo: questionLabel.bottomAnchor, constant: 10),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            imageView.heightAnchor.constraint(equalToConstant: 400),
            
            answerStackView.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 16),
            answerStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            answerStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
        ])
    }
    
}
