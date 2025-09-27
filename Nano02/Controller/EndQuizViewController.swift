//
//  EndQuizViewController.swift
//  Nano02
//
//  Created by Tiago Camargo Maciel dos Santos on 27/09/25.
//

import UIKit

class EndQuizViewController: UIViewController {
    let endQuizView = EndQuizView()
    var quizModel: Quiz
    let correctAnswers: Int
    var respondentName: String? {
        didSet {
            let cleanedRespondentName = respondentName?.trimmingCharacters(in: .whitespacesAndNewlines) ?? ""
            if !cleanedRespondentName.isEmpty {
                endQuizView.saveScoreToLeaderboardButton.isEnabled = true
            } else {
                endQuizView.saveScoreToLeaderboardButton.isEnabled = false
            }
        }
    }
    var endOfQuizMessage: String {
        let questionsCount = quizModel.questions.count
        let percentageOfAnswers = Double(correctAnswers) / Double(questionsCount)
        
        if percentageOfAnswers <= 0.5 {
            return "You should know me better..."
        } else if percentageOfAnswers <= 0.7 {
            return "You know me OK... I guess..."
        } else if percentageOfAnswers <= 0.9 {
            return "You know me quite well..."
        } else {
            return "So you do know me!!!"
        }
    }
    
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
        
        endQuizView.onReturnToMenuButtonPressed = returnToRoot
        endQuizView.onSaveScoreToLeaderBoardButtonPressed = saveToLeaderboard
        
        endQuizView.nameInputTableView.delegate = self
        endQuizView.nameInputTableView.dataSource = self
        
        endQuizView.scoreLabel.text = "Score: \(correctAnswers)/\(quizModel.questions.count)"
        endQuizView.paragraphText.text = endOfQuizMessage
        
        endQuizView.paragraphText.textColor = UIColor(from: self.quizModel.colorPallete.foreground ?? "") ?? .label
        endQuizView.scoreLabel.textColor = UIColor(from: self.quizModel.colorPallete.foreground ?? "") ?? .label
        endQuizView.backgroundColor = UIColor(from: self.quizModel.colorPallete.background ?? "") ?? .systemBackground
        endQuizView.saveScoreToLeaderboardButton.configuration?.baseBackgroundColor = UIColor(from: self.quizModel.colorPallete.button ?? "") ?? .systemBlue
        endQuizView.returnToMenuButton.configuration?.baseBackgroundColor = UIColor(from: self.quizModel.colorPallete.button ?? "") ?? .systemBlue
        endQuizView.nameInputTableView.backgroundColor = UIColor(from: self.quizModel.colorPallete.background ?? "") ?? .systemBackground
        
    }
    
    // MARK: - Intent functions
    func returnToRoot() {
        navigationController?.popToRootViewController(animated: true)
    }
    
    func saveToLeaderboard() {
        if let respondentName {
            quizModel.respondentsScore[respondentName] = correctAnswers
            
            if let index = QuizData.shared.quizzes.firstIndex(where: { $0.id == quizModel.id }) {
                QuizData.shared.quizzes[index] = quizModel
            }
        } else {
            print("Unable to save to leaderboard.")
        }
    }
}

// MARK: - Extension for the table view delegate functions
extension EndQuizViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = InputTableViewCell()
        cell.textField.placeholder = "Enter your name"
        cell.labelView.text = "Name"
        cell.textField.delegate = self
        
        cell.textField.textColor = UIColor(from: self.quizModel.colorPallete.foreground ?? "") ?? .label
        cell.labelView.textColor = UIColor(from: self.quizModel.colorPallete.foreground ?? "") ?? .label
        cell.backgroundColor = UIColor(from: self.quizModel.colorPallete.background ?? "") ?? .systemBackground
        
        return cell
    }
}

// MARK: - Extension for the text field delegate functions
extension EndQuizViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        respondentName = textField.text
    }
}
