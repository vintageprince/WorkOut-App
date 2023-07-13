//
//  WABaseView.swift
//  WorkOut App
//
//  Created by Виктория Заканавская on 05.07.2023.
//

import UIKit

class WABaseView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        constraintViews()
        configureViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

@objc extension WABaseView {
    func setupViews() {}
    func constraintViews() {}
    
    func configureViews() {
        backgroundColor = .white
    }
    
}
