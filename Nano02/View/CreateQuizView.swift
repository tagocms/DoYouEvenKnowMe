//
//  CreateQuizView.swift
//  Nano02
//
//  Created by Tiago Camargo Maciel dos Santos on 24/09/25.
//

import UIKit

class CreateQuizView: UIView {
    
    // MARK: - UI Elements
    var quizNameInputField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.returnKeyType = .done
        textField.autocapitalizationType = .words
        textField.autocorrectionType = .no
        
        textField.backgroundColor = .systemGray6
        textField.layer.cornerRadius = 8
        
        return textField
    }()
    
    var inputLabelName = createInputLabel("Choose the name for your Quiz")
    var inputLabelColor = createInputLabel("Choose the Color Pallete for your Quiz")
    
    var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
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
    
    
    // MARK: - Custom components initialization
    static func createInputLabel(_ text: String) -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = text
        label.font = .systemFont(ofSize: 17, weight: .semibold)
        
        return label
    }
    
    // MARK: - Adding subviews
    func addSubviews() {
        addSubview(quizNameInputField)
        addSubview(tableView)
        addSubview(inputLabelName)
        addSubview(inputLabelColor)
    }
    
    // MARK: - Constraints
    func setupConstraints() {
        // Constraints for name label
        NSLayoutConstraint.activate([
            inputLabelName.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            inputLabelName.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            inputLabelName.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16)
        ])
        
        // Constraints for input field
        NSLayoutConstraint.activate([
            quizNameInputField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            quizNameInputField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            quizNameInputField.topAnchor.constraint(equalTo: inputLabelName.bottomAnchor, constant: 10),
        ])
        
        // Constraints for table label
        NSLayoutConstraint.activate([
            inputLabelColor.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            inputLabelColor.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            inputLabelColor.topAnchor.constraint(equalTo: quizNameInputField.bottomAnchor, constant: 16)
        ])
        
        // Constraints for table field
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            tableView.topAnchor.constraint(equalTo: inputLabelColor.bottomAnchor, constant: 10),
            tableView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.5)
        ])
    }
}
