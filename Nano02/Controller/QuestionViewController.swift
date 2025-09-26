//
//  QuestionViewController.swift
//  Nano02
//
//  Created by Tiago Camargo Maciel dos Santos on 25/09/25.
//

import UIKit

class QuestionViewController: UIViewController {
    var quizModel: Quiz
    
    let questionView = QuestionView()
    var questionNumber: Int
    
    override func loadView() {
        view = questionView
        title = "Question \(questionNumber)"
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        questionView.inputPromptTableView.delegate = self
        questionView.inputPromptTableView.dataSource = self
        questionView.alternativesPromptTableView.delegate = self
        questionView.alternativesPromptTableView.dataSource = self
        questionView.imagePromptTableView.delegate = self
        questionView.imagePromptTableView.dataSource = self
    }
    
    init(quizModel: Quiz, questionNumber: Int = 1) {
        self.quizModel = quizModel
        self.questionNumber = questionNumber
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension QuestionViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == questionView.inputPromptTableView {
            1
        } else if tableView == questionView.alternativesPromptTableView {
            4
        } else if tableView == questionView.imagePromptTableView {
            1
        } else {
            1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = "\(indexPath.row)"
        return cell
    }
    
    
}
