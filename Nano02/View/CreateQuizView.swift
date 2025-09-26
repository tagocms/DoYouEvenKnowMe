//
//  CreateQuizView.swift
//  Nano02
//
//  Created by Tiago Camargo Maciel dos Santos on 24/09/25.
//

import UIKit

class CreateQuizView: UIView {
    var onPressButton: () -> Void = { }
    
    // MARK: - UI Elements
    var inputLabelName: InputLabel = {
        let label = InputLabel()
        label.text = "Choose the name for your Quiz"
        
        return label
    }()
    
    var inputLabelColor: InputLabel = {
        let label = InputLabel()
        label.text = "Choose the Color Pallete for your Quiz"
        
        return label
    }()
    
    var nameInputTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(InputTableViewCell.self, forCellReuseIdentifier: InputTableViewCell.identifier)
        
        
        return tableView
    }()
    
    var colorPalleteTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(ColorPalleteTableViewCell.self, forCellReuseIdentifier: ColorPalleteTableViewCell.identifier)
        
        return tableView
    }()
    
    lazy var nextButton: UIButton = {
        let button = CustomLargeButton()
        button.setTitle("Next", for: .normal)
        button.isEnabled = false
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
        addSubview(inputLabelName)
        addSubview(nameInputTableView)
        addSubview(inputLabelColor)
        addSubview(colorPalleteTableView)
        addSubview(nextButton)
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
            colorPalleteTableView.heightAnchor.constraint(equalToConstant: 220)
        ])
        
        // Constraints for Next Button
        NSLayoutConstraint.activate([
            nextButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            nextButton.topAnchor.constraint(equalTo: colorPalleteTableView.bottomAnchor, constant: 16),
        ])
    }
    
    // MARK: - Button Action
    @objc func didPressButton() {
        onPressButton()
    }
}
