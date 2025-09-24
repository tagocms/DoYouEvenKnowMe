//
//  ViewController.swift
//  Nano02
//
//  Created by Tiago Camargo Maciel dos Santos on 22/09/25.
//

import UIKit

class MenuViewController: UIViewController {
    private let menuView = MenuView()
    
    override func loadView() {
        view = menuView
        title = "Do you even know me?"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        menuView.onPressButton = navigateToNextView
    }
    
    func navigateToNextView() {
        navigationController?.pushViewController(CreateQuizViewController(), animated: true)
    }
}

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
            createQuizButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            createQuizButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            createQuizButton.topAnchor.constraint(equalTo: paragraphText.bottomAnchor, constant: 16),
        ])
    }
    
    // MARK: - Constraints
    @objc func didPressButton() {
        onPressButton()
    }
}
