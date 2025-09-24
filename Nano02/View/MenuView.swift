//
//  MenuView.swift
//  Nano02
//
//  Created by Tiago Camargo Maciel dos Santos on 24/09/25.
//

import UIKit

class MenuView: UIView {
    var onPressButton: () -> Void = { }
    
    // MARK: - UI Elements
    lazy private var paragraphText: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Create quizzes to test your friends on their knowledge of you!"
        label.numberOfLines = 0
        
        return label
    }()
    
    lazy private var createQuizButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Create a Quiz", for: .normal)
        button.configuration = .filled()
        button.configuration?.buttonSize = .large
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
        addSubview(createQuizButton)
    }
    
    // MARK: - Constraints
    func setupConstraints() {
        // Paragraph text constraints
        NSLayoutConstraint.activate([
            paragraphText.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            paragraphText.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            paragraphText.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
        ])
        
        // Button constraints
        NSLayoutConstraint.activate([
            createQuizButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            createQuizButton.topAnchor.constraint(equalTo: paragraphText.bottomAnchor, constant: 16),
        ])
    }
    
    // MARK: - Button Action
    @objc func didPressButton() {
        onPressButton()
    }
}
