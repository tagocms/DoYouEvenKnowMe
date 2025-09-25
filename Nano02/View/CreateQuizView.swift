//
//  CreateQuizView.swift
//  Nano02
//
//  Created by Tiago Camargo Maciel dos Santos on 24/09/25.
//

import UIKit

class CreateQuizView: UIView {
    
    // MARK: - UI Elements
    var inputLabelName = createInputLabel("Choose the name for your Quiz")
    var inputLabelColor = createInputLabel("Choose the Color Pallete for your Quiz")
    
    var nameInputTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(InputTableViewCell.self, forCellReuseIdentifier: InputTableViewCell.identifier)
        
        
        return tableView
    }()
    
    var colorPalleteTableView: UITableView = {
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
        addSubview(inputLabelName)
        addSubview(nameInputTableView)
        addSubview(inputLabelColor)
        addSubview(colorPalleteTableView)
    }
    
    // MARK: - Constraints
    func setupConstraints() {
        // Constraints for name label
        NSLayoutConstraint.activate([
            inputLabelName.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            inputLabelName.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            inputLabelName.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16)
        ])
        
        // Constraints for input field TableView
        NSLayoutConstraint.activate([
            nameInputTableView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            nameInputTableView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            nameInputTableView.topAnchor.constraint(equalTo: inputLabelName.bottomAnchor, constant: 10),
            nameInputTableView.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        // Constraints for table label
        NSLayoutConstraint.activate([
            inputLabelColor.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            inputLabelColor.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            inputLabelColor.topAnchor.constraint(equalTo: nameInputTableView.bottomAnchor, constant: 16)
        ])
        
        // Constraints for Color Pallete Table View
        NSLayoutConstraint.activate([
            colorPalleteTableView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            colorPalleteTableView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            colorPalleteTableView.topAnchor.constraint(equalTo: inputLabelColor.bottomAnchor, constant: 10),
            colorPalleteTableView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.5)
        ])
    }
}
