//
//  Quiz.swift
//  Nano02
//
//  Created by Tiago Camargo Maciel dos Santos on 23/09/25.
//

import UIKit

struct Quiz: Codable, Identifiable {
    struct ColorPallete: Codable {
        let foreground: String
        let background: String
        let correctAnswer: String
        let wrongAnswer: String
    }
    struct Question: Codable, Identifiable {
        struct Answer: Codable, Identifiable {
            let id: Int
            let description: String
        }
        let id: Int
        let description: String
        let answers: [Answer]
        let correctAnswerId: Int
        let image: Data?
    }
    let id: UUID
    let name: String
    let colorPallete: ColorPallete
    let questions: [Question]
}

class QuizData {
    let encodingKey = "quizzes"
    var quizzes: [Quiz] {
        didSet {
            encodeQuizzes()
        }
    }
    
    init() {
        let decoder = JSONDecoder()
        if let data = UserDefaults.standard.data(forKey: encodingKey) {
            if let decodedData = try? decoder.decode([Quiz].self, from: data) {
                self.quizzes = decodedData
                return
            }
        }
        self.quizzes = []
    }
    
    func encodeQuizzes() {
        let encoder = JSONEncoder()
        if let encodedData = try? encoder.encode(quizzes) {
            UserDefaults.standard.set(encodedData, forKey: encodingKey)
        }
    }
}
