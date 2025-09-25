//
//  ColorPalleteTableViewCell.swift
//  Nano02
//
//  Created by Tiago Camargo Maciel dos Santos on 25/09/25.
//

import UIKit

class ColorPalleteTableViewCell: UITableViewCell {
    
    static let identifier = "ColorPalleteCell"
    
    let labelView: UILabel = {
        let labelView = UILabel()
        labelView.translatesAutoresizingMaskIntoConstraints = false
        labelView.text = "Label"
        
        return labelView
    }()
    
    let colorWell: UIColorWell = {
        let colorWell = UIColorWell()
        colorWell.translatesAutoresizingMaskIntoConstraints = false
        colorWell.supportsAlpha = false
        colorWell.contentMode = .scaleAspectFit
        
        return colorWell
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
        contentView.addSubview(colorWell)
        
        NSLayoutConstraint.activate([
            labelView.leadingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leadingAnchor),
            labelView.topAnchor.constraint(equalTo: contentView.layoutMarginsGuide.topAnchor),
            labelView.bottomAnchor.constraint(equalTo: contentView.layoutMarginsGuide.bottomAnchor),
            labelView.widthAnchor.constraint(equalTo: contentView.layoutMarginsGuide.widthAnchor, multiplier: 0.6),
            
            colorWell.topAnchor.constraint(equalTo: contentView.layoutMarginsGuide.topAnchor),
            colorWell.bottomAnchor.constraint(equalTo: contentView.layoutMarginsGuide.bottomAnchor),
            colorWell.trailingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.trailingAnchor),
        ])
    }
}
