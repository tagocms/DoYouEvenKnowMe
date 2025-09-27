//
//  EndQuizViewController.swift
//  Nano02
//
//  Created by Tiago Camargo Maciel dos Santos on 27/09/25.
//

import UIKit

class EndQuizViewController: UIViewController {
    let endQuizView = EndQuizView()
    let quizModel: Quiz
    let correctAnswers: Int
    
    // MARK: - Initializers
    init(quizModel: Quiz, correctAnswers: Int) {
        self.quizModel = quizModel
        self.correctAnswers = correctAnswers
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - Lifecycle
    override func loadView() {
        super.loadView()
        view = endQuizView
        title = quizModel.title
        navigationItem.backAction = UIAction { _ in
            self.returnToRoot()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        endQuizView.numberOfQuestions.text = "Score: \(correctAnswers)/\(quizModel.questions.count)"
        
        endQuizView.paragraphText.text = "End of quiz"
        
        endQuizView.paragraphText.textColor = UIColor(from: self.quizModel.colorPallete.foreground ?? "") ?? .label
        endQuizView.numberOfQuestions.textColor = UIColor(from: self.quizModel.colorPallete.foreground ?? "") ?? .label
        endQuizView.backgroundColor = UIColor(from: self.quizModel.colorPallete.background ?? "") ?? .systemBackground
        endQuizView.returnToMenuButton.configuration?.baseBackgroundColor = UIColor(from: self.quizModel.colorPallete.button ?? "") ?? .systemBlue
        
    }
    
    // MARK: - Intent functions
    func returnToRoot() {
        navigationController?.popToRootViewController(animated: true)
    }
}
