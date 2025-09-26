//
//  QuestionViewController.swift
//  Nano02
//
//  Created by Tiago Camargo Maciel dos Santos on 25/09/25.
//

import UIKit

class QuestionViewController: UIViewController {
    let questionView = QuestionView()
    var questionNumber: Int
    
    override func loadView() {
        view = questionView
        title = "Question \(questionNumber)"
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    init(questionNumber: Int = 1) {
        self.questionNumber = questionNumber
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
