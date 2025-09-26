//
//  CustomLargeButton.swift
//  Nano02
//
//  Created by Tiago Camargo Maciel dos Santos on 25/09/25.
//

import UIKit

class CustomLargeButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        setTitle("Title", for: .normal)
        configuration = .filled()
        configuration?.buttonSize = .large
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
