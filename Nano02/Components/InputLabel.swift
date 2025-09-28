//
//  InputLabel.swift
//  Nano02
//
//  Created by Tiago Camargo Maciel dos Santos on 25/09/25.
//

import UIKit

class InputLabel: UILabel {
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        font = .systemFont(ofSize: 17, weight: .semibold)
        numberOfLines = 0
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
