//
//  AlternativeTableViewCell.swift
//  Nano02
//
//  Created by Tiago Camargo Maciel dos Santos on 26/09/25.
//

import UIKit

class AlternativeTableViewCell: UITableViewCell {
    static let identifier = "AlternativeCell"
    
    let labelView: UILabel = {
        let labelView = UILabel()
        labelView.translatesAutoresizingMaskIntoConstraints = false
        labelView.text = "Label"
        
        return labelView
    }()
    
    let textField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Placeholder Text"
        textField.returnKeyType = .done
        textField.autocapitalizationType = .words
        textField.autocorrectionType = .no
        
        return textField
    }()
    
    let checkMarkButton: CheckmarkButton = {
        let button = CheckmarkButton()
        
        return button
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        self.selectionStyle = .none
        contentView.addSubview(labelView)
        contentView.addSubview(textField)
        contentView.addSubview(checkMarkButton)
        
        NSLayoutConstraint.activate([
            labelView.leadingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leadingAnchor),
            labelView.topAnchor.constraint(equalTo: contentView.layoutMarginsGuide.topAnchor),
            labelView.bottomAnchor.constraint(equalTo: contentView.layoutMarginsGuide.bottomAnchor),
            labelView.widthAnchor.constraint(equalTo: contentView.layoutMarginsGuide.widthAnchor, multiplier: 0.3),
            
            textField.leadingAnchor.constraint(equalTo: labelView.trailingAnchor),
            textField.topAnchor.constraint(equalTo: contentView.layoutMarginsGuide.topAnchor),
            textField.bottomAnchor.constraint(equalTo: contentView.layoutMarginsGuide.bottomAnchor),
            textField.widthAnchor.constraint(equalTo: contentView.layoutMarginsGuide.widthAnchor, multiplier: 0.6),
            
            checkMarkButton.trailingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.trailingAnchor),
            checkMarkButton.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
}
