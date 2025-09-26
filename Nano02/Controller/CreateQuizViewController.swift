//
//  CreateQuizViewController.swift
//  Nano02
//
//  Created by Tiago Camargo Maciel dos Santos on 22/09/25.
//

import UIKit

class CreateQuizViewController: UIViewController {
    let quizView = CreateQuizView()
    var quizModel = Quiz()
    
    let colorTypes = ["Foreground", "Background", "Correct Answer", "Wrong Answer", "Button"]
    
    // MARK: - Loading of the View
    override func loadView() {
        super.loadView()
        view = quizView
        title = "Your Quiz"
        navigationItem.largeTitleDisplayMode = .never
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        quizView.nameInputTableView.delegate = self
        quizView.nameInputTableView.dataSource = self
        
        quizView.colorPalleteTableView.delegate = self
        quizView.colorPalleteTableView.dataSource = self
        
        quizView.onPressButton = navigateToNextView
    }
    
    // MARK: - Functions
    func updateQuizTitle(to newText: String) {
        quizModel.title = newText
        checkFieldsFilled()
    }
    
    @objc func colorWellValueChanged(_ sender: UIColorWell) {
        let selectedColor = sender.selectedColor?.hexStringRepresentation() ?? "#000000"
        
        switch sender.title {
        case "Foreground":
            quizModel.colorPallete.foreground = selectedColor
        case "Background":
            quizModel.colorPallete.background = selectedColor
        case "Correct Answer":
            quizModel.colorPallete.correctAnswer = selectedColor
        case "Wrong Answer":
            quizModel.colorPallete.wrongAnswer = selectedColor
        case "Button":
            quizModel.colorPallete.button = selectedColor
        default:
            break
        }
        checkFieldsFilled()
    }
    
    func navigateToNextView() {
        navigationController?.pushViewController(QuestionViewController(quizModel: quizModel), animated: true)
    }
    
    func checkFieldsFilled() {
        if quizModel.title != nil && quizModel.title?.trimmingCharacters(in: .whitespacesAndNewlines) != "" {
            quizView.nextButton.isEnabled = true
        } else {
            quizView.nextButton.isEnabled = false
        }
    }
}

// MARK: - TextField delegate
extension CreateQuizViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        let cell = quizView.nameInputTableView.cellForRow(at: IndexPath(row: 0, section: 0)) as? InputTableViewCell
        if textField == cell?.textField {
            if let text = textField.text {
                updateQuizTitle(to: text)
            }
        }
    }
}

// MARK: - TableView delegate
extension CreateQuizViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == quizView.nameInputTableView {
            guard let inputCell = tableView.dequeueReusableCell(withIdentifier: InputTableViewCell.identifier, for: indexPath) as? InputTableViewCell else {
                fatalError("Unable to dequeue InputTableViewCell")
            }
            inputCell.textField.delegate = self
            inputCell.textField.placeholder = "Your Quiz"
            inputCell.labelView.text = "Name"
            
            return inputCell
        } else if tableView == quizView.colorPalleteTableView {
            guard let colorPalleteCell = tableView.dequeueReusableCell(withIdentifier: ColorPalleteTableViewCell.identifier, for: indexPath) as? ColorPalleteTableViewCell else {
                fatalError("Unable to dequeue InputTableViewCell")
            }
            
            colorPalleteCell.colorWell.addTarget(self, action: #selector(colorWellValueChanged(_:)), for: .valueChanged)
            colorPalleteCell.colorWell.title = colorTypes[indexPath.row]
            colorPalleteCell.labelView.text = colorTypes[indexPath.row]
            
            return colorPalleteCell
        } else {
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == quizView.nameInputTableView {
            1
        } else {
            colorTypes.count
        }
    }
}
