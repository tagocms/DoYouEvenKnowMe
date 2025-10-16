//
//  QuizViewController.swift
//  Nano02
//
//  Created by Tiago Camargo Maciel dos Santos on 26/09/25.
//

import UIKit

class QuizViewController: UIViewController {
    typealias Question = Quiz.Question
    let quizView = QuizView()
    let questionNumber: Int
    var correctAnswers: Int
    let question: Question
    var quizModel: Quiz
    
    // MARK: - Lifecycle
    override func loadView() {
        super.loadView()
        view = quizView
        title = "Question \(questionNumber)"
        navigationItem.backButtonDisplayMode = .generic
        navigationItem.backAction = UIAction { _ in
            self.returnToRoot()
        }
        quizView.backgroundColor = UIColor(from: quizModel.colorPallete.background ?? "") ?? .systemBackground
        quizView.questionLabel.textColor = UIColor(from: quizModel.colorPallete.foreground ?? "") ?? .label
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupContent()
    }
    
    // MARK: - Initializers
    init(quizModel: Quiz, questionNumber: Int = 1, correctAnswers: Int = 0) {
        self.quizModel = quizModel
        self.questionNumber = questionNumber
        self.correctAnswers = correctAnswers
        if questionNumber > 0 && questionNumber <= quizModel.questions.count {
            self.question = quizModel.questions[questionNumber - 1]
        } else {
            fatalError("Question number out of bounds")
        }
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Helper functions
    func setupContent() {
        quizView.questionLabel.text = question.description
        quizView.imageView.image = UIImage(data: question.image ?? Data())
        if quizView.imageView.image == nil {
            quizView.imageHeightConstraint.isActive = false
        }
        
        for quizOption in question.answers {
            let quizOptionButton = QuizOptionButton()
            quizOptionButton.translatesAutoresizingMaskIntoConstraints = false
            quizOptionButton.setTitle(quizOption.description, for: .normal)
            quizOptionButton.configuration?.baseBackgroundColor = UIColor(from: quizModel.colorPallete.button ?? "") ?? .systemBlue
            quizOptionButton.id = quizOption.id
            quizOptionButton.addTarget(self, action: #selector(handleQuizOptionButtonTapped(_:)), for: .touchUpInside)
            
            quizView.answerStackView.addArrangedSubview(quizOptionButton)
        }
    }
    
    // MARK: - Intent functions
    func returnToRoot() {
        navigationController?.popToRootViewController(animated: true)
    }
    
    @objc func handleQuizOptionButtonTapped(_ sender: QuizOptionButton) {
        
        if let buttons = quizView.answerStackView.arrangedSubviews as? [QuizOptionButton] {
            UIView.transition(with: sender, duration: 0.5, options: .transitionCrossDissolve) {
                if sender.id == self.question.correctAnswerId {
                    sender.configuration?.baseBackgroundColor = UIColor(from: self.quizModel.colorPallete.correctAnswer ?? "") ?? .systemGreen
                    
                    self.correctAnswers += 1
                } else {
                    sender.configuration?.baseBackgroundColor = UIColor(from: self.quizModel.colorPallete.wrongAnswer ?? "") ?? .systemRed
                }
            }
                              
            for button in buttons {
                button.removeTarget(self, action: nil, for: .touchUpInside)
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                if self.questionNumber < self.quizModel.questions.count {
                    self.navigationController?.pushViewController(QuizViewController(quizModel: self.quizModel, questionNumber: self.questionNumber + 1, correctAnswers: self.correctAnswers), animated: true)
                } else {
                    self.navigationController?.pushViewController(EndQuizViewController(quizModel: self.quizModel, correctAnswers: self.correctAnswers), animated: true)
                }
            }
        }
    }
    
}
