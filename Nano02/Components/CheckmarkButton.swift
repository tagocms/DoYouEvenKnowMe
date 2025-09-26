//
//  CheckmarkButton.swift
//  Nano02
//
//  Created by Tiago Camargo Maciel dos Santos on 26/09/25.
//

import UIKit

class CheckmarkButton: UIButton {
    private var checkmarkImage = UIImageView(image: UIImage(systemName: "square"))
    var id: Int?
    
    var isChecked = false {
        didSet {
            if isChecked {
                checkmarkImage.image = UIImage(systemName: "checkmark.square.fill")
            } else {
                checkmarkImage.image = UIImage(systemName: "square")
            }
        }
    }
    
    override var isEnabled: Bool {
        didSet {
            if isEnabled {
                checkmarkImage.tintColor = .systemBlue
            } else {
                checkmarkImage.tintColor = .lightGray
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        
        
        addSubview(checkmarkImage)
        
        NSLayoutConstraint.activate([
            checkmarkImage.centerYAnchor.constraint(equalTo: centerYAnchor),
            checkmarkImage.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
