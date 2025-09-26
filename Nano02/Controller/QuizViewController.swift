//
//  QuizViewController.swift
//  Nano02
//
//  Created by Tiago Camargo Maciel dos Santos on 26/09/25.
//

import UIKit

class QuizViewController: UIViewController {
    var quizModel: Quiz
    
    // MARK: - Lifecycle
    override func loadView() {
        super.loadView()
        view.backgroundColor = .systemBackground
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Initializers
    init(quizModel: Quiz) {
        self.quizModel = quizModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
