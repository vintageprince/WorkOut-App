//
//  OverviewNavBar.swift
//  WorkOut App
//
//  Created by Виктория Заканавская on 05.07.2023.
//

import UIKit
final class OverviewNavBar: BaseView {
    
    private let titleLabel = UILabel()
    private let allWorkoutsButton = SecondaryButton()
    private let addButton = UIButton()
    
}

extension OverviewNavBar {
    override func addViews() {
        super.addViews()
        
        addSubview(titleLabel)
        addSubview(allWorkoutsButton)
        addSubview(addButton)
    }
    
    override func layoutViews() {
        super.layoutViews()
    }
    
    override func configure() {
        super.configure()
        backgroundColor = .white
        addBottomBorder(with: Resourses.Colors.separator, height: 1)
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.text = Resourses.Strings.NavBar.overview
        titleLabel.textColor = Resourses.Colors.titleGray
        titleLabel.font = Resourses.Fonts.helveticaRegular(with: 22)
        
        allWorkoutsButton.translatesAutoresizingMaskIntoConstraints = false
        allWorkoutsButton.setTitle(Resourses.Strings.Overview.allWorkoutsButton)
        allWorkoutsButton.addTarget(self,
                                    action: #selector(allWorkoutsButtonAction),
                                    for: .touchUpInside)
        
        addButton.translatesAutoresizingMaskIntoConstraints = false

    }
}

@objc extension OverviewNavBar {
    func allWorkoutsButtonAction() {
        print("allWorkoutsButton tapped")
    }
}
