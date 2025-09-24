//
//  CreateQuizView.swift
//  Nano02
//
//  Created by Tiago Camargo Maciel dos Santos on 24/09/25.
//

import UIKit

class CreateQuizView: UIView {
    var onTextInput: (String) -> Void = { _ in }
    var quizData = [Quiz]()
    
    // MARK: - UI Elements
    lazy private var quizNameInputField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.returnKeyType = .done
        textField.autocapitalizationType = .words
        textField.autocorrectionType = .no
        textField.delegate = self
        
        textField.backgroundColor = .systemGray6
        textField.layer.cornerRadius = 8
        
        return textField
    }()
    
    lazy private var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        
        return tableView
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
        addSubview(quizNameInputField)
        addSubview(tableView)
    }
    
    // MARK: - Constraints
    func setupConstraints() {
        // Constraints for input field
        NSLayoutConstraint.activate([
            quizNameInputField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            quizNameInputField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            quizNameInputField.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16),
        ])
        
        // Constraints for table field
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            tableView.topAnchor.constraint(equalTo: quizNameInputField.bottomAnchor, constant: 16),
            tableView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.5)
        ])
    }
}

// MARK: - TextField delegate
extension CreateQuizView: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if let text = textField.text {
            onTextInput(text)
        }
    }
}

// MARK: - TableView delegate (can be better)
extension CreateQuizView: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = quizData[indexPath.row].title
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        quizData.count
    }
}
