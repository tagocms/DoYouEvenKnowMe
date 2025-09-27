//
//  QuizOptionButton.swift
//  Nano02
//
//  Created by Tiago Camargo Maciel dos Santos on 26/09/25.
//

import UIKit

class QuizOptionButton: UIButton {
    var id: Int?
    
    // MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        configuration = .filled()
        configuration?.buttonSize = .medium
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
