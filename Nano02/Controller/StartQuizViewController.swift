//
//  QuizViewController.swift
//  Nano02
//
//  Created by Tiago Camargo Maciel dos Santos on 26/09/25.
//

import UIKit

class StartQuizViewController: UIViewController {
    let startQuizView = StartQuizView()
    var quizModel: Quiz
    
    // MARK: - Lifecycle
    override func loadView() {
        super.loadView()
        view = startQuizView
        title = "\(quizModel.title ?? "no title")"
        navigationItem.backButtonDisplayMode = .generic
        navigationItem.largeTitleDisplayMode = .never
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        startQuizView.paragraphText.text = quizModel.description ?? "Quiz contains no description."
        startQuizView.numberOfQuestions.text = "Number of questions: \(quizModel.questions.count)"
        startQuizView.onPressButton = startQuiz
    }
    
    // MARK: - Initializers
    init(quizModel: Quiz) {
        self.quizModel = quizModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Intent Functions
    func startQuiz() {
        navigationController?.pushViewController(QuizViewController(quizModel: quizModel), animated: true)
    }
}
