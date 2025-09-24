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
        
        quizView.quizNameInputField.delegate = self
        quizView.tableView.delegate = self
        quizView.tableView.dataSource = self
    }
    
    // MARK: - Updating the "text" variable
    func updateText(to newText: String) {
        text = newText
        print(newText)
    }
}

// MARK: - TextField delegate
extension CreateQuizViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if let text = textField.text {
            updateText(to: text)
        }
    }
}

// MARK: - TableView delegate
extension CreateQuizViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = quizData[indexPath.row].title
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        quizData.count
    }
}
