//
//  ImagePromptTableViewCell.swift
//  Nano02
//
//  Created by Tiago Camargo Maciel dos Santos on 26/09/25.
//

import UIKit

class ImagePromptTableViewCell: UITableViewCell {
    static let identifier = "ImagePromptCell"
    var isImageSelected: Bool = false {
        didSet {
            if isImageSelected {
                selectPhotoButton.setTitle("Switch Image", for: .normal)
            } else {
                selectPhotoButton.setTitle("Select an Image", for: .normal)
            }
        }
    }
    
    let selectPhotoButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Select an Image", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 17, weight: .medium)
        button.setImage(UIImage(systemName: "photo"), for: .normal)
        
        button.titleEdgeInsets = .init(top: 0, left: 10, bottom: 0, right: -10)
        
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
        contentView.addSubview(selectPhotoButton)
        
        NSLayoutConstraint.activate([
            selectPhotoButton.leadingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leadingAnchor),
            selectPhotoButton.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
}
