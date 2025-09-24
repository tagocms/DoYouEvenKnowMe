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
    let title: String
    let colorPallete: ColorPallete
    let questions: [Question]
}

class QuizData {
    static private let encodingKey = "quizzes"
    static let shared = QuizData()
    static let sampleData: [Quiz] = [
        Quiz(
            id: UUID(),
            title: "Quiz exemplo",
            colorPallete: Quiz.ColorPallete(
                foreground: "#FFEEAA",
                background: "#AAEEFF",
                correctAnswer: "#FFAAEE",
                wrongAnswer: "#FFAAEE"
            ),
            questions: []
        ),
        Quiz(
            id: UUID(),
            title: "Quiz exemplo",
            colorPallete: Quiz.ColorPallete(
                foreground: "#FFEEAA",
                background: "#AAEEFF",
                correctAnswer: "#FFAAEE",
                wrongAnswer: "#FFAAEE"
            ),
            questions: []
        ),
        Quiz(
            id: UUID(),
            title: "Quiz exemplo",
            colorPallete: Quiz.ColorPallete(
                foreground: "#FFEEAA",
                background: "#AAEEFF",
                correctAnswer: "#FFAAEE",
                wrongAnswer: "#FFAAEE"
            ),
            questions: []
        ),
        Quiz(
            id: UUID(),
            title: "Quiz exemplo",
            colorPallete: Quiz.ColorPallete(
                foreground: "#FFEEAA",
                background: "#AAEEFF",
                correctAnswer: "#FFAAEE",
                wrongAnswer: "#FFAAEE"
            ),
            questions: []
        ),
    ]
    
    var quizzes: [Quiz] {
        didSet {
            encodeQuizzes()
        }
    }
    
    private init() {
        let decoder = JSONDecoder()
        if let data = UserDefaults.standard.data(forKey: Self.encodingKey) {
            if let decodedData = try? decoder.decode([Quiz].self, from: data) {
                self.quizzes = decodedData
                return
            }
        }
        self.quizzes = []
    }
    
    private func encodeQuizzes() {
        let encoder = JSONEncoder()
        if let encodedData = try? encoder.encode(quizzes) {
            UserDefaults.standard.set(encodedData, forKey: Self.encodingKey)
        }
    }
}
