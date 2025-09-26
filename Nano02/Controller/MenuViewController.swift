//
//  ViewController.swift
//  Nano02
//
//  Created by Tiago Camargo Maciel dos Santos on 22/09/25.
//

import UIKit

class MenuViewController: UIViewController {
    private let menuView = MenuView()
    private let quizData = QuizData.shared
    
    override func loadView() {
        super.loadView()
        view = menuView
        title = "Do you even know me?"
        navigationItem.backButtonDisplayMode = .generic
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        menuView.onPressButton = navigateToNextView
        
        menuView.savedQuizzesTableView.delegate = self
        menuView.savedQuizzesTableView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        menuView.savedQuizzesTableView.reloadData()
    }
    
    func navigateToNextView() {
        navigationController?.pushViewController(CreateQuizViewController(), animated: true)
    }
}

// MARK: - Extension to MenuViewController to add table view delegate and datasource conformance

extension MenuViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        quizData.quizzes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = quizData.quizzes[indexPath.row].title
        cell.accessoryType = .disclosureIndicator
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        quizData.quizzes.count >= 1 ? "YOUR QUIZZES" : nil
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let deleteAction = UIContextualAction(style: .destructive, title: nil) {_,_,completion in
            self.quizData.quizzes.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
            completion(true)
        }
        deleteAction.image = UIImage(systemName: "trash")
        deleteAction.backgroundColor = .systemRed
        
        let config = UISwipeActionsConfiguration(actions: [deleteAction])
        
        return config
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let quizViewController = StartQuizViewController(quizModel: quizData.quizzes[indexPath.row])
        navigationController?.pushViewController(quizViewController, animated: true)
    }
}
