//
//  ViewController.swift
//  WorkOut App
//
//  Created by Даниил Заканавский on 26.06.2023.
//

import UIKit

class OverviewController: BaseController {
    private let navBar = OverviewNavBar()

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension OverviewController {
    override func addViews() {
        super.addViews()
        
        view.setupView(navBar)
    }
    
    override func constraintViews() {
        super.constraintViews()
        
        NSLayoutConstraint.activate([
            navBar.topAnchor.constraint(equalTo: view.topAnchor),
            navBar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            navBar.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
    }
    
    override func configureViews() {
        super.configureViews()
        
        navigationController?.navigationBar.isHidden = true
    }
}

