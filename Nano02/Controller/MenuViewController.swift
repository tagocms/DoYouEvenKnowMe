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
        
        // TODO: - Make table update with new quiz created
        print("sla")
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
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        "YOUR QUIZZES"
    }
}
