//
//  InputTableViewCell.swift
//  Nano02
//
//  Created by Tiago Camargo Maciel dos Santos on 25/09/25.
//

import UIKit

class InputTableViewCell: UITableViewCell {
    
    static let identifier = "InputCell"
    
    let labelView: UILabel = {
        let labelView = UILabel()
        labelView.translatesAutoresizingMaskIntoConstraints = false
        labelView.text = "Name"
        
        return labelView
    }()
    
    let textField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Your Quiz"
        textField.returnKeyType = .done
        textField.autocapitalizationType = .words
        textField.autocorrectionType = .no
        
        return textField
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        contentView.addSubview(labelView)
        contentView.addSubview(textField)
        
        NSLayoutConstraint.activate([
            labelView.leadingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leadingAnchor),
            labelView.topAnchor.constraint(equalTo: contentView.layoutMarginsGuide.topAnchor),
            labelView.bottomAnchor.constraint(equalTo: contentView.layoutMarginsGuide.bottomAnchor),
            labelView.widthAnchor.constraint(equalTo: contentView.layoutMarginsGuide.widthAnchor, multiplier: 0.3),
            
            textField.leadingAnchor.constraint(equalTo: labelView.trailingAnchor),
            textField.topAnchor.constraint(equalTo: contentView.layoutMarginsGuide.topAnchor),
            textField.bottomAnchor.constraint(equalTo: contentView.layoutMarginsGuide.bottomAnchor),
            textField.trailingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.trailingAnchor),
        ])
    }
}
