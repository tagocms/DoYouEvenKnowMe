//
//  QuestionViewController.swift
//  Nano02
//
//  Created by Tiago Camargo Maciel dos Santos on 25/09/25.
//

import UIKit

class QuestionViewController: UIViewController {
    let questionView = QuestionView()
    let questionNumber = 1
    
    override func loadView() {
        view = questionView
        title = "Question \(questionNumber)"
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

}
