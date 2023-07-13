//
//  BaseController.swift
//  WorkOut App
//
//  Created by Даниил Заканавский on 28.06.2023.
//

import UIKit

enum NavBarPosition {
    case left
    case right
}

class BaseController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addViews()
        constraintViews()
        configureViews()
    }
}

@objc extension BaseController {
    
    func addViews() {}
    func constraintViews() {}
    func configureViews() {
        view.backgroundColor = R.Colors.background
    }
    
    func navBarLeftButtonHandler() {
        print("NavBar Left Button tapped")
    }
    
    func navBarRightButtonHandler() {
        print("NavBar Right Button tapped")
    }
}

extension BaseController {
    func addNavBarButton(at position: NavBarPosition, with title: String) {
        let button = UIButton(type: .system)
        button.setTitle(title, for: .normal)
        button.setTitleColor(R.Colors.active, for: .normal)
        button.setTitleColor(R.Colors.inactive, for: .disabled)
        button.titleLabel?.font = R.Fonts.helveticaRegular(with: 17)

        switch position {
        case .left:
            button.addTarget(self, action: #selector(navBarLeftButtonHandler), for: .touchUpInside)
            navigationItem.leftBarButtonItem = UIBarButtonItem(customView: button)
        case .right:
            button.addTarget(self, action: #selector(navBarRightButtonHandler), for: .touchUpInside)
            navigationItem.rightBarButtonItem = UIBarButtonItem(customView: button)

        }
    }
}
