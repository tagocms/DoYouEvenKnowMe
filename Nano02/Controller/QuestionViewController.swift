//
//  QuestionViewController.swift
//  Nano02
//
//  Created by Tiago Camargo Maciel dos Santos on 25/09/25.
//

import PhotosUI
import UIKit

class QuestionViewController: UIViewController {
    typealias Question = Quiz.Question
    var quizModel: Quiz
    var question: Question {
        didSet {
            let descriptionCleaned = question.description?.trimmingCharacters(in: .whitespacesAndNewlines) ?? ""
            
            if !descriptionCleaned.isEmpty && question.correctAnswerId != nil {
                for answer in question.answers {
                    let alternativeCleaned = answer.description?.trimmingCharacters(in: .whitespacesAndNewlines) ?? ""
                    if  alternativeCleaned.isEmpty {
                        questionView.nextQuestionButton.isEnabled = false
                        questionView.finishQuizButton.isEnabled = false
                        return
                    }
                }
                if questionNumber < 10 {
                    questionView.nextQuestionButton.isEnabled = true
                }
                
                if questionNumber >= 3 && questionNumber <= 10 {
                    questionView.finishQuizButton.isEnabled = true
                }
                return
            }
            
            questionView.nextQuestionButton.isEnabled = false
            questionView.finishQuizButton.isEnabled = false
        }
    }
    
    let questionView = QuestionView()
    let imagePickerController = UIImagePickerController()
    let alertController = UIAlertController(title: "Finish Quiz", message: "If you finish the Quiz, you won't be able to come back to edit it later.", preferredStyle: .alert)
    let imageAlertController: UIAlertController =  {
        let alertController = UIAlertController(title: "Image access not granted", message: "If you wish to add an image to your question, please allow access to your photos library in Settings > Privacy > Photos.", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default))
        
        return alertController
    }()
    var questionNumber: Int
    
    
    // MARK: - Lifecycle
    override func loadView() {
        super.loadView()
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
        questionView.nextQuestionButton.addTarget(self, action: #selector(nextQuestion), for: .touchUpInside)
        questionView.finishQuizButton.addTarget(self, action: #selector(finishAndSaveQuiz), for: .touchUpInside)
        
        let saveQuiz = UIAlertAction(title: "OK", style: .default) { _ in
            self.saveQuizToDocumentsAndDismiss()
        }
        alertController.addAction(saveQuiz)

        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { _ in
            self.dismiss(animated: true)
        }
        alertController.addAction(cancelAction)
    }
    
    // MARK: - Initializers
    init(quizModel: Quiz, questionNumber: Int = 1) {
        self.quizModel = quizModel
        self.questionNumber = questionNumber
        self.question = Question(id: questionNumber, answers: [
            Question.Answer(id: 1, description: nil),
            Question.Answer(id: 2, description: nil),
            Question.Answer(id: 3, description: nil),
            Question.Answer(id: 4, description: nil),
        ])
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
        }
        
    }
    
    @objc func openImageSelector() {
        if PHPhotoLibrary.authorizationStatus(for: .readWrite) == .notDetermined {
            PHPhotoLibrary.requestAuthorization(for: .readWrite) { status in
                if status == .authorized {
                    print("Photo access authorized.")
                    DispatchQueue.main.async { [weak self] in
                        guard let self else { return }
                        present(imagePickerController, animated: true)
                    }
                }
            }
        } else {
            if PHPhotoLibrary.authorizationStatus(for: .readWrite) == .authorized {
                present(imagePickerController, animated: true)
            } else {
                present(imageAlertController, animated: true)
            }
        }
    }
    
    @objc func nextQuestion() {
        appendQuestionToQuizModel()
        
        if questionNumber < 10 {
            navigationController?.pushViewController(QuestionViewController(quizModel: quizModel, questionNumber: questionNumber + 1), animated: true)
        }
    }
    
    @objc func finishAndSaveQuiz() {
        if questionNumber >= 3 && questionNumber <= 10 {
            appendQuestionToQuizModel()
            // TODO: - Finish and save quiz to userdefaults
            present(alertController, animated: true)
        }
    }
    
    func appendQuestionToQuizModel() {
        if !quizModel.questions.contains(where: { $0.id == question.id}) {
            quizModel.questions.append(question)
        }
    }
    
    func saveQuizToDocumentsAndDismiss() {
        QuizData.shared.quizzes.append(quizModel)
        navigationController?.popToRootViewController(animated: true)
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
            inputPromptCell.textField.delegate = self
            
            return inputPromptCell
        } else if tableView == questionView.alternativesPromptTableView {
            // TODO: - Add input table cells with checkmarks
            guard let alternativeCell = tableView.dequeueReusableCell(withIdentifier: AlternativeTableViewCell.identifier, for: indexPath) as? AlternativeTableViewCell else {
                fatalError("Unable to dequeue cell.")
            }
            
            alternativeCell.textField.delegate = self
            alternativeCell.labelView.text = "Option \(indexPath.row + 1)"
            alternativeCell.textField.placeholder = "Add an option..."
            
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

// MARK: - Add delegate funcs to QuestionViewController for ImagePicker
extension QuestionViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let imageCell = questionView.imagePromptTableView.cellForRow(at: IndexPath(row: 0, section: 0)) as? ImagePromptTableViewCell {
            if let imageURL = info[UIImagePickerController.InfoKey.imageURL] as? URL {
                question.image = try? Data(contentsOf: imageURL)
                if let imageData = question.image {
                    questionView.imageSelected.image = UIImage(data: imageData)
                    imageCell.isImageSelected = true
                }
                
            } else {
                question.image = nil
                imageCell.isImageSelected = false
                questionView.imageSelected.image = nil
            }
        }
        
        dismiss(animated: true)
    }
}


// MARK: - Add delegate funcs to QuestionViewController for TextField
extension QuestionViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if let promptTextField = questionView.inputPromptTableView.cellForRow(at: IndexPath(row: 0, section: 0)) as? InputTableViewCell,
           let alternativeTextFieldCells = questionView.alternativesPromptTableView.visibleCells as? [AlternativeTableViewCell] {
            if textField == promptTextField.textField {
                question.description = textField.text
            } else {
                for index in alternativeTextFieldCells.indices {
                    if textField == alternativeTextFieldCells[index].textField {
                        question.answers[index].description = textField.text
                    }
                }
            }
        }
    }
}
