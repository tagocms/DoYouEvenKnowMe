//
//  QuestionViewController.swift
//  Nano02
//
//  Created by Tiago Camargo Maciel dos Santos on 25/09/25.
//

import UIKit

class QuestionViewController: UIViewController {
    typealias Question = Quiz.Question
    var quizModel: Quiz
    var question: Question
    
    let questionView = QuestionView()
    let imagePickerController = UIImagePickerController()
    var questionNumber: Int
    
    
    // MARK: - Lifecycle
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
        imagePickerController.delegate = self
    }
    
    // MARK: - Initializers
    init(quizModel: Quiz, questionNumber: Int = 1) {
        self.quizModel = quizModel
        self.questionNumber = questionNumber
        self.question = Question(id: questionNumber, answers: [])
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Functions
    @objc func checkBox(_ sender: CheckmarkButton) {
        let senderCurrentState = sender.isChecked
        
        for cell in questionView.alternativesPromptTableView.visibleCells {
            if let convertedCell = cell as? AlternativeTableViewCell {
                if senderCurrentState {
                    convertedCell.checkMarkButton.isChecked = false
                    convertedCell.checkMarkButton.isEnabled = true
                } else {
                    convertedCell.checkMarkButton.isChecked = false
                    convertedCell.checkMarkButton.isEnabled = false
                }
                
            }
        }
        
        if senderCurrentState {
            sender.isChecked = false
            question.correctAnswerId = nil
        } else {
            sender.isChecked = true
            sender.isEnabled = true
            
            // TODO: - Add logic to set this button as the answer to the question
            question.correctAnswerId = sender.id
            
            print("Correct Answer: \(question.correctAnswerId ?? -1)")
        }
        
    }
    
    @objc func openImageSelector() {
        present(imagePickerController, animated: true)
    }
    
}

// MARK: - Make the QuestionViewController a delegate and datasource to Tables
extension QuestionViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == questionView.inputPromptTableView {
            1
        } else if tableView == questionView.alternativesPromptTableView {
            4
        } else if tableView == questionView.imagePromptTableView {
            1
        } else {
            0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == questionView.inputPromptTableView {
            guard let inputPromptCell = tableView.dequeueReusableCell(withIdentifier: InputTableViewCell.identifier, for: indexPath) as? InputTableViewCell else {
                fatalError("Unable to dequeue cell.")
            }
            inputPromptCell.labelView.text = "Prompt"
            inputPromptCell.textField.placeholder = "Your prompt"
            
            return inputPromptCell
        } else if tableView == questionView.alternativesPromptTableView {
            // TODO: - Add input table cells with checkmarks
            guard let alternativeCell = tableView.dequeueReusableCell(withIdentifier: AlternativeTableViewCell.identifier, for: indexPath) as? AlternativeTableViewCell else {
                fatalError("Unable to dequeue cell.")
            }
            
            alternativeCell.checkMarkButton.addTarget(self, action: #selector(checkBox(_:)), for: .touchUpInside)
            alternativeCell.checkMarkButton.id = indexPath.row + 1
            
            return alternativeCell
        } else if tableView == questionView.imagePromptTableView {
            // TODO: - Add a photo selection table cell
            guard let imagePromptCell = tableView.dequeueReusableCell(withIdentifier: ImagePromptTableViewCell.identifier, for: indexPath) as? ImagePromptTableViewCell else {
                fatalError("Unable to dequeue cell.")
            }
            imagePromptCell.selectPhotoButton.addTarget(self, action: #selector(openImageSelector), for: .touchUpInside)
            
            return imagePromptCell
        } else {
            return UITableViewCell()
        }
    }
    
    
}

// MARK: - Add delegate properties to QuestionViewController for ImagePicker
extension QuestionViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let imageURL = info[UIImagePickerController.InfoKey.imageURL] as? URL {
            question.image = try? Data(contentsOf: imageURL)
            if let imageData = question.image {
                questionView.imageSelected.image = UIImage(data: imageData)
            }
            
            // TODO: - Correct image not loading bug
        }
        
        dismiss(animated: true)
    }
}
