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
    
    private let weekView = WeekView()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        addBottomBorder(with: Resourses.Colors.separator, height: 1)
    }
    
    func addAllWorkoutsAction(_ action: Selector, with target: Any?) {
        allWorkoutsButton.addTarget(target,action: action, for: .touchUpInside)
    }
    
    func addAditingAction(_ action: Selector, with target: Any?) {
        addButton.addTarget(target,action: action, for: .touchUpInside)
    }

}

extension OverviewNavBar {
    override func addViews() {
        super.addViews()
        
        addView(titleLabel)
        addView(allWorkoutsButton)
        addView(addButton)
        addView(weekView)
    }
    
    override func layoutViews() {
        super.layoutViews()
        
        NSLayoutConstraint.activate([
            addButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 8),
            addButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            addButton.heightAnchor.constraint(equalToConstant: 28),
            addButton.widthAnchor.constraint(equalToConstant: 28),

            allWorkoutsButton.topAnchor.constraint(equalTo: addButton.topAnchor),
            allWorkoutsButton.trailingAnchor.constraint(equalTo: addButton.leadingAnchor, constant: -15),
            allWorkoutsButton.heightAnchor.constraint(equalToConstant: 28),
            allWorkoutsButton.widthAnchor.constraint(equalToConstant: 130),
            
            titleLabel.centerYAnchor.constraint(equalTo: allWorkoutsButton.centerYAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: allWorkoutsButton.leadingAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            
            weekView.topAnchor.constraint(equalTo: addButton.bottomAnchor, constant: 15),
            weekView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            weekView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            weekView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -15),
            weekView.heightAnchor.constraint(equalToConstant: 47)
        ])
    }
    
    override func configureViews() {
        super.configureViews()
        backgroundColor = .white
        
//        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.text = Resourses.Strings.NavBar.overview
        titleLabel.textColor = Resourses.Colors.titleGray
        titleLabel.font = Resourses.Fonts.helveticaRegular(with: 22)
        
//        allWorkoutsButton.translatesAutoresizingMaskIntoConstraints = false
        allWorkoutsButton.setTitle(Resourses.Strings.Overview.allWorkoutsButton)

//        addButton.translatesAutoresizingMaskIntoConstraints = false
        addButton.setImage(Resourses.Images.Common.add, for: .normal)
        
//        weekView.translatesAutoresizingMaskIntoConstraints = false
    }
}

