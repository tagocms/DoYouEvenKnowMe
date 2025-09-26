//
//  QuestionView.swift
//  Nano02
//
//  Created by Tiago Camargo Maciel dos Santos on 25/09/25.
//

import UIKit

class QuestionView: UIView {
    // MARK: - UI Elements
    private var inputPromptLabel: InputLabel = {
        let label = InputLabel()
        label.text = "Describe the prompt for the question"
        
        return label
    }()
    
    var inputPromptTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        return tableView
    }()
    
    private var alternativesPromptLabel: InputLabel = {
        let label = InputLabel()
        label.text = "Describe the alternatives and mark the answer"
        
        return label
    }()
    
    var alternativesPromptTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        return tableView
    }()
    
    private var imagePromptLabel: InputLabel = {
        let label = InputLabel()
        label.text = "Select a photo"
        
        return label
    }()
    
    var imagePromptTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        return tableView
    }()
    
    private var nextQuestionButton: CustomLargeButton = {
        let button = CustomLargeButton()
        button.setTitle("Next question", for: .normal)
        button.isEnabled = false
        
        return button
    }()
    
    private var finishQuizButton: CustomLargeButton = {
        let button = CustomLargeButton()
        button.setTitle("Finish and Save Quiz", for: .normal)
        button.isEnabled = false
        
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
        addSubview(inputPromptLabel)
        addSubview(inputPromptTableView)
        addSubview(alternativesPromptLabel)
        addSubview(alternativesPromptTableView)
        addSubview(imagePromptLabel)
        addSubview(imagePromptTableView)
        addSubview(nextQuestionButton)
        addSubview(finishQuizButton)
    }
    
    // MARK: - Constraints
    func setupConstraints() {
        // Constraints for Input Prompt Label
        NSLayoutConstraint.activate([
            inputPromptLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            inputPromptLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            inputPromptLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16),
        ])
        
        // Constraints for Prompt Table View
        NSLayoutConstraint.activate([
            inputPromptTableView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            inputPromptTableView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            inputPromptTableView.topAnchor.constraint(equalTo: inputPromptLabel.bottomAnchor, constant: 10),
            inputPromptTableView.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        // Constraints for Alternatives Prompt Label
        NSLayoutConstraint.activate([
            alternativesPromptLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            alternativesPromptLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            alternativesPromptLabel.topAnchor.constraint(equalTo: inputPromptTableView.bottomAnchor, constant: 16),
        ])
        
        // Constraints for Alternatives Table View
        NSLayoutConstraint.activate([
            alternativesPromptTableView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            alternativesPromptTableView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            alternativesPromptTableView.topAnchor.constraint(equalTo: alternativesPromptLabel.bottomAnchor, constant: 10),
            alternativesPromptTableView.heightAnchor.constraint(equalToConstant: 220)
        ])
        
        // Constraints for Image Prompt Label
        NSLayoutConstraint.activate([
            imagePromptLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            imagePromptLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            imagePromptLabel.topAnchor.constraint(equalTo: alternativesPromptTableView.bottomAnchor, constant: 16),
        ])
        
        // Constraints for Image Table View
        NSLayoutConstraint.activate([
            imagePromptTableView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            imagePromptTableView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            imagePromptTableView.topAnchor.constraint(equalTo: imagePromptLabel.bottomAnchor, constant: 10),
            imagePromptTableView.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        // Constraints for Next Button
        NSLayoutConstraint.activate([
            nextQuestionButton.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 16),
            nextQuestionButton.topAnchor.constraint(equalTo: imagePromptTableView.bottomAnchor, constant: 16),
        ])
        
        // Constraints for Finish Quiz Button
        NSLayoutConstraint.activate([
            finishQuizButton.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 16),
            finishQuizButton.topAnchor.constraint(equalTo: nextQuestionButton.bottomAnchor, constant: 16),
        ])
    }
}
