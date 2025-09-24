//
//  ViewController.swift
//  Nano02
//
//  Created by Tiago Camargo Maciel dos Santos on 22/09/25.
//

import UIKit

class MenuViewController: UIViewController {
    private let menuView = MenuView()
    
    override func loadView() {
        view = menuView
        title = "Do you even know me?"
        navigationItem.backButtonDisplayMode = .generic
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        menuView.onPressButton = navigateToNextView
    }
    
    func navigateToNextView() {
        navigationController?.pushViewController(CreateQuizViewController(), animated: true)
    }
}
