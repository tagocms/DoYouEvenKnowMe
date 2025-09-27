//
//  Quiz.swift
//  Nano02
//
//  Created by Tiago Camargo Maciel dos Santos on 23/09/25.
//

import UIKit

struct Quiz: Codable, Identifiable {
    struct ColorPallete: Codable {
        var foreground: String?
        var background: String?
        var correctAnswer: String?
        var wrongAnswer: String?
        var button: String?
    }
    struct Question: Codable, Identifiable {
        struct Answer: Codable, Identifiable {
            let id: Int
            var description: String?
        }
        let id: Int
        var description: String?
        var answers: [Answer]
        var correctAnswerId: Int?
        var image: Data?
    }
    let id: UUID
    var title: String?
    var description: String?
    var colorPallete: ColorPallete
    var questions: [Question]
    var dateCreated: Date
    var respondentsScore: [String: Int]
    
    init(id: UUID, title: String, description: String, colorPallete: ColorPallete, questions: [Question], dateCreated: Date = Date.now) {
        self.id = id
        self.title = title
        self.description = description
        self.colorPallete = colorPallete
        self.questions = questions
        self.dateCreated = dateCreated
        self.respondentsScore = [:]
    }
    
    init() {
        self.id = UUID()
        self.title = ""
        self.description = ""
        self.colorPallete = ColorPallete()
        self.questions = []
        self.dateCreated = Date.now
        self.respondentsScore = [:]
    }
}

class QuizData {
    static private let encodingKey = "quizzes"
    static let shared = QuizData()
    static let sampleData: [Quiz] = [
        Quiz(
            id: UUID(),
            title: "Quiz exemplo",
            description: "Descrição de exemplo",
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
            description: "Descrição de exemplo",
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
            description: "Descrição de exemplo",
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
            description: "Descrição de exemplo",
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
            encodeAndSaveQuizzes()
            quizzes.sort { $0.dateCreated > $1.dateCreated }
        }
    }
    
    private init() {
        let decoder = JSONDecoder()
        let URL = URL.documentsDirectory.appending(path: Self.encodingKey)
        
        if let data = try? Data(contentsOf: URL) {
            if let decodedData = try? decoder.decode([Quiz].self, from: data) {
                self.quizzes = decodedData.sorted { $0.dateCreated > $1.dateCreated }
                return
            }
        }
        self.quizzes = []
    }
    
    private func encodeAndSaveQuizzes() {
        let encoder = JSONEncoder()
        if let encodedData = try? encoder.encode(quizzes) {
            let url = URL.documentsDirectory.appending(path: Self.encodingKey)
            do {
                try encodedData.write(to: url, options: [.atomic, .completeFileProtection])
            } catch {
                print("Data unable to be written.")
            }
        }
    }
}
