//
//  Quiz.swift
//  Nano02
//
//  Created by Tiago Camargo Maciel dos Santos on 23/09/25.
//

import UIKit

struct Quiz {
    struct ColorPallete {
        let foreground: UIColor
        let background: UIColor
        let correctAnswer: UIColor
        let wrongAnswer: UIColor
    }
    struct Question {
        struct Answer {
            let id: Int
            let description: String
        }
        let id: Int
        let description: String
        let answers: [Answer]
        let correctAnswerId: Int
        let image: UIImage?
    }
    
    let name: String
    let colorPallete: ColorPallete
    let questions: [Question]
}
