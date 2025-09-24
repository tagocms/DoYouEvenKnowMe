//
//  CreateQuizViewController.swift
//  Nano02
//
//  Created by Tiago Camargo Maciel dos Santos on 22/09/25.
//

import UIKit

class CreateQuizViewController: UIViewController {
    let quizView = CreateQuizView()
    let quizData = QuizData.sampleData
    var text: String = ""
    
    // MARK: - Loading of the View
    override func loadView() {
        super.loadView()
        view = quizView
        title = "Your Quiz"
        navigationItem.largeTitleDisplayMode = .never
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        quizView.onTextInput = updateText
        quizView.quizData = quizData
    }
    
    // MARK: - Updating the "text" variable
    func updateText(to newText: String) {
        text = newText
        print(newText)
    }
}
