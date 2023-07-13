//
//  SecondaryButton.swift
//  WorkOut App
//
//  Created by Даниил Заканавский on 28.06.2023.
//

import UIKit

public enum WAButtonType {
    case primary
    case secondary
}

final class WAButton: UIButton {
    
    private var type: WAButtonType = .primary
    
    private let label: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        return label
    }()
    
    private let iconView: UIImageView = {
        let view = UIImageView()
        view.image = R.Images.Common.downArrow?.withRenderingMode(.alwaysTemplate)
        return view
    }()
    
    init(with type: WAButtonType) {
        super.init(frame: .zero)
        self.type = type

        addViews()
        constraintViews()
        configureViews()
    }

    required init?(coder: NSCoder) {
        super.init(frame: .zero)

        
        addViews()
        constraintViews()
        configureViews()
        
    }
    
    func setTitle(_ title: String?) {
        label.text = title

    }
}

private extension WAButton {
    
    func addViews() {
        setupView(label)
        setupView(iconView)
    }
    
    func constraintViews() {
        var horizontalOffset: CGFloat {
            switch type {
            case .primary: return 0
            case .secondary: return 10
            }
        }
        
        NSLayoutConstraint.activate([
            iconView.centerYAnchor.constraint(equalTo: centerYAnchor),
            iconView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -horizontalOffset),
            iconView.heightAnchor.constraint(equalToConstant: 5),
            iconView.widthAnchor.constraint(equalToConstant: 10),
            
            label.centerYAnchor.constraint(equalTo: centerYAnchor),
            label.trailingAnchor.constraint(equalTo: iconView.leadingAnchor, constant: -10),
            label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: horizontalOffset * 2)
        ])
    }
    
    func configureViews() {
        switch type {
        case .primary:
            label.textColor = R.Colors.inactive
            iconView.tintColor = R.Colors.inactive
            label.font = R.Fonts.helveticaRegular(with: 13)

        case .secondary:
            backgroundColor = R.Colors.secondary
            layer.cornerRadius = 14
            label.textColor = R.Colors.active
            iconView.tintColor = R.Colors.active
            label.font = R.Fonts.helveticaRegular(with: 15)

        }
        
        makeSystem(self)
    }
}
