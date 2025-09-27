//
//  LeaderboardTableViewController.swift
//  Nano02
//
//  Created by Tiago Camargo Maciel dos Santos on 27/09/25.
//

import UIKit

class LeaderboardTableViewController: UITableViewController {
    let quizModel: Quiz
    var respondentKeys: [String] {
        quizModel.respondentsScore.keys.sorted { first, second in
            let firstScore = quizModel.respondentsScore[first] ?? 0
            let secondScore = quizModel.respondentsScore[second] ?? 0
            
            if firstScore > secondScore {
                return true
            } else if firstScore == secondScore {
                return first < second
            } else {
                return false
            }
        }
    }
    
    // MARK: - Initializers
    init(quizModel: Quiz) {
        self.quizModel = quizModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return quizModel.respondentsScore.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let name = respondentKeys[indexPath.row]
        let score = quizModel.respondentsScore[name] ?? 0
        
        let cell = UITableViewCell()
        let nameLabel = UILabel()
        nameLabel.text = name
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        let scoreLabel = UILabel()
        scoreLabel.text = "\(score)/\(quizModel.questions.count)"
        scoreLabel.translatesAutoresizingMaskIntoConstraints = false
        
        cell.contentView.addSubview(nameLabel)
        cell.contentView.addSubview(scoreLabel)
        
        cell.selectionStyle = .none

        NSLayoutConstraint.activate([
            nameLabel.leadingAnchor.constraint(equalTo: cell.contentView.layoutMarginsGuide.leadingAnchor),
            nameLabel.widthAnchor.constraint(equalTo: cell.contentView.layoutMarginsGuide.widthAnchor, multiplier: 0.5),
            nameLabel.centerYAnchor.constraint(equalTo: cell.contentView.layoutMarginsGuide.centerYAnchor),
            
            scoreLabel.trailingAnchor.constraint(equalTo: cell.contentView.layoutMarginsGuide.trailingAnchor),
            scoreLabel.centerYAnchor.constraint(equalTo: cell.contentView.layoutMarginsGuide.centerYAnchor),
            
        ])
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        "LEADERBOARD"
    }

}
